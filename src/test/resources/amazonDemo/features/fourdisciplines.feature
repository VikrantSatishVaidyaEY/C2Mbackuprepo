Feature: Ordering a book in Amazon

  @four_disciplines @parallel @regression
  Scenario: Verify Amazon Product page shows the correct title for Four Disciplines book
    Given I navigate to amazon_home page
    Then I enter "electronics" into input field amazon.search_bar
    Then I click on element amazon.search_button
    Then I should see page title having partial text as "electronics"
    And I clear input field amazon.search_bar
    Then I enter "The 4 Disciplines of Execution" into input field amazon.search_bar
    Then I click on element amazon.search_button
    Then I should see page title having partial text as "The 4 Disciplines of Execution"
    Then I click on element searchpage.four_disciplines
    Then element productpage.product_title should have partial text as "4 Disciplines"