from pydantic import BaseModel
from typing import List

class SyncResponse(BaseModel):
    processed: int
    added: int
    errors: List[str]