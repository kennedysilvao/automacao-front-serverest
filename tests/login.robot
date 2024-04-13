*** Settings ***
Documentation    Test suite of login

Resource    ../resources/Base.resource

Test Setup       Start Browser
Test Teardown    End Browser

*** Test Cases ***
Should be successfuly login
    [Documentation]    Login with success
    
    ${account}    Create Dictionary
    ...    nome=Kevin Silva
    ...    email=kevinsilva232@qa.com
    ...    password=pwd123
    ...    administrador=true

    Create a new session
    User Management    ${account}[email]    ${account}
    
    Submit login form    ${account}
    User logged in    ${account}[nome]

Attempt login invalid
    [Documentation]    Login with incorrects data

    [Template]    Login with verify notice

    kennedy@404.com         pwd123          Email e/ou senha inválidos
    kennedy@404.com         ${EMPTY}        Password não pode ficar em branco
    kevinsilva232@qa.com    pwd321          Email e/ou senha inválidos
    ${EMPTY}                pwd123          Email não pode ficar em branco



*** Keywords ***
Login with verify notice
    [Arguments]    ${email}    ${password}    ${output_message}

    ${account}    Create Dictionary
    ...    email=${email}
    ...    password=${password}

    Submit login form    ${account}
    Notice should be    ${output_message}    

