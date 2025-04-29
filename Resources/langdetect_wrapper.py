import logging
logging.basicConfig(level=logging.DEBUG)
logging.debug("langdetect.py: Starting import")
from langdetect import detect
logging.debug("langdetect.py: Finished import")

def Get_Language(text: str) -> str:
    return detect(text)
