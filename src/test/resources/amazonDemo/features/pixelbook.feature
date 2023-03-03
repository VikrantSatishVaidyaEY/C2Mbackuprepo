Feature: Ordering a Google Pixelbook in Amazon

  @pixelbook @parallel @regression
  Scenario: Verify Amazon Product page shows the correct title for Google Pixelbook
    Given I navigate to amazon_home page
    Then I enter "electronics" into input field amazon.search_bar
    Then I click on element amazon.search_button
    Then I should see page title having partial text as "electronics"
    And I clear input field amazon.search_bar
    Then I enter "Google Pixelbook Go i7" into input field amazon.search_bar
    Then I click on element amazon.search_button
    Then I should see page title having partial text as "Google Pixelbook Go i7"
    Then I click on element searchpage.google_pixelbook_go
    Then element productpage.product_title should have partial text as "Google Pixelbook Go"