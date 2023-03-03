Feature: Ordering an Echo Dot in Amazon

  @echodot @parallel @smoke
  Scenario: Verify Amazon Product page shows the correct title for Amazon Echo Dot
    Given I navigate to amazon_home page
    Then I enter "electronics" into input field amazon.search_bar
    Then I click on element amazon.search_button
    Then I should see page title having partial text as "electronics"
    And I clear input field amazon.search_bar
    Then I enter "echo dot" into input field amazon.search_bar
    Then I click on element amazon.search_button
    Then I should see page title having partial text as "cho dot"
    Then I click on element searchpage.echo_dot
    Then element productpage.product_title should have partial text as "Echo Dot"