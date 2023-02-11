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
Standard User Adds Items to Cart and Checkouts
    [Documentation]  Test Case 1: Using standard_user, select two random items from “PRODUCTS” page,
    ...             add them to cart and proceed to checkout.
    ...             At the “Checkout overview” page, validate that “item  total” price is equal to
    ...             the price of items added on the “PRODUCTS” page.

    Common.Navigate to URL
    LoginPage.Standard user should be able to login from "Login Page" page and land in to the "Products Page"
    ProductsPage.Select Number Of Random Items From Max Items And Checkout   2   6
    CheckoutPages.Validate Checkout Page
    CheckoutPages.Input Checkout Details
    CheckoutPages.Verify Checkout Total

Locked Out User Logs in
    [Documentation]  Test Case 2: Use locked_out_user to login
    Common.Navigate to URL
    LoginPage.Locked out user should not be able to login