*** Settings ***
Documentation    Action And Element of Logout component


Library    Browser

*** Keywords ***
Do Logout
    Click    css=button >> text=Logout