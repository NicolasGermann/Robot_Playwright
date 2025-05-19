*** Settings ***
Library    Browser
Library    String
Resource  ../Resources/LanguageDetections.resource

*** Test Cases ***
Verify Seraphine Slogan Text
    [Documentation]   Ist der Slogan auf Deutsch? 
    New Page    https://jangerlp.github.io/PIM-SWKS_Internationalisierung/
    Wait For Load State    networkidle
    Wait For Elements State    .mb-10.p-15 > p:nth-of-type(1)    visible    timeout=10s
    Is Selected Text German  .mb-10.p-15 > p:nth-of-type(1)

Verify Seraphine Advertisement Text
    [Documentation]   Ist der Text auf Deutsch? 
    New Page    https://jangerlp.github.io/PIM-SWKS_Internationalisierung/
    Wait For Load State    networkidle
    Wait For Elements State    .flex.flex-row.gap-4.my-20 > p    visible    timeout=10s
    Is Selected Text German    .flex.flex-row.gap-4.my-20 > p

Verify Currency Is in Euro In Header
    [Documentation]   Wird die richtige Währung verwendet?
    New Page    https://jangerlp.github.io/PIM-SWKS_Internationalisierung/
    Wait For Load State    networkidle
    Set Strict Mode  False
    ${text}=    Get Text    div.flex.flex-row.justify-between.items-center > p.text-lg
    Should Match Regexp    ${text}    .*[€]

Verify Performance Is in PS In Specs
    [Documentation]   Wird die richtige Einheit verwendet?
    New Page    https://jangerlp.github.io/PIM-SWKS_Internationalisierung/
    Wait For Load State    networkidle
    Set Strict Mode  False
    ${text}=    Get Text    div.flex.flex-col:nth-of-type(2) > span:nth-child(2)
    Should Match Regexp    ${text}    .*ps.*

Verify Torque Is in Nm In Specs
    [Documentation]   Wird die richtige Einheit verwendet?
    New Page    https://jangerlp.github.io/PIM-SWKS_Internationalisierung/
    Wait For Load State    networkidle
    Set Strict Mode  False
    ${text}=    Get Text    div.flex.flex-col:nth-of-type(3) > span:nth-child(2)
    Should Match Regexp    ${text}    .*Nm.*

Verify Acceleration Is in km/h In Specs
    [Documentation]   Wird die richtige Einheit verwendet?
    New Page    https://jangerlp.github.io/PIM-SWKS_Internationalisierung/
    Wait For Load State    networkidle
    Set Strict Mode  False
    ${text}=    Get Text    div.flex.flex-col:nth-of-type(5) > span:nth-child(2)
    Should Match Regexp    ${text}    .*km/h.*

Verify Efficency Is in L/km In Specs
    [Documentation]   Wird die richtige Einheit verwendet?
    New Page    https://jangerlp.github.io/PIM-SWKS_Internationalisierung/
    Wait For Load State    networkidle
    Set Browser Timeout   30s
    Set Strict Mode  False
    ${text}=    Get Text    div.flex.flex-col.gap-8.mb-20 > div:nth-of-type(2) > div > div:nth-of-type(1) > span:nth-of-type(2)
    Should Match Regexp    ${text}    .*Liter / 100 km.*

Verify Emissions Is in g/km In Specs
    [Documentation]   Wird die richtige Einheit verwendet?
    New Page    https://jangerlp.github.io/PIM-SWKS_Internationalisierung/
    Wait For Load State    networkidle
    Set Browser Timeout   30s
    Set Strict Mode  False
    ${text}=    Get Text    div.flex.flex-col.gap-8.mb-20 > div:nth-of-type(2) > div > div:nth-of-type(2) > span:nth-of-type(2)
    Should Match Regexp    ${text}    .*g/km.*

Verify Tank-Volume Is in L In Specs
    [Documentation]   Wird die richtige Einheit verwendet?
    New Page    https://jangerlp.github.io/PIM-SWKS_Internationalisierung/
    Wait For Load State    networkidle
    Set Browser Timeout   30s
    Set Strict Mode  False
    ${text}=    Get Text    div.flex.flex-col.gap-8.mb-20 > div:nth-of-type(2) > div > div:nth-of-type(3) > span:nth-of-type(2)
    Should Match Regexp    ${text}    .*l


Verify Reach Is in Km In Specs
    [Documentation]   Wird die richtige Einheit verwendet?
    New Page    https://jangerlp.github.io/PIM-SWKS_Internationalisierung/
    Wait For Load State    networkidle
    Set Browser Timeout   30s
    Set Strict Mode  False
    ${text}=    Get Text    div.flex.flex-col.gap-8.mb-20 > div:nth-of-type(2) > div > div:nth-of-type(4) > span:nth-of-type(2)
    Should Match Regexp    ${text}    .*km

Verify Correct Wallpaper Is Used
    [Documentation]   Wird die richtige Einheit verwendet?
    New Page    https://jangerlp.github.io/PIM-SWKS_Internationalisierung/
    Wait For Load State    networkidle
    Set Browser Timeout   30s
    Set Strict Mode  False
    ${text}=    Get Attribute    div.relative > img  src
    Should Match Regexp    ${text}    .*enUS.*

Verify Correct Product Shot Is Used
    [Documentation]   Wird die richtige Einheit verwendet?
    New Page    https://jangerlp.github.io/PIM-SWKS_Internationalisierung/
    Wait For Load State    networkidle
    Set Browser Timeout   30s
    Set Strict Mode  False
    ${text}=    Get Attribute    div.flex.flex-row.gap-4.my-20 > img  src
    Should Match Regexp    ${text}    .*enUS.*
