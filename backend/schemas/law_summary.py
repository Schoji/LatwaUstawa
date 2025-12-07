from enum import Enum
from typing import List, Optional
from pydantic import BaseModel

class LawCategory(str, Enum):
    PODATKI = "Podatki"
    SRODOWISKO = "Środowisko"
    ZDROWIE = "Zdrowie"
    CYFRYZACJA = "Cyfryzacja"
    EDUKACJA = "Edukacja"
    ROLNICTWO = "Rolnictwo"
    BEZPIECZENSTWO = "Bezpieczeństwo"
    INNE = "Inne"

class LawSummary(BaseModel):
    title: Optional[str] = None
    ai_summary: Optional[str] = None
    categories: Optional[List[LawCategory]] = [None]