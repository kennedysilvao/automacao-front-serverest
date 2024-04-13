*** Settings ***
Documentation    Test Suite of User List


Resource    ../resources/Base.resource


Test Setup        Start Browser
Test Teardown     End Browser

*** Test Cases ***
Should be deleted user by admin successfuly
    [Documentation]    User deleted by administrator
    
    ${account}    Create Dictionary
    ...    nome=Maria da Silva
    ...    email=maria@admin.com
    ...    password=pwd123
    ...    administrador=true

    ${account_edit}    Create Dictionary
    ...    nome=Lucas Silva
    ...    email=lucas@qa.com
    ...    password=pwd123
    ...    administrador=true

    Create a new session
    User Management    ${account}[email]         ${account}    
    User Management    ${account_edit}[email]    ${account_edit}

    Submit login form    ${account}
    User logged in       ${account}[nome]

    Navigate to user list
    Request removal               ${account_edit}[email]
    User should be not visible    ${account_edit}[email]