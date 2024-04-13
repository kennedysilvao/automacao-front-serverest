*** Settings ***
Documentation    Test suite of login

Resource    ../resources/Base.resource

Test Setup       Start Browser
Test Teardown    End Browser

*** Test Cases ***
Should be successfuly login
    
    ${account}    Create Dictionary
    ...    nome=Kevin Silva
    ...    email=kevinsilva232@qa.com
    ...    password=pwd123
    ...    administrador=true

    Create a new session
    User Management    ${account}[email]    ${account}
    
    Submit login form    ${account}
    User logged in    ${account}[nome]

