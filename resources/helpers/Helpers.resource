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
Delete user
    [Arguments]    ${user}

    # Find by email
    ${response}    GET On Session    url=${API}/usuarios    alias=serverest
    ...    params=email=${user}
    
    # Set value id in ${user_id}
    FOR    ${user}    IN    @{response.json()['usuarios']}
        ${user_id}    Set Variable    ${user['_id']}
    END

    # Delete user by id
    ${response}    DELETE On Session    url=${API}/usuarios/${user_id}    alias=serverest
    Should Be Equal As Strings    ${response.json()['message']}    Registro excluído com sucesso