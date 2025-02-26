@addToCard
Feature: Add product to cart

Background: 
    * configure driver = { type: 'chrome' }
    Given driver 'https://www.saucedemo.com/v1/inventory.html'
    * waitFor("div.inventory_list")

@addProduct
Scenario: Add product to card successfully

    When driver.exists("//a[@id='item_4_title_link']")
    And click("//a[@id='item_4_title_link']/ancestor::div[contains(@class, 'inventory_item')]//button")
    And driver.waitFor("//button[text()='REMOVE']")

    When click("//div[@id='shopping_cart_container']//a")
    And driver.waitFor("//div[contains(text(), 'Your Cart')]")
    Then driver.exists('Sauce Labs Backpack')

@removeProduct
Scenario: Remove product from cart successfully
    When driver.exists("//a[@id='item_0_title_link']")
    And click("//a[@id='item_4_title_link']/ancestor::div[contains(@class, 'inventory_item')]//button")
    And driver.waitFor("//button[text()='REMOVE']")

    When click("//div[@id='shopping_cart_container']//a")
    * driver.waitFor("//div[contains(text(), 'Your Cart')]")

    * if (exists("//button[text()='REMOVE']")) click("//button[text()='REMOVE']")

    * driver.waitFor("div.removed_cart_item")


