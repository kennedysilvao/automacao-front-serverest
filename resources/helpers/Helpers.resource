*** Settings ***
Documentation    API Helpers

Library    RequestsLibrary
Library    Collections

*** Variables ***
${API}    https://serverest.dev

*** Keywords ***
Create a new session
    ${HEADER}=    Create Dictionary    Content-Type=application/json
    Create Session    alias=serverest    url=${API}    headers=${HEADER}    disable_warnings=1

Create a new user
    [Arguments]    ${user}

    ${response}    POST On Session    url=${API}/usuarios    alias=serverest    json=${user}

    Should Be Equal As Strings    ${response.status_code}    201
    ${status_code}    Set Variable    ${response.status_code}
    Set Suite Variable    ${status_code}
Delete user
    [Arguments]    ${user}

    ${response}    DELETE On Session    url=${API}/usuarios/${user_id}    alias=serverest
    Should Be Equal As Strings    ${response.json()['message']}    Registro excluído com sucesso


User Management
    [Arguments]   ${email}    ${account}

    # Find by email
    ${response}    GET On Session    url=${API}/usuarios    alias=serverest
    ...    params=email=${email}
    
    Should Be Equal As Strings    ${response.status_code}    200
    FOR    ${user}    IN    @{response.json()['usuarios']}
        ${user_id}    Set Variable    ${user['_id']}
        Set Suite Variable    ${user_id}
    END

    IF    ${response.json()}[quantidade] == 0
        Create a new user    ${account}
    ELSE
        Delete user    ${email}
        Create a new user    ${account}
    END

Exists user
    [Arguments]   ${email}    ${account}

    # Find by email
    ${response}    GET On Session    url=${API}/usuarios    alias=serverest
    ...    params=email=${email}
    
    Should Be Equal As Strings    ${response.status_code}    200
    FOR    ${user}    IN    @{response.json()['usuarios']}
        ${user_id}    Set Variable    ${user['_id']}
        Set Suite Variable    ${user_id}
    END

    IF    ${response.json()}[quantidade] != 0
        Delete user    ${email}   
    END