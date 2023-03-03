#####################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    		Reason:
# 2022-05-18	CTongo  	Initial Version.
#####################################################################################

Feature: Service Cycle Updates Billing Cycle

  @BIL005 @regression
  Scenario Outline: Service Cycle Updates Billing Cycle

#   Login C2M
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

    #Go to Service Point Page
    #Go to Premise context Menu
    And I wait for 7 sec
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.dashboard
    And I click element controlcentral.premise_context_menu

    #Search a Service point
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click on element context.premctx_gotosp
    And I click element context.search


    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I click on element servicepointpage.sp_link
    And I wait for 7 sec
    #old code
#
#    And I switch to main content
#    And I switch to frame frame.main_frame
#    And I switch to frame frame.dashboard
#      #C2MDEV
#    And I switch to frame frame.dashboard_zonemapframe201
#  #dashboard_zonemapframe202
##    And I switch to frame frame.dashboard_zonemapframe204
#    And I wait 10 seconds for element dashboard.servicepoint_ctx_menu to display
#    And I click element dashboard.servicepoint_link
#    And I wait for 3 sec

    #Update Service Point Measurement Cycle
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I switch to frame frame.tabpage_zonemapframe1
    And I wait 10 seconds for element servicepointpage.edit to display
    And I click element servicepointpage.edit
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.ui_frame
    And I select "<measurementCycle>" option by text from dropdown servicepointpage.measurement_cycle
    And I click element servicepointpage.save
#    And I wait for 10 sec
#    And I switch to main content
#    And I switch to frame frame.main_frame
#    And I switch to frame frame.dashboard
#       #C2MDEV
#    And I switch to frame frame.dashboard_zonemapframe202
##    And I switch to frame frame.dashboard_zonemapframe204
#    And I wait 10 seconds for element dashboard.account_link to display
#    And I click element dashboard.account_link
    #And I wait for 3 sec

    # Logout C2M
#    And I wait for 5 sec
#    And I switch to main content
#    And I switch to frame frame.main_frame
#    And I click element c2mlogout.english_system
#    And I click element c2mlogout.logout
#    And I close browser

    Examples: #Mailing Premise should be enabled and was added to the account, should has an existing measurement cycle and billing cycle
      | searchBy | accountId | cisDivision  | measurementCycle |
    #C2MTEST  | Account ID | 0650096400 | Colorado Springs Utilities | Meter Read Cycle Number 01 |
      | Account ID | 7935633951 | Colorado Springs Utilities | Meter Read Cycle Number 01 |
