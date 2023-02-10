*** Settings ***
Resource  ../Common.robot
Resource  ProductsPage.robot
Resource  LoginPageVariables.resource
#Resource  ./PO/TopNav.robot

*** Keywords ***
Standard user should be able to login from "Login Page" page and land in to the "Products Page"
    Input Text          ${username_field}     ${standard_user}
    Input Password      ${password_field}     ${password}
    Click Button        ${login_button}
    Validate Products Page

Locked out user should not be able to login
    Input Text          ${username_field}    ${locked_out_user}
    Input Password      ${password_field}     ${password}
    Click Button        ${login_button}
    Page Should Contain Element     ${error_message}