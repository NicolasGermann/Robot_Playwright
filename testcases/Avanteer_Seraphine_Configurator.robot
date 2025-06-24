*** Variables ***
${PAGE-DE}   https://swks.htwsaar-projects.de/de-DE/config
${PAGE-EN}   https://swks.htwsaar-projects.de/en-US/config

*** Settings ***
Library    Browser
Library    String
Resource  ../Resources/LanguageDetections.resource

*** Test Cases ***

Verify Seraphine Advertisement Text German
    [Documentation]   Ist der Text auf Deutsch? 
    New Page    ${PAGE-DE}
    Set Browser Timeout   30s
    Wait For Load State    networkidle
    Is Selected Text German    id=edition-sport-description
    Is Selected Text German    id=edition-special-description
    Is Selected Text German    id=edition-special-duration
    Is Selected Text German    id=colour-section
    # Is Selected Text German    id=wheel-section
    Is Selected Text German    id=fleet-section
    Is Selected Text German    id=fleet
    Is Selected Text German    id=order-button

Verify Seraphine Advertisement Text English
    [Documentation]   Ist der Text auf English? 
    New Page    ${PAGE-EN}
    Set Browser Timeout   30s
    Wait For Load State    networkidle
    Is Selected Text English    id=edition-sport-description
    Is Selected Text English    id=edition-special-description
    Is Selected Text English    id=edition-special-duration
    # Is Selected Text English    id=colour-section
    # Is Selected Text English    id=wheel-section
    # Is Selected Text English    id=fleet-section
    Is Selected Text English    id=fleet
    Is Selected Text English    id=order-button

Click Colour Buttons
    New Page    ${PAGE-DE}
    ${image_src} =    Get Attribute  selector=id=colour-image  attribute=src
    Should Match Regexp  string=${image_src}  pattern=.*red.*
    Click  selector=id=colour-blue
    Sleep  time_=5 seconds
    ${image_src} =    Get Attribute  selector=id=colour-image  attribute=src
    Should Match Regexp  string=${image_src}  pattern=.*blue.*
    Take Screenshot
    Click  selector=id=colour-silver
    Sleep  time_=5 seconds
    ${image_src} =    Get Attribute  selector=id=colour-image  attribute=src
    Should Match Regexp  string=${image_src}  pattern=.*silver.*
    Take Screenshot
    
Click Wheel Buttons
    New Page    ${PAGE-DE}
    ${image_src} =    Get Attribute  selector=id=wheel-image  attribute=src
    Should Match Regexp  string=${image_src}  pattern=.*speedster.*
    Click  selector=id=wheel-turbine
    Sleep  time_=5 seconds
    ${image_src} =    Get Attribute  selector=id=wheel-image  attribute=src
    Should Match Regexp  string=${image_src}  pattern=.*turbine.*
    Take Screenshot

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