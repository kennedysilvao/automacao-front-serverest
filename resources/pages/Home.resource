*** Settings ***
Documentation    Actions and Elements Home Page

Library    Browser

*** Keywords ***
User logged in
    Wait For Elements State    css=h1 >> text=Bem Vindo Maryana Rocha
    ...    visible
    ...    10

    Get Text    css=h1 >> text=Bem Vindo Maryana Rocha
    ...    equal
    ...    Bem Vindo Maryana Rocha
