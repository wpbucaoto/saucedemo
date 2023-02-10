*** Settings ***
Library  SeleniumLibrary

*** Keywords ***
Begin Web Test
    Open Browser    about:blank     ${browser}

End Web Test
    Close All Browsers

Navigate to URL
    go to  ${URL}

