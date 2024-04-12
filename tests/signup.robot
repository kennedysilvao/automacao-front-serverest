*** Settings ***
Documentation    Test Suite of signup

Resource    ../resources/Base.resource
Resource    ../resources/pages/Signup.resource

Test Setup        Start Browser
Test Teardown     End Browser

*** Test Cases ***
Should be successfuly registered
    [Documentation]    Successfuly registered
    [Tags]    signup

    ${user}    Create Dictionary
    ...    nome=Maryana Rocha
    ...    email=maryana@gmail.com
    ...    password=pwd123
    ...    administrador=true
    
    Delete user    ${user}[email]
    
    Is Login Page    Login
    Navigate to signup form
    Fill signup form    ${user}
    Submit signup form
    User should be registered
    User logged in

Should be all fields required
    [Documentation]    All fields required
    [Tags]    req_fields
    [Template]    Attempt signup

    Kennedy Silva    kennedy@gmail.com    ${EMPTY}      Password é obrigatório
    ${EMPTY}         kennedy@gmail.com    pwd123        Nome é obrigatório
    Kennedy Silva    ${EMPTY}             pwd123        Email é obrigatório


*** Keywords ***
Attempt signup
    [Arguments]    ${nome}    ${email}    ${password}    ${output_text}

    ${user}    Create Dictionary
    ...    nome=${nome}
    ...    email=${email}
    ...    password=${password}

    Go To    ${URL}/cadastrarusuarios
    Fill signup form    ${user}
    Submit signup form
    Notice should be    ${output_text}