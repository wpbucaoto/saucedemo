*** Settings ***
Library   SeleniumLibrary
Resource  CheckoutPagesLocators.resource

*** Variables ***
${tempcartprice}
${firstName}   User
${lastName}    Test
${postalCode}   60000


*** Keywords ***
Validate Checkout Page
    Wait until element is visible   ${CHECKOUT_LABEL}

Input Checkout Details
    ${checkoutprice}    set variable    ${EMPTY}
    Input Text                      ${FIRST_NAME_FIELD}     ${firstName}
    Input Text                      ${LAST_NAME_FIELD}      ${lastName}
    Input Text                      ${POSTAL_CODE_FIELD}    ${postalCode}
    Click Element                   ${CONTINUE}

Verify Checkout Total
    ${checkoutprice}=    Get Text    ${SUBTOTAL_LABEL}
    ${checkoutprice}=   Extract Float From Price String     ${checkoutprice}    13
    Should Be Equal  ${checkoutprice}   ${totalcartprice}