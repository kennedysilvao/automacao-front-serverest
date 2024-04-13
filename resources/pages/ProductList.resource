*** Settings ***
Documentation    Actions and Elements of product list page

Library    Browser

*** Keywords ***
Product should be registered
    [Arguments]    ${nome}

    Wait For Elements State    css=h1 >> text=Lista dos Produtos
    ...    visible
    ...    5

    Wait For Elements State    css=table tbody tr >> text=${nome}
    ...    visible
    ...    5