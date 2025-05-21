*** Variables ***
${PAGE}   https://jangerlp.github.io/PIM-SWKS_Internationalisierung/

*** Settings ***
Library    Browser
Library    String
Resource  ../Resources/LanguageDetections.resource

*** Test Cases ***
Verify Seraphine Slogan Text
    [Documentation]   Ist der Slogan auf Deutsch? 
    New Page    ${PAGE}
    Wait For Load State    networkidle
    Wait For Elements State    .mb-10.p-15 > p:nth-of-type(1)    visible    timeout=10s
    Is Selected Text German  .mb-10.p-15 > p:nth-of-type(1)

Verify Seraphine Advertisement Text
    [Documentation]   Ist der Text auf Deutsch? 
    New Page    ${PAGE}
    Wait For Load State    networkidle
    Wait For Elements State    .flex.flex-row.gap-4.my-20 > p    visible    timeout=10s
    Is Selected Text German    .flex.flex-row.gap-4.my-20 > p
    

Test Main Page For Germany
    Regexp Check On Text Selector  div.flex.flex-row.justify-between.items-center > p.text-lg  .*[€]
    Regexp Check On Text Selector  div.flex.flex-col:nth-of-type(2) > span:nth-child(2)  .*ps.*
    Regexp Check On Text Selector  div.flex.flex-col:nth-of-type(3) > span:nth-child(2)  .*Nm.*
    Regexp Check On Text Selector  div.flex.flex-col:nth-of-type(5) > span:nth-child(2)  .*km/h.*
    Regexp Check On Text Selector  div.flex.flex-col.gap-8.mb-20 > div:nth-of-type(2) > div > div:nth-of-type(1) > span:nth-of-type(2)  .*Liter / 100 km.*
    Regexp Check On Text Selector  div.flex.flex-col.gap-8.mb-20 > div:nth-of-type(2) > div > div:nth-of-type(2) > span:nth-of-type(2)  .*g/km.*
    Regexp Check On Text Selector  div.flex.flex-col.gap-8.mb-20 > div:nth-of-type(2) > div > div:nth-of-type(3) > span:nth-of-type(2)  .*l
    Regexp Check On Text Selector  div.flex.flex-col.gap-8.mb-20 > div:nth-of-type(2) > div > div:nth-of-type(4) > span:nth-of-type(2)  .*km
    Regexp Check On Attribute Selector  div.relative > img  src  .*enUS.*
    Regexp Check On Attribute Selector  div.flex.flex-row.gap-4.my-20 > img  src  .*enUS.*

*** Keywords ***
Regexp Check On Attribute Selector
    [Documentation]   Wird die richtige Einheit verwendet?
    [Arguments]  ${selector}  ${element_type}  ${regex}
    New Page    ${PAGE}
    Wait For Load State    networkidle
    Set Browser Timeout   30s
    Set Strict Mode  False
    ${text}=    Get Attribute    ${selector}  ${element_type}
    Should Match Regexp    ${text}    ${regex}

Regexp Check On Text Selector
    [Documentation]   Wird die richtige Einheit verwendet?
    [Arguments]  ${selector}  ${regex}
    New Page    ${PAGE}
    Wait For Load State    networkidle
    Set Browser Timeout   30s
    Set Strict Mode  False
    ${text}=    Get Text    ${selector}
    Should Match Regexp    ${text}    ${regex}