
Feature: Switch to new window  - testing
  @switchtonewwindowtesting
  Scenario: Switch to new window  - testing

 #User is Logged In
    Given I navigate to C2M_HOME page
    When I enter credentials.user into input field c2m.username
    And I enter credentials.pass into input field c2m.password
    And I click on element c2m.sign_in
    And I wait for 7 sec
    #And I switch to main content
    And I switch to frame frame.main_frame
    And I wait for 3 sec
    And I click on element main.main_menu
    And element main.customer_information should be present
    And I click on element main.customer_information
    And element submenu.premise should be present
    And I click on element submenu.premise
    And I click element submenu.search
    And I wait for 3 sec
    And I move to new window
    And I wait for 2 sec
    And I click on element premisepage.premise_icon
    And I wait for 3 sec
    And I move to new window
    And I wait for 2 sec
    And I click on element premisepage.premise_icon
    And I wait for 3 sec
    And I move to new window
    And I wait for 2 sec
    And I click on element premisepage.premise_icon
    And I wait for 3 sec
    Then I move to new window
    And I wait for 2 sec
    And I enter "ABC" into input field premisepage.addpremise_address_details
    And I wait for 3 sec
    Then I move to previous window
    And I wait for 2 sec
    And I enter "DEF" into input field premisepage.addpremise_address_details
    And I wait for 3 sec
    Then I move to previous window
    And I wait for 2 sec
    And I enter "XYZ" into input field premisepage.addpremise_address_details
    And I wait for 3 sec
    Then I move to previous window
    And I wait for 2 sec
    And I enter "1234" into input field premisepage.addpremise_address_details
    And I wait for 3 sec
    Then I move to previous window
     And I switch to main content
    And I switch to frame frame.main_frame
    And I click on element main.main_menu
    And element main.control_central should be present
    And I click on element main.control_central