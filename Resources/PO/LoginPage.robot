*** Settings ***
Resource  ../Common.robot
Resource  ProductsPage.robot
Resource  LoginPageLocators.resource

*** Variables ***
${locked_out_user}   locked_out_user
${standard_user}     standard_user
${password}          secret_sauce

*** Keywords ***
Login using standard user account
    Input Text          ${USERNAME_FIELD}     ${standard_user}
    Input Password      ${PASSWORD_FIELD}     ${password}
    Click Button        ${LOGIN_BUTTON}
    ProductsPage.Validate "Products Page"

Login using locked out user account
    Input Text          ${USERNAME_FIELD}     ${locked_out_user}
    Input Password      ${PASSWORD_FIELD}     ${password}
    Click Button        ${LOGIN_BUTTON}
    Page Should Contain Element     ${ERROR_MESSAGE}