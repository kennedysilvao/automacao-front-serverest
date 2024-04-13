*** Settings ***
Documentation        Initials Configs

Library    Browser

Resource    helpers/Helpers.resource
Resource    pages/Login.resource
Resource    pages/Signup.resource
Resource    pages/Home.resource
Resource    pages/UserSignup.resource
Resource    pages/UserList.resource
Resource    pages/ProductForm.resource
Resource    pages/ProductList.resource
Resource    ./components/BoxNotice.resource
Resource    ./components/Logout.resource

*** Variables ***
${URL}    https://front.serverest.dev

*** Keywords ***
Start Browser
    New Browser    browser=chromium    headless=False
    New Page       ${URL}
    Set Viewport Size    1500    720

    Get Title     equal    Front - ServeRest

End Browser
    Take Screenshot
    Close Browser
