*** Settings ***
Library    Browser
Library   ../Resources/langdetect_wrapper.py

*** Test Cases ***
Überschrift Abfragen
    New Page    https://studieren.htwsaar.de
    ${ueberschrift}=    Get Text    h1
    Should Be Equal    ${ueberschrift}    Dein Weg, deine Zukunft
    ${lang} =  Get Language  ${ueberschrift}
    Should Be Equal As Strings  ${lang}  de

Text Ist Der Erwartete
    New Page    https://www.raycast.com
    Set Strict Mode  False
    Get Text  .Features_sub__2RCSJ span  ==  Remember Everything.

    
Ist Das Bild Das Erwartet
    New Page    https://www.itechx.de/
    Get Attribute    css=[data-key="rs-3"] rs-sbg    data-lazyload  ==  //itechx.de/wp-content/uploads/2019/10/banner_header_unternehmen2.jpg
