#####################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    		Reason:
# 2022-04-14	SAhmad		Initial Version.
# 2022-05-31	SAhmad		Add a step for validation
#####################################################################################

Feature: Modifying Collection Event Trigger Date

  @CC012 @regression
  Scenario Outline: Verify user is able to Modify Collection Event Trigger Date

    #Login C2M
    Given I navigate to C2M_HOME page
    When I enter credentials.user into input field c2m.username
    And I enter credentials.pass into input field c2m.password
    And I click on element c2m.sign_in

    #Click on Control Central Search
    And I switch to frame frame.main_frame
    And I wait for 5 sec
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

     #Go to Account context Menu
    And I wait for 7 sec
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.dashboard
    And I click element controlcentral.account_context_menu

    #Search an Active collection process
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click on element context.acctctx_gotocollproc
    And I click element context.search
    And I wait for 10 sec

    #Select an Active collection process to cancel
    And I switch to main content
    And I wait for 7 sec
    And I switch to new window
    And I switch to frame frame.data_frame
    And I wait 4 seconds for element collectionprocesspage.active_collproc to display
    And I click on element collectionprocesspage.active_collproc
    And I switch to previous window

    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabmenu_frame
    And I click element tabs.events
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And validate the attribute value from the element collectionprocesspage.event_sequence for event sequence <eventSequence> if not matched click collectionprocesspage.event_right_arrow
    And I clear input field collectionprocesspage.trigger_date
    And I enter "<TRIGGER DATE>" into input field collectionprocesspage.trigger_date
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click element actionbuttons.save


#    Logout C2M
#    And I switch to main content
#    And I switch to frame frame.main_frame
#    And I click element c2mlogout.english_system
#    And I click element c2mlogout.logout
#    And I close browser

    Examples:
      | SEARCH BY  | ACCOUNT ID | CIS DIVISION | TRIGGER DATE | eventSequence |
      #C2MTEST| Account ID | 1456426301 | Colorado Springs Utilities  | 06-24-2022 | 10 |
      | Account ID | 0497720674 | Colorado Springs Utilities  | 06-24-2022 | 10 |
