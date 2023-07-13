#####################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    		Reason:
# 2022-05-22	SAhmad		Initial Version.
# 2022-06-14	VVaidya		Updated code for Xpath changes in Navigation to Financials page
#####################################################################################

Feature: Cancel an Adjustment

  @FIN002 @regression
  Scenario Outline: Verify User is able to Cancel an Adjustment

    #Login C2M
#    Given I navigate to C2M_HOME page
#    When I enter credentials.user into input field c2m.username
#    And I enter credentials.pass into input field c2m.password
#    And I click on element c2m.sign_in

    Given I connect to db
    Given I load data from "<word>" db and "<word>" table
    Given I load the data for feature "FIN002"
    #Cancel an Adjustment

    And I switch to frame frame.main_frame
    And I wait for 5 sec
    And I click on element main.main_menu
    And element main.financial should be present
    And I hover over element main.financial
    And I hover over element submenu.adjustment
    And I click element submenu.search
    And I switch to main content
    And I wait for 5 sec
    And I switch to new window
    And I wait for 3 sec
    And I enter "ADJ_ID" from test data in input field adjustmentpage.adjustment_id
   # And I enter "<ADJUSTMENT ID>" into input field adjustmentpage.adjustment_id
    And I click element adjustmentpage.adjustment_search_btn
    And I switch to previous window
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I click element adjustmentpage.cancel_btn
    And I switch to main content
    And I switch to new window
    And I wait for 5 sec
    And I select "<CANCEL REASON>" option by text from dropdown adjustmentpage.cancel_reason
    And I click element adjustmentpage.cancelreason_ok_btn
    And I switch to previous window
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
 #   Then element adjustmentpage.adjustment_status should have text as "Canceled"

#  Logout C2M
    And I wait for 5 sec
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click element c2mlogout.english_system
    And I click element c2mlogout.logout
   # And I close browser

    Examples:
      |ADJUSTMENT ID|CANCEL REASON|
      |300030483724 |Incorrect Adjustment Type|
