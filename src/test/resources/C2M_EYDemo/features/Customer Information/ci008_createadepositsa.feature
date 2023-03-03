#####################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    		Reason:
# 2022-05-20	SAhmad		Initial Version.
#
#####################################################################################

Feature: Create a Deposit SA

  @CI008 @regression
  Scenario Outline: Verify User is able to Create a Deposit SA

#   Login C2M
    Given I navigate to C2M_HOME page
    When I enter credentials.user into input field c2m.username
    And I enter credentials.pass into input field c2m.password
    And I click on element c2m.sign_in

    #Click on Control Central Search
    And I switch to frame frame.main_frame
    And I click on element main.main_menu
    And element main.control_central should be present
    And I click on element main.control_central

    #Control Central Search Page
    And I wait for 3 sec
    Then I should see page title as "Control Central Search"
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I select "<SEARCH BY>" option by text from dropdown controlcentralsearch.search_by
    And element controlcentralsearch.account_id should be present
    And I enter "<ACCOUNT ID>" into input field controlcentralsearch.account_id
    And I select "<CIS DIVISION>" option by text from dropdown controlcentralsearch.cis_division
    And I click element controlcentralsearch.search

    And I wait for 270 sec
#    #Create a Deposit SA
#    And I wait for 3 sec
#   # Then I should see page title as "Control Central"
#    And element frame.tabpage_zonemapframe1 should be present
#    And I switch to frame frame.tabpage_zonemapframe1
#    And I click on element controlcentral.account_context_menu
#    And I switch to main content
#    And I switch to frame frame.main_frame
##    And I hover over element context.sactx_gotosa_demo
#    And I hover over element context.sactx_gotosa
#    And I click element context.add
#
#     # Switch to Service Agreement Page
#    And I wait for 3 sec
#    Then I should see page title as "Service Agreement"
#    And I switch to main content
#    And I switch to frame frame.main_frame
#    And I switch to frame frame.tabpage_frame
#
#    # Populate Required Service Agreement Page Values
#    And I select "<DIVISION>" option by text from dropdown serviceagreementpage.cis_division
#    And I enter "<SA TYPE>" into input field serviceagreementpage.sa_type
#    And I press "TAB" key into input field serviceagreementpage.sa_type
#    And I enter "<CHAR PREMISE ID>" into input field serviceagreementpage.char_premiseid
#    And I press "TAB" key into input field serviceagreementpage.char_premiseid
#    And I clear input field serviceagreementpage.deposit_amount
#    And I enter "<DEPOSIT AMOUNT>" into input field serviceagreementpage.deposit_amount
#    And I press "TAB" key into input field serviceagreementpage.deposit_amount
#    And I switch to main content
#    And I switch to frame frame.main_frame
#    And I click element actionbuttons.save

#    Logout C2M
#    And I switch to main content
#    And I switch to frame frame.main_frame
#    And I click element c2mlogout.english_system
#    And I click element c2mlogout.logout
#    And I close browser


    Examples:
      | SEARCH BY | ACCOUNT ID | CIS DIVISION | DIVISION | SA TYPE | CHAR PREMISE ID | DEPOSIT AMOUNT |
    #  | Account ID | 1726290518 | Colorado Springs Utilities  | Colorado Springs Utilities | RESDEP | 0109625593 | 100 |
# C2MDEMO     | Account ID | 6131518727 | California  | California | DEP-RES | 6320288652    | 100 |(DEMO_EXAMPLE)
    #C2MTEST  | Account ID | 0033898174 | Colorado Springs Utilities  | Colorado Springs Utilities | RESDEP | 8936688817 | 100 |
    #C2MQA
    #C2MTEST| Account ID | 0033898174 | Colorado Springs Utilities  | Colorado Springs Utilities | RESDEP | 8936688817 | 100 |
      | Account ID | 0000828556 | Colorado Springs Utilities  | Colorado Springs Utilities | RESDEP | 3668752432 | 20 |