Feature: web-browser automation

Background: 
    * configure driver = { type: 'chrome' }

@searchDemoWebsite
Scenario: Go to Google and do a google search for the demo website

    Given driver 'https://www.google.com/'
    When waitFor("textarea[id=APjFqb]")
    And input("textarea[id=APjFqb]", "saucedemo")
    And waitFor("input[name='btnK']")
    And click("//input[@name='btnK']")
    Then waitFor("div.crJ18e div[role='listitem']")
    And click("//h3[text()='Shopping']")
    Then match driver.url == 'https://www.saucedemo.com/v1/inventory.html'
