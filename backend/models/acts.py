from sqlalchemy import Column, Integer, String, ForeignKey, Enum, DateTime
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
    
    title = Column(String(200), nullable=False)
    submission_date = Column(DateTime, nullable=False)
    term_number = Column(Integer, nullable=False)
    is_urgent = Column(Integer, nullable=False)  # 0 or 1
    
    ai_summary = Column(String(2000), nullable=True)
    status = Column(Enum(Status_type), nullable=False)
    origin = Column(Enum(ActOrigin), nullable=False)
    
    sponsor_party = Column(String(50), nullable=True)
    representative_name = Column(String(50), nullable=True)

    justification_pdf_url = Column(String(200), nullable=True)
    source_link_url = Column(String(200), nullable=True)

    likes_count = Column(Integer, default=0)