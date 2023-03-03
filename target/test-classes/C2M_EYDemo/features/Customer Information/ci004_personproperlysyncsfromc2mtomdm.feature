#####################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    	   Reason:
# 2022-05-19    CTongo     Initial Version.
#####################################################################################

Feature: Person properly syncs from C2M to MDM

  @CI004 @regression
  Scenario Outline: Person properly syncs from C2M to MDM

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


    And I wait for 480 sec
    #Go To Start/Stop Page
#    And I wait for 15 sec
#    And I switch to main content
#    And I switch to frame frame.main_frame
#    And I switch to frame frame.dashboard
#      #C2MDEV
#    And I switch to frame frame.dashboard_zonemapframe202
##    And I switch to frame frame.dashboard_zonemapframe204
#    And I wait 10 seconds for element dashboard.account_ctx_menu to display
#    And I click element dashboard.account_ctx_menu
#    And I switch to main content
#    And I switch to frame frame.main_frame
#    And I click element context.acctctx_gotostartstop
#
#    #Populate Required Start/Stop Values
#    And I switch to frame frame.tabpage_frame
#    And I enter "<startDate>" into input field startstoppage.startdate_service
#    And I select "<startMethod>" option by text from dropdown startstoppage.startmethod_service
#    And I enter "<address>" into input field startstoppage.address_service
#    And I press "TAB" key into input field startstoppage.address_service
#    And I wait 10 seconds for element startstoppage.city_service to display
#    And I enter "<city>" into input field startstoppage.city_service
#    And I press "TAB" key into input field startstoppage.city_service
#    And I click element startstoppage.start_service
#
#    #Switch to start/stop Window
#    And I wait for 5 sec
#    And I switch to new window
#
#    #Select the appropriate Start/Stop page values and enter the corresponding value
#    And I switch to main content
#    And I clear input field startstoppage.startopt_service
#    And I enter "<rate>" into input field startstoppage.startopt_service
#    And I press "TAB" key into input field startstoppage.startopt_service
#    And I click element startstoppage.sastart_service
#    And I wait for 5 sec
#    And I accept alert
#
#    #Switch to Start/Stop Page
#    And I wait for 5 sec
#    And I switch to previous window
#
#    #Enable if data has one existing SA with the same rate
#    ###This is to complete the Field Activity for Pending Stop
#    #Go To Pending Field Activity
#    And I switch to frame frame.main_frame
#    And I switch to frame frame.dashboard
##    And I switch to frame frame.dashboard_zonemapframe201
#    And I click element dashboard.field_activity_alert
#
#    #Switch to Main Tab
#    And I switch to main content
#    And I switch to frame frame.main_frame
#    And I switch to frame frame.tabmenu_frame
#    And I click element tabs.main
#
#    #Complete Field Activity
#    And I switch to main content
#    And I switch to frame frame.main_frame
#    And I switch to frame frame.tabpage_frame
#    And I switch to frame frame.fa_action_panel_frame
#    And I click element fieldactivitypage.complete
#    And I switch to main content
#
#    ###This is to complete the Field Activity for Pending Start
#    #Go To Pending Field Activity
#    And I switch to frame frame.main_frame
#    And I switch to frame frame.dashboard
##    And I switch to frame frame.dashboard_zonemapframe201
#    And I click element dashboard.field_activity_alert
#
#    #Switch to Main Tab
#    And I switch to main content
#    And I switch to frame frame.main_frame
#    And I switch to frame frame.tabmenu_frame
#    And I click element tabs.main
#
#    #Complete Field Activity
#    And I switch to main content
#    And I switch to frame frame.main_frame
#    And I switch to frame frame.tabpage_frame
#    And I switch to frame frame.fa_action_panel_frame
#    And I click element fieldactivitypage.complete
#    And I switch to main content
#
#    #Go To Pending Start SA
#    And I switch to main content
#    And I switch to frame frame.main_frame
#    And I switch to frame frame.dashboard
#    And I switch to frame frame.dashboard_zonemapframe201
#    And I click element dashboard.pending_sa_alert
#
#    #Go to Pending Service Agreement Page
#    And I switch to main content
#    And I switch to frame frame.main_frame
#    And I switch to frame frame.tabpage_frame
#    And I switch to frame frame.startstop_gridframe
#    And I click element startstoppage.sa_context_menu
#    And I switch to main content
#    And I switch to frame frame.main_frame
#    And I click element context.sactx_gotosa
#
#    #Activate Service Agreement
#    And I wait for 3 sec
#    And I switch to main content
#    And I switch to frame frame.main_frame
#    And I switch to frame frame.tabpage_frame
#    And I click element serviceagreementpage.activate_sa
#    And I wait for 3 sec
#
#    #Go to SA 360 View
#    And I click element serviceagreementpage.sa_ctx_menu
#    And I switch to main content
#    And I switch to frame frame.main_frame
#    And I click element context.sactx_gotothreesixtyview
#    And I wait for 5 sec
#
#    #Switch to Contact Tab
#    And I switch to main content
#    And I switch to frame frame.main_frame
#    And I switch to frame frame.tabmenu_frame
#    And I click on element tabs.contact_tab
#    And I wait for 3 sec
#
#    #Logout C2M
#    And I switch to main content
#    And I switch to frame frame.main_frame
#    And I click element c2mlogout.english_system
#    And I click element c2mlogout.logout
#   # And I close browser

    Examples:
      | searchBy  | accountId | cisDivision | startDate | startMethod    | address                | city     | rate |
      #C2MTEST| Account ID | 7318421899 | Colorado Springs Utilities  | 02-10-2022 | Start a Premise | 3044 S ACADEMY BLVD | COLO SPGS | E-CM |
      | Account ID | 9047867132 | Colorado Springs Utilities  | 02-10-2022 | Start a Premise | 3044 S ACADEMY BLVD | COLO SPGS | E-CM |