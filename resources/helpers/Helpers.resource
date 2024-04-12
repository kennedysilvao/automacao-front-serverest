*** Settings ***
Documentation    API Helpers

Library    RequestsLibrary
Library    Collections

*** Variables ***
${API}    https://serverest.dev

*** Keywords ***
Delete user
    [Arguments]    ${user}
    ${HEADER}=    Create Dictionary    Content-Type=application/json

    Create Session    alias=serverest    url=${API}    headers=${HEADER}    disable_warnings=1

    ${response}    GET On Session    url=${API}/usuarios    alias=serverest
    ...    params=email=${user}

    Should Be Equal As Strings    ${response.status_code}    200

    FOR    ${user}    IN    @{response.json()['usuarios']}
        ${user_id}    Set Variable    ${user['_id']}
    END

    ${response}    DELETE On Session    url=${API}/usuarios/${user_id}    alias=serverest
    Should Be Equal As Strings    ${response.json()['message']}    Registro excluído com sucesso