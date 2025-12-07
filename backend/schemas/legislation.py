from pydantic import BaseModel
from typing import List, Optional

class Link(BaseModel):
    href: str
    rel: str

class Stage(BaseModel):
    date: Optional[str] = None
    stageName: str
    stageType: Optional[str] = None
    committeeCode: Optional[str] = None
    printNumber: Optional[str] = None
    sittingNum: Optional[int] = None
    decision: Optional[str] = None
    textAfter3: Optional[str] = None
    children: Optional[List['Stage']] = None

class PrintDetailRecursive(BaseModel):
    number: str
    title: str
    documentDate: Optional[str] = None
    changeDate: Optional[str] = None
    deliveryDate: Optional[str] = None
    term: Optional[int] = None
    attachments: List[str] = []
    processPrint: List[str] = []
    numberAssociated: List[str] = []

class PrintDetails(PrintDetailRecursive):
    additionalPrints: List[PrintDetailRecursive] = []

class ProcessDetails(BaseModel):
    UE: Optional[str] = "NO"
    changeDate: Optional[str] = None
    description: Optional[str] = None
    documentDate: Optional[str] = None
    documentType: Optional[str] = None
    number: str
    passed: Optional[bool] = None
    processStartDate: Optional[str] = None
    shortenProcedure: Optional[bool] = None
    stages: List[Stage] = []
    term: Optional[int] = None
    title: str
    urgencyStatus: Optional[str] = None
    webGeneratedDate: Optional[str] = None

class LegislationOutput(BaseModel):
    UE: Optional[str] = "NO"
    changeDate: Optional[str] = None
    closureDate: Optional[str] = None
    comments: Optional[str] = None
    description: Optional[str] = None
    documentDate: Optional[str] = None
    documentType: Optional[str] = None
    documentTypeEnum: Optional[str] = None
    links: List[Link] = []
    number: str
    passed: bool
    processStartDate: Optional[str] = None
    shortenProcedure: Optional[bool] = None
    term: int
    title: str
    titleFinal: Optional[str] = None
    urgencyStatus: Optional[str] = None
    webGeneratedDate: Optional[str] = None
    
    print_details: Optional[PrintDetails] = None
    process_details: Optional[ProcessDetails] = None

    class Config:
        from_attributes = True