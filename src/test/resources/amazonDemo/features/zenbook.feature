Feature: Ordering a laptop in Amazon

  @parallel @smoke @zenbook
  Scenario: Verify Amazon Product page shows the correct title for Asus Zenbook
    Given I navigate to amazon_home page
    Then I enter "electronics" into input field amazon.search_bar
    Then I click on element amazon.search_button
    Then I should see page title having partial text as "electronics"
    And I clear input field amazon.search_bar
    Then I enter "ASUS Zenbook 13" into input field amazon.search_bar
    Then I click on element amazon.search_button
    Then I should see page title having partial text as "ASUS Zenbook 13"
    Then I click on element searchpage.asus_zenbook
    Then element productpage.product_title should have partial text as "ASUS ZenBook 13"