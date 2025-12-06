from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
# from routes import process_data, legislation_data
from models import *  # Ensure all models are imported
from db import engine, Base

# Create instance of an FastApi app
app = FastAPI()

# Allow specific origins
origins = [
    "http://localhost:8080",  # Mobile app frontend
    "http://127.0.0.1:8080",  # Alternative localhost URL
]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],  # Allow all HTTP methods
    allow_headers=["*"],  # Allow all headers
)

# Include API routers
# app.include_router(process_data)
# app.include_router(legislation_data)

# Initialize and create the database tables
Base.metadata.create_all(bind=engine)

# Default route
@app.get("/")
def Deafault():
    return {"message": "Welcome to the FastAPI app!"}