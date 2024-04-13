*** Settings ***
Documentation        Test suite of user signup by admin


Resource    ../resources/Base.resource

Test Setup       Start Browser
Test Teardown    End Browser

*** Test Cases ***
Should be successfuly registered by administrator
    [Documentation]    User registered by administrator

    ${account}    Create Dictionary
    ...    nome=Cleber de Oliveira
    ...    email=cleber@admin.com
    ...    password=pwd123
    ...    administrador=true
    
    ${register}    Create Dictionary
    ...    nome=Camila Araujo
    ...    email=camila@gmail.com
    ...    password=pwd123
    ...    administrador=true


    Create a new session
    User Management    ${account}[email]         ${account}
    Exists user        ${register}[email]        ${account}

    Submit login form    ${account}
    User logged in    ${account}[nome]

    Navigate to user signup
    Submit user signup form    ${register}
    User should be visible in the list of users    ${register}[email]

All fields must be required in signup user by administrator
    [Documentation]    Required Fields
    [Template]    Attempt user signup by administrator

    ${EMPTY}      joao@qa.com     pwd123        Nome é obrigatório
    Joao Silva    ${EMPTY}        pwd123        Email é obrigatório
    Joao Silva    joao@qa.com     ${EMPTY}      Password é obrigatório



*** Keywords ***
Attempt user signup by administrator
    [Arguments]    ${name}    ${email}    ${password}    ${output_message}       


    ${account}    Create Dictionary
    ...    nome=Silvana da Paz
    ...    email=silvana@admin.com
    ...    password=pwd123
    ...    administrador=true
    
    ${register}    Create Dictionary
    ...    nome=${name}
    ...    email=${email}
    ...    password=${password}

    Create a new session
    User Management    ${account}[email]    ${account}

    Submit login form    ${account}
    User logged in    ${account}[nome]

    Go To    ${URL}/admin/cadastrarusuarios
    Submit user signup form    ${register}
    Notice should be    ${output_message}
    Take Screenshot
    Do Logout
