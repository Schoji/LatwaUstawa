from sqlalchemy import Column, Integer, String
from db import Base

class Tags(Base):
    __tablename__ = 'tags'

    id = Column(Integer, primary_key=True, index=True)
    name = Column(String(30), nullable=False)