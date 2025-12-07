from sqlalchemy import Column, Integer, String
from db import Base

class Sources(Base):
    __tablename__ = 'sources'

    id = Column(Integer, primary_key=True, index=True)
    sejm_api_id = Column(String(50), nullable=False)