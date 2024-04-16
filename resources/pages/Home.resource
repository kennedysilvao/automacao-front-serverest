*** Settings ***
Documentation    Actions and Elements Home Page

Library    Browser

*** Keywords ***
User logged in
    [Arguments]    ${user}

    Wait For Elements State    css=h1 >> text=Bem Vindo ${user}
    ...    visible
    ...    10

    Get Text    css=h1 >> text=Bem Vindo ${user}
    ...    equal
    ...    Bem Vindo ${user}

Navigate to product form
    Click    css=a[data-testid="cadastrarProdutos"]

Navigate to product list
    Click    css=a[data-testid="listarProdutos"]
