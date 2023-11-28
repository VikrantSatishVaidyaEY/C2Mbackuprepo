Feature: Ordering an Echo Dot in Amazon

  @echodot23
  Scenario Outline: Verify Amazon Product page shows the correct title for Amazon Echo Dot
    Given I navigate to amazon_home page
    Then I enter "<category>" into input field amazon.search_bar
    #Then I clear input field amazon.search_bar
    Then I enter current time into the input field amazon.search_bar
    Then I click on element amazon.search_button
   # Then I should see page title having partial text as "<category>"
    And I clear input field amazon.search_bar
    Then I enter "echo dot" into input field amazon.search_bar
    Then I select ".*" option by text from dropdown <string>
    Then I click on element amazon.search_button
    Then I should see page title having partial text as "cho dot"
    Then I click on element searchpage.echo_dot
    Then element productpage.product_title should have partial text as "Echo Dot"

    @smoke23
    Examples:
    |category|
    |        Clothing|

    @regression23
    Examples:
      |category|
      |        Sports|
      |        Electronics|