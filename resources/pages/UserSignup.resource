*** Settings ***
Documentation    Actions and Elements of User Signup Page by Administrator

Library    Browser


*** Keywords ***
Navigate to user signup
    Click    css=a[data-testid="cadastrarUsuarios"]
    
    Wait For Elements State    css=h1 >> text=Cadastro de usuários
    ...    visible
    ...    5

Submit user signup form
    [Arguments]    ${register}
    
    Fill Text    css=input[name=nome]          ${register}[nome]    
    Fill Text    css=input[name=email]         ${register}[email]
    Fill Text    css=input[name=password]      ${register}[password]

    Check Checkbox    css=input[name=administrador]

    Click    css=button[type=submit] >> text=Cadastrar



