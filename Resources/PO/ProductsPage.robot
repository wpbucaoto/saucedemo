*** Settings ***
Library   SeleniumLibrary

*** Variables ***

*** Keywords ***
Validate Products Page
    Wait until element is visible   //span[text()='Products']

Select Number of Random Items From Max Items And Checkout
    [Arguments]     ${items}    ${max_items}
    ${total}              set variable    ${EMPTY}
    FOR    ${index}   IN RANGE   ${items}
       ${random_num}=     Evaluate  random.randint(1, ${max_items})
       ${price}           set variable    ${EMPTY}
       click element  xpath=(//div[@class='inventory_item_img'])[${random_num}]
       #click element  xpath=(//div[@class='inventory_item'])[${random_num}]//a[@id='item_1_img_link']
       #click button  id=add-to-cart-sauce-labs-bolt-t-shirt
       #${price}=    Get Text    xpath=(//div[@class='inventory_item'])[${random_num}]//div[2]//div[@class='inventory_item_price']
       ${price}=    Get Text    xpath=//div[@class='inventory_details_price']
       ${price}=    Evaluate    float(${price[1:]})
       log       ${price}
       ${total}=    Evaluate    ${total} + ${price}
       log       ${total}
       click button  //button[text()='Add to cart']
       click button  //button[@id='back-to-products']
    END
    log       ${total}
    click element   class=shopping_cart_link
    click element   //button[@id='checkout']
    ${checkoutprice}           set variable    ${EMPTY}
    Wait until element is visible   //span[text()='Checkout: Your Information']
    Input Text                      //input[@id='first-name']       FirstName
    Input Text                      //input[@id='last-name']       LasttName
    Input Text                      //input[@id='postal-code']      60000
    Click Element                   //input[@id='continue']
    ${checkoutprice}=    Get Text    xpath=//div[@class='summary_subtotal_label']
    ${checkoutprice}=    Evaluate    float(${checkoutprice[13:]})
    log  ${checkoutprice}
    should be equal  ${checkoutprice}   ${total}