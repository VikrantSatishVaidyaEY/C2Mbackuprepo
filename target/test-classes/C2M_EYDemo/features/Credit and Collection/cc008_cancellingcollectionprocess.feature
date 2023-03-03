#####################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    		Reason:
# 2022-04-18	SAhmad		Initial Version.
# 2022-04-27    SAhmad      Renamed aleartsection.yaml as dashboard.yaml
#####################################################################################

Feature: Canceling a Collection Process

  @CC008 @regression
  Scenario Outline: Verify user is able to cancel a collection process

#   Login C2M
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

    #Select an Active collection process to cancel
    And I switch to main content
    And I wait for 7 sec
    And I switch to new window
    And I switch to frame frame.data_frame
    And I wait 4 seconds for element collectionprocesspage.active_collproc to display
    And I click on element collectionprocesspage.active_collproc
    And I switch to previous window


    #Cancel Collection Process
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I click element collectionprocesspage.cancel_button
    And I wait for 3 sec
    And I accept alert
    Then element collectionprocesspage.cancel_button should be disabled

    ###old code
    #Click on Collection Process Active Alert Button
#    And I wait for 3 sec
#    Then I should see page title as "Control Central"
#    And I switch to main content
#    And I switch to frame frame.main_frame
#    And I switch to frame frame.dashboard
##    And I wait for 5 sec (DEMO STEP)
##    And I switch to frame frame.dashboard_zonemapframe201 (DEMO STEP)
#    Then element dashboard.collection_active_alert should have text as "Collection Process Active"
#    And I click element dashboard.collection_active_alert
#
##    Collection Process Page
#    And I wait for 3 sec
#    Then I should see page title as "Collection Process"
#    And I switch to main content
#    And I switch to frame frame.main_frame
#    And I switch to frame frame.tabpage_frame
#    And I click element collectionprocesspage.cancel_button
#    And I wait for 3 sec
#    And I accept alert
#    Then element collectionprocesspage.cancel_button should be disabled

    # Logout C2M
#    And I switch to main content
#    And I switch to frame frame.main_frame
#    And I click element c2mlogout.english_system
#    And I click element c2mlogout.logout
#    And I close browser

    Examples:
      | SEARCH BY  | ACCOUNT ID | CIS DIVISION |
      #C2MTEST| Account ID | 1456426301 | Colorado Springs Utilities   |
      | Account ID | 5222969384 | Colorado Springs Utilities   |
#      | Account ID | 7697669556 | Division 1   | (DEMO EXAMPLE)
