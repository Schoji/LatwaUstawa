from typing import List
from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from db import db_dependency
from models import Acts
from schemas import LegislationOutput

router_legislation = APIRouter(prefix="/legislation", tags=["legislation"])

@router_legislation.get("/", response_model=List[LegislationOutput])
def get_legislation(db: Session = db_dependency):
    acts = db.query(Acts).all()
    # Zwracamy raw_data, bo tam siedzi cała ta skomplikowana struktura
    return [act.raw_data for act in acts if act.raw_data]