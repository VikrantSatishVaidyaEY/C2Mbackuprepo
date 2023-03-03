#####################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    		Reason:
# 2022-05-19	CTongo  	Initial Version.
#####################################################################################

Feature: Rate Change properly syncs Rate History

  @BIL007 @regression
  Scenario Outline: Rate Change properly syncs Rate History

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
    And I click on element main.control_central

    #Control Central Search Page
    And I wait 10 seconds for element frame.tabpage_frame to display
    And I switch to frame frame.tabpage_frame
    And I select "<searchBy>" option by text from dropdown controlcentralsearch.search_by
    And I wait 10 seconds for element controlcentralsearch.account_id to display
    And I enter "<accountId>" into input field controlcentralsearch.account_id
    And I select "<cisDivision>" option by text from dropdown controlcentralsearch.cis_division
    And I click element controlcentralsearch.search

      #Workaround for C2MDEV
    And I wait for 10 sec
      #manually click server issue error warning
    And I wait for 10 sec

    #Go to Service Agreement Page
#    And I wait for 3 sec
#    And I switch to main content
#    And I switch to frame frame.main_frame
#    And I switch to frame frame.dashboard
#      #C2MDEV
#    And I switch to frame frame.dashboard_zonemapframe202
##    And I switch to frame frame.dashboard_zonemapframe204
#    And I wait 10 seconds for element dashboard.account_ctx_menu to display
#    And I click element dashboard.account_ctx_menu

    #old code
#    #C2MDEV Workaround for dashboard is not loading
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

    #Go to SA page
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click element context.acctctx_gotosa
    And I click element submenu.search

    #Update SA Rate History
    And I wait for 3 sec
    And I switch to frame frame.tabmenu_frame
    And I click element tabs.rateinfo_tab
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I switch to frame frame.rate_frame
    And I click element serviceagreementpage.rateinfo_plusicon
    And I clear input field serviceagreementpage.rateinfo_date
    And I enter "<date>" into input field serviceagreementpage.rateinfo_date
    And I enter "<rate>" into input field serviceagreementpage.rateinfo_rate
    And I press "TAB" key into input field serviceagreementpage.rateinfo_rate
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click element actionbuttons.save
    And I wait for 3 sec

    #Validate Rate properly syncs Usage Subscription Rate History
    And I switch to frame frame.tabpage_frame
    And I click element serviceagreementpage.sa_ctx_menu
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click element context.sactx_goto_usage_sub
    And I wait for 5 sec

    #Logout C2M
#    And I switch to main content
#    And I switch to frame frame.main_frame
#    And I click element c2mlogout.english_system
#    And I click element c2mlogout.logout
   # And I close browser

    Examples:
      | searchBy   | accountId  | cisDivision | date       | rate  |
      | Account ID | 8019420504| Colorado Springs Utilities  | 05-25-2022 | E1R |
