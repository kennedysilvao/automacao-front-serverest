*** Settings ***
Documentation    Actions and Elements of user list page

Library    Browser

*** Keywords ***
User should be visible in the list of users
    [Arguments]    ${email}

    Wait For Elements State    css=h1 >> text=Lista dos usuários
    ...    visible
    ...    5

    Wait For Elements State    css=table tbody tr td >> text=${email}
    ...    visible
    ...    5

    Take Screenshot    selector=table tbody tr td >> text=${email}

Navigate to user list
    Click    css=a[data-testid="listarUsuarios"]

    Wait For Elements State    css=h1 >> text=Lista dos usuários
    ...    visible
    ...    5

Request removal
    [Arguments]    ${email}
    
    Click    xpath=//td[text()="${email}"]/..//button[text()="Excluir"]
User should be not visible
    [Arguments]    ${email}

    Wait For Elements State    css=table tbody tr td >> text=${email}
    ...    detached
    ...    5
    
    Take Screenshot    selector=table tbody