*** Settings ***
Library  langdetect_wrapper.py
Library  Browser

*** Keywords ***
Is Selected Text German
    [Arguments]  ${Selector}
    ${text}=    Get Text    ${Selector}
    ${lang} =  Get Language  ${text}
    Should Be Equal As Strings  ${lang}  de

Is Selected Text English
    [Arguments]  ${Selector}
    ${text}=    Get Text    ${Selector}
    ${lang} =  Get Language  ${text}
    Should Be Equal As Strings  ${lang}  en

Is Given Text German
    [Arguments]  ${Text}
    ${lang} =  Get Language  ${Text}
    Should Be Equal As Strings  ${lang}  de

Is Given Text English
    [Arguments]  ${Text}
    ${lang} =  Get Language  ${Text}
    Should Be Equal As Strings  ${lang}  en