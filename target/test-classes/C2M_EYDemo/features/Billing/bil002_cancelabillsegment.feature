#####################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    		Reason:
# 2022-05-13	Jlonga		Initial Version.
#
#####################################################################################

Feature: Cancelling a Bill Segment

  @BIL002 @regression
  Scenario Outline: Verify user is able to cancel a bill segment

#   Login C2M
    Given I navigate to C2M_HOME page
    When I enter credentials.user into input field c2m.username
    And I enter credentials.pass into input field c2m.password
    And I click on element c2m.sign_in

    #Click on Control Central Search
    And I wait for 5 sec
    And I switch to frame frame.main_frame
    And I wait for 3 sec
    And I click on element main.main_menu
    And element main.control_central should be present
    And I click on element main.control_central

    #Control Central Search Page
    And I wait for 3 sec
    Then I should see page title as "Control Central Search"
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I wait 10 seconds for element controlcentralsearch.search_by to display
    And I select "<SEARCH BY>" option by text from dropdown controlcentralsearch.search_by
    And element controlcentralsearch.account_id should be present
    And I enter "<ACCOUNT ID>" into input field controlcentralsearch.account_id
   # And I select "<CIS DIVISION>" option by text from dropdown controlcentralsearch.cis_division
    And I click element controlcentralsearch.search

    #Go to Account context Menu
    And I wait for 7 sec
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.dashboard
    And I click element controlcentral.account_context_menu

    #old code
#    And I wait for 3 sec
#    Then I should see page title as "Control Central"
#    And element frame.tabpage_zonemapframe1 should be present
#    And I switch to frame frame.tabpage_zonemapframe1
#    And I click on element controlcentral.account_context_menu

    #Go To Bill Search Page
    And I switch to main content
    And I switch to frame frame.main_frame
    And I hover over element context.acctctx_gotobill
    And I click element context.search

    #Search for Bill Id
    And I wait for 3 sec
    And I switch to new window
    And element billpage.bill_id should be present
    And I enter "<BILL ID>" into input field billpage.bill_id
    And I click element billpage.bill_search_btn

    #Go To Bill Segment
    And I switch to previous window
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I switch to frame frame.bseg_frame
    And I click element billpage.bseg_link

    #Initiate Cancellation
    And I wait for 3 sec
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I click element billsegmentpage.init_cancel_btn
    And I wait for 3 sec
    And I switch to new window
    And element billsegmentpage.cancel_reason should be present
    And I select "<CANCEL REASON>" option by text from dropdown billsegmentpage.cancel_reason
    And I click element billsegmentpage.init_cancel_btn

    #Cancel the Bill Segment
    And I switch to previous window
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I wait for 3 sec
    And I click element billsegmentpage.cancel_bill_btn

    And I wait for 3 sec

    # Logout C2M
    And I wait for 5 sec
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click element c2mlogout.english_system
    And I click element c2mlogout.logout
   # And I close browser

    # C2MDemo
#    Examples:
#      |SEARCH BY  |ACCOUNT ID|CIS DIVISION  |BILL ID | CANCEL REASON |
#      |Account ID |6343565982|California    |634253046673  |Wrong read|

    # C2MTest
    Examples:
      |SEARCH BY  |ACCOUNT ID|CIS DIVISION  |BILL ID | CANCEL REASON |
      |Account ID |2611513809|Colorado SPGS    |261158543448  |Billed In Error|