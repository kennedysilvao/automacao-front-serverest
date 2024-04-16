*** Settings ***
Documentation    Test suite of products

Resource    ../resources/Base.resource

Test Setup        Start Browser
Test Teardown     End Browser

*** Test Cases ***
Product should be registered
    [Documentation]    Product registered with success
    
    
    ${account}    Create Dictionary
    ...    nome=Kelvin Paz
    ...    email=kelvin@admin.com
    ...    password=pwd123
    ...    administrador=true

    ${account_api}    Create Dictionary
    ...    email=kelvin@admin.com
    ...    password=pwd123
    
    ${product}    Create Dictionary
    ...    nome=Playstation 5 Slim
    ...    preco=4500
    ...    descricao=Com vários jogos para você se divertir
    ...    quantidade=500

    Create a new session
    User Management    ${account}[email]    ${account}
    API Login    ${account_api}
    Product Management    ${product}[nome]    ${account_api}
    
    Submit login form    ${account}
    User logged in       ${account}[nome]

    Navigate to product form
    Submit product form    ${product}
    Product should be registered    ${product}[nome]

Product should be deleted
    [Tags]    remove

    ${account}    Create Dictionary
    ...    nome=João Heleno
    ...    email=heleno@admin.com
    ...    password=pwd123
    ...    administrador=true

    ${account_api}    Create Dictionary
    ...    email=heleno@admin.com
    ...    password=pwd123
    
    ${product}    Create Dictionary
    ...    nome=Blush
    ...    preco=10
    ...    descricao=Eu usei e aprovei, usem meninas
    ...    quantidade=500

    Create a new session
    User Management    ${account}[email]    ${account}
    API Login    ${account_api}
    Create product    ${product}

    Submit login form    ${account}
    User logged in    ${account}[nome]

    Navigate to product list
    Remove product    ${product}[nome]
    Product should be not visible    ${product}[nome]