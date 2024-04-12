*** Settings ***
Documentation    Actions and Elements Login Page


Library    Browser


*** Keywords ***
Is Login Page
    [Arguments]    ${expected_text}

    Wait For Elements State    css=h1 >> text=Login
    ...    visible
    ...    5
    
    Get Text    css=h1 >> text=Login
    ...    equal
    ...    ${expected_text}

Navigate to signup form
    Click    css=a[data-testid="cadastrar"]

    Wait For Elements State    css=h2 >> text=Cadastro
    ...    visible
    ...    5