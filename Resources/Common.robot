*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${TotalCartPrice}

*** Keywords ***
Begin Web Test
    Open Browser    about:blank     ${BROWSER}

End Web Test
    Close All Browsers

Navigate to URL
    go to  ${URL}

Set TotalCartPrice
    [Arguments]     ${value}
    set global variable     ${TotalCartPrice}   ${value}

Extract Float From Price String
    [Arguments]     ${price_string}     ${offset}
    ${float_value}=  Evaluate    float(${price_string[${offset}:]})
    [Return]        ${float_value}