#####################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    	   Reason:
# 2022-04-27	AThott	   Initial Version.
#
#####################################################################################

Feature: Verify User is able to Stop a Service Agreement via Start/Stop page



  @CI007 @regression
  Scenario Outline: Verify User is able to Stop a Service Agreement via Start/Stop page

    #User is Logged In
    Given I navigate to C2M_HOME page
    When I enter credentials.user into input field c2m.username
    And I enter credentials.pass into input field c2m.password
    And I click on element c2m.sign_in


     #Switch to Control Central Search Page
    And I switch to frame frame.main_frame
    And I click on element main.main_menu
    And element main.control_central should be present
    And I click element main.control_central
    And element frame.tabpage_frame should be present
    And I switch to frame frame.tabpage_frame

     #Populate Required Control Central Search Page Values
    And I select "<SEARCH BY>" option by text from dropdown controlcentralsearch.search_by
    And element controlcentralsearch.account_id should be present
    And I enter "<ACCOUNT ID>" into input field controlcentralsearch.account_id
   # And I select "<CIS DIVISION>" option by text from dropdown controlcentralsearch.cis_division
    And I click element controlcentralsearch.search

    #Switch to Control Central Page
   # And element frame.tabpage_zonemapframe1 should be present
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.dashboard
    And I click element controlcentral.account_context_menu

    And I switch to main content
    And I switch to frame frame.main_frame
    And element context.acctctx_gotostartstop should be present
    And I click element context.acctctx_gotostartstop

    #Switch to Start/Stop Page
    And element frame.tabpage_frame should be present
    And I switch to frame frame.tabpage_frame

    #Populate Required Start/Stop Values
    And I enter "<Stop Date>" into input field startstoppage.stopdate_service
    And I select "<Stop Method>" option by text from dropdown startstoppage.stopmethod_service
    And I enter "<PremiseId>" into input field startstoppage.addressstop_service
    And I press "TAB" key into input field startstoppage.addressstop_service
    And I click element startstoppage.stop_sa


    #Switch to Dashboard frame
    And I switch to main content
    And I switch to frame frame.main_frame
    And element frame.dashboard should be present
    And I switch to frame frame.dashboard
    And element frame.dashboard_zonemapframe201 should be present
    And I switch to frame frame.dashboard_zonemapframe201
    And element dashboard.alert_service should be present
    And I click element dashboard.alert_service

    #Switch to menu frame
    And I switch to main content
    And I switch to frame frame.main_frame
    And element frame.tabmenu_frame should be present
    And I switch to frame frame.tabmenu_frame

     #Switch to field activity Page
    And I click element fieldactivitypage.main

    #switch to FA_ACTION_PANEL frame
    And I switch to main content
    And I switch to frame frame.main_frame
    And element frame.tabpage_frame should be present
    And I switch to frame frame.tabpage_frame
    And I switch to frame frame.fa_action_panel_frame
    And element fieldactivitypage.complete should be present
    And I click on element fieldactivitypage.complete

    #Switch to Dashboard frame
    And I switch to main content
    And I switch to frame frame.main_frame
    And element frame.dashboard should be present
    And I switch to frame frame.dashboard
    And element frame.dashboard_zonemapframe204 should be present
    And I switch to frame frame.dashboard_zonemapframe204
    And I click on element dashboard.account_context_menu

    And I switch to main content
    And I switch to frame frame.main_frame

    And I hover over element context.acctctx_gotosa
    And I click on element context.search

   #Switch to new Window
    And I wait for 10 sec
    And I switch to new window
    And I wait for 10 sec

    And I switch to main content
    And I switch to frame frame.data_frame
    And element serviceagreementpage.stop_pending should be present
    And I click element serviceagreementpage.stop_pending

  #Switch to Previous Window
    And I wait for 10 sec
    And I switch to previous window
    And I wait for 10 sec

    #Switch to Service Agreement Page
    And I switch to main content
    And I switch to frame frame.main_frame
    And element frame.tabpage_frame should be present
    And I switch to frame frame.tabpage_frame
    And element serviceagreementpage.stop_sa should be present
    And I click element serviceagreementpage.stop_sa


    #Logout C2M
#    And I switch to main content
#    And I switch to frame frame.main_frame
#    And I click element c2mlogout.english_system
#    And I click element c2mlogout.logout
#    And I close browser

    Examples:
      | SEARCH BY  | ACCOUNT ID | CIS DIVISION | Stop Date | Stop Method    | PremiseId  |
      | Account ID | 0000118073 | California   | 01-23-2023| Stop a Premise | 9126646716 |