*** Settings ***
Documentation    Actions and Elements of Product Form Page

Library    Browser

*** Keywords ***
Submit product form
    [Arguments]    ${product}
    
    Fill Text    css=input[name=nome]                  ${product}[nome]
    Fill Text    css=input[name=price]                 ${product}[preco]
    Fill Text    css=textarea[name=description]        ${product}[descricao]
    Fill Text    css=input[name=quantity]              ${product}[quantidade]

    Click    css=button[type=submit] >> text=Cadastrar