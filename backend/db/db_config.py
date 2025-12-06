from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker, Session
from sqlalchemy.ext.declarative import declarative_base

SELECTED_DB = "mysql+pymysql"
DB_USER = "API_ADMIN"
DB_PASSWORD = "password123"
DB_HOST = "localhost"
DB_PORT = "3306"
DB_NAME = "latwaustawa_api"

DATABASE_URL: str = f"{(SELECTED_DB)}://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DB_NAME}"
engine = create_engine(DATABASE_URL)

SessionLocal = sessionmaker(autocommit=False ,autoflush=False, bind=engine)

Base = declarative_base()