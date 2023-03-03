#####################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    		Reason:
# 2022-08-19	vvaidya		Initial Version.

#####################################################################################

Feature: Verify Service Point and Device Information is Retrieved

  @CM100 @regression
  Scenario Outline: Verify Service Point and Device Information is Retrieved

    #User is Logged In
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
    And I click on element main.control_central

    #Control Central Search Page
    And I wait 10 seconds for element frame.tabpage_frame to display
    And I switch to frame frame.tabpage_frame
    And I select "<searchBy>" option by text from dropdown controlcentralsearch.search_by
    And I wait 10 seconds for element controlcentralsearch.account_id to display
    And I enter "<accountId>" into input field controlcentralsearch.account_id
    And I select "<cisDivision>" option by text from dropdown controlcentralsearch.cis_division
    And I click element controlcentralsearch.search

    #Go to Control Central Page
   # And element frame.tabpage_zonemapframe1 should be present
    #And I switch to frame frame.tabpage_zonemapframe1

    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.dashboard
    And I switch to frame frame.dashboard_zonemapframe201
    And I click on element controlcentral.account_context_menu
    And I switch to main content
    And I switch to frame frame.main_frame
    And I hover over element context.acctctx_gotoaccount
   ##############################################################
#    #Go to Account Context Menu and Go to Account
#    And I switch to main content
#    And I switch to frame frame.main_frame
#    And I switch to frame frame.dashboard
#    And I switch to frame frame.dashboard_zonemapframe201
#  #dashboard_zonemapframe202
##    And I switch to frame frame.dashboard_zonemapframe204
#   # And I wait 10 seconds for element dashboard.servicepoint_ctx_menu to display
#    #And I switch to frame frame.dashboard_zonemapframe202
#    And I wait 10 seconds for element dashboard.account_cntx_menu to display
#    And I click on element dashboard.account_cntx_menu
#    And I wait for 3 sec
#    And I switch to main content
#    And I switch to frame frame.main_frame
#    And I click on element context.acctctx_gotoaccount
#    And I switch to frame frame.tabmenu_frame
####################################################################

    # Logout C2M
#    And I switch to main content
#    And I switch to frame frame.main_frame
#    And I click element c2mlogout.english_system
#    And I click element c2mlogout.logout
#    And I close browser

    Examples:
      |searchBy	|accountId	|cisDivision	|
      | Account ID | 6268773167 | Colorado Springs Utilities  |
