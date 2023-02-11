*** Settings ***
Resource  ../Common.robot
Resource  ProductsPage.robot
Resource  LoginPageLocators.resource

*** Variables ***
${locked_out_user}   locked_out_user
${standard_user}     standard_user
${password}          secret_sauce

*** Keywords ***
Standard user should be able to login from "Login Page" page and land in to the "Products Page"
    Input Text          ${USERNAME_FIELD}     ${standard_user}
    Input Password      ${PASSWORD_FIELD}     ${password}
    Click Button        ${LOGIN_BUTTON}
    Validate Products Page

Locked out user should not be able to login
    Input Text          ${USERNAME_FIELD}     ${locked_out_user}
    Input Password      ${PASSWORD_FIELD}     ${password}
    Click Button        ${LOGIN_BUTTON}
    Page Should Contain Element     ${ERROR_MESSAGE}