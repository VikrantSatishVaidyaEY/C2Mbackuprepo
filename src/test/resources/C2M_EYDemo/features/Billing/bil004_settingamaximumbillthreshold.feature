#####################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    		Reason:
# 2022-05-25	CTongo		Initial Version.
  # 2023-01-25	Vvaidya		Updated code
#####################################################################################

Feature: Verify User is able to Setup a Maximum Bill Threshold

  @BIL004 @regression
  Scenario Outline: Verify User is able to Setup a Maximum Bill Threshold

    #Login C2M
    Given I navigate to C2M_HOME page
    When I enter credentials.user into input field c2m.username
    And I enter credentials.pass into input field c2m.password
    And I click on element c2m.sign_in

    #Click on Control Central Search
    And I wait for 5 sec
    And I switch to frame frame.main_frame
    And I wait 10 seconds for element main.main_menu to display
    And I click on element main.main_menu
    And I wait 10 seconds for element main.control_central to display
    And I click element main.control_central

    #Search by Account ID and click Search
    And I wait for 10 sec
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I wait 10 seconds for element controlcentralsearch.search_by to display
    And I select "<searchBy>" option by text from dropdown controlcentralsearch.search_by
    And I wait 10 seconds for element controlcentralsearch.account_id to display
    And I enter "<accountId>" into input field controlcentralsearch.account_id
    And I select "<cisDivision>" option by text from dropdown controlcentralsearch.cis_division
    And I click element controlcentralsearch.search

    #Go to SA
#    And I wait for 15 sec
#    And I switch to main content
#    And I switch to frame frame.main_frame
#    And I switch to frame frame.dashboard
#    And element frame.dashboard_zonemapframe202 should be present
#    And I switch to frame frame.dashboard_zonemapframe202
#    And I wait 10 seconds for element dashboard.account_ctx_menu to display
#    And I click element dashboard.account_ctx_menu

    #old code
#    #C2MDEV Workaround for dashboard is not loading
#    And I wait for 10 sec
#    And I switch to main content
#    And I switch to frame frame.main_frame
#    And I switch to frame frame.tabpage_frame
#    And I switch to frame frame.tabpage_zonemapframe1
#    And I wait 10 seconds for element controlcentral.account_context_menu to display
#    And I click element controlcentral.account_context_menu

    #Go to Account context Menu
    And I wait for 7 sec
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.dashboard
    And I click element controlcentral.account_context_menu

    And I switch to main content
    And I switch to frame frame.main_frame
    And I wait 10 seconds for element context.acctctx_gotosa to display
    And I click element context.acctctx_gotosa
    And I click element context.search

    #Update High Bill Threshold
    And I wait for 10 sec
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I clear input field serviceagreementpage.max_bill_threshold
    And I enter "<threshold>" into input field serviceagreementpage.max_bill_threshold

    #Click Save
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I click element actionbuttons.save
    #And I wait for 10 sec

    #Logout C2M
#    And I wait for 5 sec
#    And I switch to main content
#    And I switch to frame frame.main_frame
#    And I click element c2mlogout.english_system
#    And I click element c2mlogout.logout
    #And I close browser

    Examples:
      | searchBy  | accountId | cisDivision | threshold |
      | Account ID | 1723477653 | Colorado Springs Utilities | 1000 |