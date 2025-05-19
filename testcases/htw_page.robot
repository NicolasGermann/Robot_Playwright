*** Settings ***
Library    Browser
Resource  ../Resources/LanguageDetections.resource

*** Test Cases ***
Überschrift Abfragen
    New Page    https://studieren.htwsaar.de
    Wait For Load State    networkidle
    ${ueberschrift}=    Get Text    h1
    Should Be Equal    ${ueberschrift}    Dein Weg, deine Zukunft
    Is Given Text German  ${ueberschrift}

Text Ist Der Erwartete
    New Page    https://www.raycast.com
    Wait For Load State    networkidle
    Set Strict Mode  False
    Is Selected Text English  .Features_sub__2RCSJ span

Ist Das Bild Das Erwartet
    New Page    https://www.itechx.de/
    Wait For Load State    networkidle
    Get Attribute    css=[data-key="rs-3"] rs-sbg    data-lazyload  ==  //itechx.de/wp-content/uploads/2019/10/banner_header_unternehmen2.jpg