@logIn-Out
Feature: Login and Logout function

Background: 
    * configure driver = { type: 'chrome' }
    Given driver 'https://www.saucedemo.com/v1/inventory.html'
    When driver.exists("div[id='inventory_filter_container']") == true 
    Then click("//button[text()='Open Menu']")
    And click("//a[@id='logout_sidebar_link']")
    And driver.waitFor("div[id='login_button_container']")

@logInSuccessfully   
Scenario: Login sucessfully
    
    When input('#user-name', 'standard_user') 
    And input('#password', 'secret_sauce')
    And click("input[id=login-button]")
    * waitForUrl('/v1/inventory.html')
    Then driver.exists("div.product_label")

@logInUnsuccessfully
Scenario: Login unsuccessfully with invalid password

    When input('#user-name', 'standard_user')
    And input('#password', '123')
    * click("input[id=login-button]")
    * waitFor("button[class='error-button']")
    Then exists("h3[data-test='error']")


