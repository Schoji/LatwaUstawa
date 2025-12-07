from sqlalchemy import Column, Integer, ForeignKey
from sqlalchemy.orm import relationship
from db import Base

class Act_tags(Base):
    __tablename__ = 'act_tags'

    id = Column(Integer, primary_key=True, index=True)
    act_fk = Column(Integer, ForeignKey('acts.id'))
    tag = Column(Integer, ForeignKey('tags.id'))

    act = relationship("Acts", back_populates="tags")