*** Settings ***
Documentation  SauceDemo Sample Test by Wilson Bucaoto
Resource  ../Resources/Common.robot
Resource  ../Resources/PO/LoginPage.robot
Test Setup  Begin Web Test
Test Teardown  End Web Test

*** Variables ***
${URL}      https://www.saucedemo.com/
${BROWSER}  chrome

*** Test Cases ***
Test Standard User
    [Documentation]  Test Case 1
    Common.Navigate to URL
    LoginPage.Standard user should be able to login from "Login Page" page and land in to the "Products Page"
    ProductsPage.Select Number Of Random Items From Max Items And Checkout   2   6

#Test Locked Out User
#    [Documentation]  Test Case 1
#    Common.Navigate to URL
#    LoginPage.Locked out user should not be able to login
