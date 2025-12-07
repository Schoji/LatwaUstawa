from enum import Enum
from typing import List
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
    title: str
    ai_summary: str
    categories: List[LawCategory]