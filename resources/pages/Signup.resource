*** Settings ***
Documentation    Actions and Elements Signup Page

Library    Browser

*** Keywords ***
Fill signup form
    [Arguments]    ${user}

    Fill Text         css=input[name="nome"]                ${user}[nome]
    Fill Text         css=input[data-testid="email"]        ${user}[email]
    Fill Text         css=input[placeholder$="senha"]       ${user}[password]
    Check Checkbox    css=input[data-testid="checkbox"]

Submit signup form
    Click    css=button[type="submit"] >> text=Cadastrar

User should be registered
    Wait For Elements State    css=.alert-link >> text=Cadastro realizado com sucesso

    Get Text    css=.alert-link >> text=Cadastro realizado com sucesso
    ...    equal
    ...    Cadastro realizado com sucesso