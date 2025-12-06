from fastapi import Depends
from typing import Annotated
from sqlalchemy.orm import Session
from .db_config import SessionLocal

# Create database session and safely close one 
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

db_dependency = Depends(get_db)