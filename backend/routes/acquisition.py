import io
import httpx
from datetime import datetime
from docx import Document
from typing import Optional, List, Any, Dict
from fastapi import APIRouter, Depends, HTTPException, status
from fastapi.responses import FileResponse, JSONResponse
from sqlalchemy.orm import Session
from db import db_dependency
from models import Acts, Status_type, ActOrigin, Sources, Tags, Act_tags
from schemas import SyncResponse, LawSummary
from services import law_summarize as ai_processing

router = APIRouter(prefix="/acquisition", tags=["acquisition"])

# Constants and configurations
SEJM_API_URL = "https://api.sejm.gov.pl"
TERM = 10

async def fetch_docx_text(client: httpx.AsyncClient, print_number: str) -> tuple[Optional[str], str]:
    """Pobiera plik DOCX i wyciąga tekst."""
    resp = await client.get(f"{SEJM_API_URL}/sejm/term{TERM}/prints/{print_number}")
    if resp.status_code != 200: return None, ""

    data = resp.json()
    attachments = data.get("attachments", [])
    
    # Szukamy pliku DOCX (najlepiej uzasadnienia)
    target_file = next((f for f in attachments if "uzasadnienie" in f.lower() and f.endswith(".docx")), None)
    if not target_file:
        target_file = next((f for f in attachments if f.endswith(".docx")), None)
    
    if not target_file: return None, ""

    file_url = f"{SEJM_API_URL}/sejm/term{TERM}/prints/{print_number}/{target_file}"
    file_resp = await client.get(file_url)
    
    if file_resp.status_code != 200: return file_url, ""

    text_content = ""
    try:
        docx_file = io.BytesIO(file_resp.content)
        document = Document(docx_file)
        # Pobieramy pierwsze 150 akapitów
        paragraphs = [p.text for p in document.paragraphs if p.text.strip()]
        text_content = "\n".join(paragraphs[:150]) 
    except Exception as e:
        print(f"Error reading DOCX: {e}")

    return file_url, text_content

router = APIRouter()

# --- Funkcje pomocnicze (logika biznesowa) ---

def parse_date(date_str: str | None) -> datetime:
    if not date_str:
        return datetime.now()
    try:
        # Obsługa formatu ISO lub YYYY-MM-DD
        if 'T' in date_str:
            return datetime.fromisoformat(date_str)
        return datetime.strptime(date_str, '%Y-%m-%d')
    except ValueError:
        return datetime.now()

def determine_status(data: dict) -> Status_type:
    if data.get('passed'):
        return Status_type.PASSED
    if data.get('closureDate'):
        return Status_type.REJECTED # lub ARCHIVED
    return Status_type.DRAFTED

def determine_origin(title: str, doc_type: str) -> ActOrigin:
    t = title.lower()
    if "rządowy" in t or "rada ministrów" in t: return ActOrigin.GOVERNMENT
    if "senacki" in t or "senat" in t: return ActOrigin.SENATE
    if "prezydencki" in t or "prezydent" in t: return ActOrigin.PRESIDENT
    if "komisyjny" in t: return ActOrigin.COMMITTEE
    if "obywatelski" in t or "oskarżyciela prywatnego" in t: return ActOrigin.CITIZENS
    return ActOrigin.DEPUTIES

def get_print_number(entry: dict) -> str | None:
    """Próbuje znaleźć numer druku, który zawiera załączniki (uzasadnienie)."""
    # Często pliki są podpięte pod etap prac w komisjach (numer druku sprawozdania)
    details = entry.get('process_details', {})
    stages = details.get('stages', [])
    
    for stage in stages:
        if stage.get('children'):
            for child in stage['children']:
                if child.get('printNumber'):
                    return child['printNumber']
        if stage.get('printNumber'):
            return stage['printNumber']
            
    # Fallback do głównego numeru, jeśli to jest druk sejmowy
    return entry.get('number')

def extract_representative(entry: dict) -> str | None:
    details = entry.get('process_details', {})
    stages = details.get('stages', [])
    for stage in stages:
        if stage.get('children'):
            for child in stage['children']:
                if child.get('rapporteurName'):
                    return child['rapporteurName']
    return None

# --- Główny Endpoint ---

@router.post("/manualpost", response_model=SyncResponse)
async def manual_post_legislation(
    payload: List[Dict[str, Any]], 
    db: Session = db_dependency
):
    added_count = 0
    errors = []
    
    # Używamy jednego klienta httpx dla wszystkich żądań w pętli
    async with httpx.AsyncClient() as client:
        for entry in payload:
            try:
                # 1. Sprawdzenie czy wpis już istnieje (po adresie/ELI)
                sejm_id = entry.get('address') or entry.get('ELI')
                if not sejm_id:
                    continue

                existing_source = db.query(Sources).filter(Sources.sejm_api_id == sejm_id).first()
                if existing_source:
                    # Jeśli istnieje, pomijamy (lub można zaimplementować update)
                    continue

                # 2. Utworzenie źródła
                new_source = Sources(sejm_api_id=sejm_id)
                db.add(new_source)
                db.flush() # Flush, aby uzyskać new_source.id

                # 3. Ekstrakcja danych podstawowych
                title = entry.get('titleFinal') or entry.get('title') or "Brak tytułu"
                submit_date = parse_date(entry.get('documentDate'))
                is_urgent = 1 if entry.get('urgencyStatus') != 'NORMAL' else 0
                term = entry.get('term', 10)
                
                status_enum = determine_status(entry)
                origin_enum = determine_origin(title, entry.get('documentType', ''))
                representative = extract_representative(entry)
                
                # Link do źródła
                source_link = next((l['href'] for l in entry.get('links', []) if l.get('rel') == 'isap'), None)
                if not source_link and entry.get('links'):
                    source_link = entry['links'][0].get('href')

                # 4. Pobieranie treści DOCX i generowanie AI Summary
                print_num = get_print_number(entry)
                ai_summary_text = None
                justification_url = None

                if print_num:
                    # Wywołanie Twojej funkcji fetch_docx_text
                    file_url, raw_text = await fetch_docx_text(client, print_num)
                    
                    if file_url:
                        justification_url = file_url
                    
                    if raw_text and len(raw_text) > 50:
                        try:
                            # Wywołanie serwisu AI
                            ai_summary_text = ai_processing(raw_text)
                        except Exception as e:
                            errors.append(f"AI Error for {sejm_id}: {str(e)}")

                # 5. Zapis aktu prawnego
                new_act = Acts(
                    source_fk=new_source.id,
                    title=title[:200], # Przycięcie do limitu kolumny
                    submission_date=submit_date,
                    term_number=term,
                    is_urgent=is_urgent,
                    ai_summary=ai_summary_text, # Może być None
                    status=status_enum,
                    origin=origin_enum,
                    sponsor_party=None, # JSON nie zawiera wprost partii
                    representative_name=representative,
                    justification_pdf_url=justification_url, # Tutaj URL do docx/pdf
                    source_link_url=source_link,
                    likes_count=0
                )
                
                db.add(new_act)
                added_count += 1

            except Exception as e:
                db.rollback()
                errors.append(f"Error processing entry {entry.get('address', '?')}: {str(e)}")
                continue
        
        # Zatwierdzenie wszystkich zmian
        try:
            db.commit()
        except Exception as e:
            db.rollback()
            return SyncResponse(processed=len(payload), added=0, errors=[f"Database commit error: {str(e)}"])

    return SyncResponse(
        processed=len(payload),
        added=added_count,
        errors=errors
    )