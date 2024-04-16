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

Remove product
    [Arguments]    ${product_name}

    Click    xpath=//td[text()="${product_name}"]/..//button[text()="Excluir"]

Product should be not visible
    [Arguments]    ${product_name}

    Wait For Elements State    css=table tbody tr td >> text=${product_name}
    ...    detached
    ...    5
    
    Take Screenshot    selector=table tbody