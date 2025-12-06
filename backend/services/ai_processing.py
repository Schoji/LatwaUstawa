import os
import json
from openai import OpenAI, APIError
from dotenv import load_dotenv
from pydantic import ValidationError
from schemas import LawSummary

load_dotenv()

system_prompt = (
    "Jesteś precyzyjnym analitykiem prawnym. Twoim zadaniem jest streszczenie "
    "uzasadnienia ustawy zawartego w polu 'raw_text' w języku polskim. Zawsze "
    "zwracaj odpowiedź WYŁĄCZNIE w formacie JSON, bazując na podanym "
    f"schemacie {LawSummary.schema_json()}. Musisz zawrzeć dokładnie 3-6 najważniejszych zmian."
    "Pole 'categories' musi być LISTĄ STRINGÓW z enuma"
)

raw_text = (
    "Projekt niniejszej ustawy ma na celu zwiększenie efektywności selektywnej zbiórki zużytego sprzętu elektronicznego i elektrycznego (ZSEE) w Polsce. Obecny wskaźnik recyklingu na poziomie 45% jest niewystarczający w świetle zobowiązań unijnych na rok 2030. Kluczowe zmiany przewidują wprowadzenie nowej stawki opłaty produktowej dla wprowadzających sprzęt na rynek, która zostanie zwiększona o 15% z dniem 1 kwietnia 2026 roku. Szacuje się, że ta zmiana wygeneruje dodatkowe 150 milionów złotych rocznie. Środki te zostaną w całości przeznaczone na dofinansowanie budowy 50 nowoczesnych Gminnych Punktów Selektywnej Zbiórki Odpadów Komunalnych (PSZOK) w gminach o najniższych wskaźnikach zbiórki w województwach wschodnich. Ponadto, wprowadza się obowiązek dla dużych placówek handlowych (o powierzchni sprzedaży powyżej 400 m²), aby prowadziły bezpłatną zbiórkę drobnego ZSEE (np. telefonów komórkowych, baterii) niezależnie od zakupu nowego sprzętu. Obowiązek ten wejdzie w życie 1 lipca 2026 roku. Ustawa nakłada również sankcje administracyjne na jednostki samorządu terytorialnego (gminy), które nie osiągną minimalnego progu 65% wskaźnika recyklingu ZSEE do końca 2027 roku. Ostatecznym celem regulacji jest podniesienie wskaźnika recyklingu do poziomu 70% do 2030 roku."
)

def law_summarize(raw_text:str) -> LawSummary:
    HF_TOKEN = os.environ.get("HUGGINGFACE_API_KEY")

    if not HF_TOKEN:
        print("Błąd łączenia z API")
        return None

    client = OpenAI(
        base_url="https://router.huggingface.co/v1",
        api_key=HF_TOKEN
    )

    try:
        completion = client.chat.completions.create(
            model="mistralai/Mistral-7B-Instruct-v0.2:featherless-ai",
            messages=[
                {
                    "role": "system",
                    "content": system_prompt
                },
                {
                    "role": "user",
                    "content": f"Oto treść uzasadnienia ustawy do streszczenia: {raw_text}"
                }
            ],
            response_format={"type": "json_object"},
            temperature=0.1
        )
    except APIError as e:
        print(f"Błąd komunikacji API: {e}")
    except Exception as e:
        print(f"Nieznany błąd: {e}")

    # formatting
    try:
        response_unformated = completion.choices[0].message.content
        first_bracket_index = response_unformated.find('{')
        last_bracket_index = response_unformated.rfind('}')
        if first_bracket_index == -1 or last_bracket_index == -1:
            raise json.JSONDecodeError("Brak klamer JSON w odpowiedzi", response_unformated, 0)
        reponse_formated = response_unformated[first_bracket_index:last_bracket_index+1]

        with open("result.json", "a", encoding='utf-8') as f:
            f.write(reponse_formated)
    
    except (IndexError, json.JSONDecodeError) as e:
        print(f"Błąd parsowania JSON: {e}")
        return None

    # validation
    try:
        validated_response = LawSummary.parse_raw(reponse_formated)
        return validated_response

    except ValidationError as e:
        print(f"Błąd walidacji JSON: {e}")
        return None
