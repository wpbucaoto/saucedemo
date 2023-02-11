*** Settings ***
Library   SeleniumLibrary
Resource  ProductsPageLocators.resource
Resource  ../Common.robot

*** Variables ***
${tempcartprice}

*** Keywords ***
Validate Products Page
    Wait until element is visible   //span[text()='Products']

Select Number of Random Items From Max Items And Checkout
    [Arguments]     ${items}    ${max_items}
    ${tempcartprice}    set variable    ${EMPTY}
    Common.Set TotalCartPrice  ${EMPTY}
    FOR    ${index}   IN RANGE   ${items}
       ${random_num}=     Evaluate  random.randint(1, ${max_items})
       ${price}           set variable    ${EMPTY}
       Click Element      xpath=(//div[@class='inventory_item_img'])[${random_num}]
       #Now we are in the specific Product Item page
       ${price}=   Get Text    ${INVENTORY_PRICE}
       ${price}=   Extract Float From Price String  ${price}    1
       ${tempCartPrice}=    Evaluate    ${TotalCartPrice} + ${price}
       Set TotalCartPrice   ${tempCartPrice}
       click button         ${ADD_TO_CART_BUTTON}
       click button         ${BACK_TO_PRODUCTS_BUTTON}
    END
    Click Element       ${SHOPPING_CART_LINK}
    Click Element       ${CHECKOUT_BUTTON}