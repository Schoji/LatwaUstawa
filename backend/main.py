from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from models import *  # Ensure all models are imported
from db import engine, Base
from routes.acquisition import router_acquisition as acquisition_router
from routes.legislation import router_legislation as legislation_router
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
app.include_router(legislation_router) # Data passed to frontend
app.include_router(acquisition_router) # Data acquisition from Sejm API

# Initialize and create the database tables
try:
    Base.metadata.create_all(bind=engine)
except Exception as e:
    print(f"Error message: {e}")

# Default route
@app.get("/")
def Deafault():
    return {"message": "Welcome to the FastAPI app!"}