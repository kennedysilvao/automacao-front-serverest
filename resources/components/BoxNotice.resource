*** Settings ***
Documentation    Actions and Elements of notification box component

Library    Browser

*** Keywords ***
Notice should be
    [Arguments]    ${expected_text}

    Wait For Elements State    css=.alert-secondary span >> text=${expected_text}
    ...    visible
    ...    10

    Get Text    css=.alert-secondary span >> text=${expected_text}
    ...    equal
    ...    ${expected_text}    
