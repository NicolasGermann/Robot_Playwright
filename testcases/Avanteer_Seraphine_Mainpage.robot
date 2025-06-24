*** Variables ***
${PAGE-DE}   https://swks.htwsaar-projects.de/de-DE/
${PAGE-EN}   https://swks.htwsaar-projects.de/en-US/

*** Settings ***
Library    Browser
Library    String
Resource  ../Resources/LanguageDetections.resource

*** Test Cases ***
Verify Seraphine Slogan Text German
    [Documentation]   Ist der Slogan auf Deutsch? 
    New Page    ${PAGE-DE}
    Set Browser Timeout   30s
    Wait For Load State    networkidle
    Wait For Elements State    id=card-marketing    visible    timeout=30s
    Is Selected Text German  id=card-marketing

Verify Seraphine Advertisement Text German
    [Documentation]   Ist der Text auf Deutsch? 
    New Page    ${PAGE-DE}
    Set Browser Timeout   30s
    Wait For Load State    networkidle
    Wait For Elements State    id=marketing-text    visible    timeout=30s
    Is Selected Text German    id=marketing-text
    
Verify Seraphine Advertisement Text English
    [Documentation]   Ist der Text auf Englisch? 
    New Page    ${PAGE-EN}
    Set Browser Timeout   30s
    Wait For Load State    networkidle
    Wait For Elements State    id=marketing-text    visible    timeout=30s
    Is Selected Text English    id=marketing-text

Test Main Page For Germany
    Regexp Check On Text Selector  ${PAGE-DE}  id=price  .*[€]
    Regexp Check On Text Selector  ${PAGE-DE}  id=power  .*ps.*
    Regexp Check On Text Selector  ${PAGE-DE}  id=torque  .*Nm.*
    Regexp Check On Text Selector  ${PAGE-DE}  id=acceleration  .*km/h.*
    Regexp Check On Text Selector  ${PAGE-DE}  id=efficiency  .*Liter / 100 km.*
    Regexp Check On Text Selector  ${PAGE-DE}  id=volume  .*l
    Regexp Check On Text Selector  ${PAGE-DE}  id=range  .*km
    Regexp Check On Attribute Selector  ${PAGE-DE}  id=marketing-image  src  .*enUS.*

Test Main Page For US
    Regexp Check On Text Selector  ${PAGE-EN}  id=price  [€].*
    Regexp Check On Text Selector  ${PAGE-EN}  id=power  .*hp.*
    Regexp Check On Text Selector  ${PAGE-EN}  id=torque  .*lb-ft.*
    Regexp Check On Text Selector  ${PAGE-EN}  id=acceleration  .*mph.*
    Regexp Check On Text Selector  ${PAGE-EN}  id=efficiency  .*mpg.*
    Regexp Check On Text Selector  ${PAGE-EN}  id=volume  .*gallons
    Regexp Check On Text Selector  ${PAGE-EN}  id=range  .*miles
    Regexp Check On Attribute Selector  ${PAGE-EN}  id=marketing-image  src  .*enUS.*

*** Keywords ***
Regexp Check On Attribute Selector 
    [Documentation]   Wird die richtige Einheit verwendet?
    [Arguments]  ${page}  ${selector}  ${element_type}  ${regex}
    New Page    ${page}
    Wait For Load State    networkidle
    Set Browser Timeout   30s
    Set Strict Mode  False
    ${text}=    Get Attribute    ${selector}  ${element_type}
    Should Match Regexp    ${text}    ${regex}

Regexp Check On Text Selector
    [Documentation]   Wird die richtige Einheit verwendet?
    [Arguments]  ${page}  ${selector}  ${regex}
    New Page    ${page}
    Wait For Load State    networkidle
    Set Browser Timeout   30s
    Set Strict Mode  False
    ${text}=    Get Text    ${selector}
    Should Match Regexp    ${text}    ${regex}