from sqlalchemy import Column, Integer, Boolean, JSON, Text, String, ForeignKey, Enum, DateTime
import enum
from sqlalchemy.orm import relationship
from db import Base

class Status_type(int, enum.Enum):
    DRAFTED = 1
    PASSED = 2
    REJECTED = 3
    ARCHIVED = 4

class ActOrigin(int, enum.Enum):
    GOVERNMENT = 1
    DEPUTIES = 2
    SENATE = 3
    CITIZENS = 4
    PRESIDENT = 5
    COMMITTEE = 6

class Acts(Base):
    __tablename__ = 'acts'

    id = Column(Integer, primary_key=True, index=True)
    source_fk = Column(Integer, ForeignKey('sources.id'))
    
    title = Column(String(500), nullable=False) # Zwiększono limit znaków, tytuły bywają długie
    submission_date = Column(DateTime, nullable=True)
    term_number = Column(Integer, nullable=False) # Kadencja (np. 10)
    print_number = Column(String(20), nullable=True) # Nowe pole: Numer druku (np. "128")
    
    is_urgent = Column(Integer, default=0)  # 0 or 1
    status = Column(Enum(Status_type), nullable=False, default=Status_type.DRAFTED)
    origin = Column(Enum(ActOrigin), nullable=False, default=ActOrigin.DEPUTIES)
    ue_legislation = Column(Boolean, default=False) # Nowe pole: Czy dotyczy UE (z pola "UE": "NO")

    description = Column(Text, nullable=True) # Nowe pole: Opis projektu z JSON
    ai_summary = Column(Text, nullable=True)  # Twoje podsumowanie wygenerowane przez AI
    
    representative_name = Column(String(100), nullable=True) # Np. Poseł sprawozdawca
    justification_pdf_url = Column(String(300), nullable=True) # Link do pliku DOCX/PDF
    source_link_url = Column(String(300), nullable=True) # Link do strony Sejmu

    raw_data = Column(JSON, nullable=True) 

    likes_count = Column(Integer, default=0)

    tags = relationship("Act_tags", back_populates="act")