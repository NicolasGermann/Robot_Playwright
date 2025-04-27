*** Settings ***
Library    Browser

*** Test Cases ***
Überschrift Abfragen
    New Page    https://studieren.htwsaar.de
    ${ueberschrift}=    Get Text    h1
    Should Be Equal    ${ueberschrift}    Dein Weg, deine Zukunft
