from sqlalchemy import Column, Integer, ForeignKey
from db import Base

class Act_tags(Base):
    __tablename__ = 'act_tags'

    id = Column(Integer, primary_key=True, index=True)
    act_fk = Column(Integer, ForeignKey('acts.id'))
    tag = Column(Integer, ForeignKey('tags.id'))