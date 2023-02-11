*** Settings ***
Documentation  SauceDemo Sample Test by Wilson Bucaoto
#Resource        ../Resources/Common.robot
#Resource        ../Resources/PO/LoginPage.robot
Resource        ../Resources/SauceDemoApp.robot
Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Variables ***
${URL}      https://www.saucedemo.com/
${BROWSER}  chrome

*** Test Cases ***
Standard User Should Be Able to Add Items to Cart and Checkout
    [Documentation]  Test Case 1: Using standard_user, select two random items from “PRODUCTS” page,
    ...             add them to cart and proceed to checkout.
    ...             At the “Checkout overview” page, validate that “item  total” price is equal to
    ...             the price of items added on the “PRODUCTS” page.

    Common.Navigate to URL
    LoginPage.Login using standard user account
    ProductsPage.Select Number Of random items from Max items   2   6
    ProductsPage.Go to "Cart Page" and Proceed to Checkout
    CheckoutPages.Input Checkout Details
    CheckoutPages.Verify Checkout Total

Locked Out User Should Not Be Able to Login
    [Documentation]  Test Case 2: Use locked_out_user to login
    Common.Navigate to URL
    LoginPage.Login using locked out user account