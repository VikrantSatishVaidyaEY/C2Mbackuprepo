#####################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    		Reason:
# 2022-05-19	CTongo		Initial Version.
#2023-01-10 	VVaidya		Updated code.
#####################################################################################

Feature: Canceling A Payplan

  @CC003 @regression
  Scenario Outline: Cancelling A Payplan
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

    #Search by Account ID and click Search
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
#    And I wait 10 seconds for element controlcentralsearch.search_by to display
    And I select "<searchBy>" option by text from dropdown controlcentralsearch.search_by
#    And I wait 10 seconds for element controlcentralsearch.account_id to display
    And element controlcentralsearch.account_id should be present
    And I enter "<accountId>" into input field controlcentralsearch.account_id
    And I select "<cisDivision>" option by text from dropdown controlcentralsearch.cis_division
    And I click element controlcentralsearch.search
    And I wait for 10 sec


     #Go to Account context Menu
    And I wait for 7 sec
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.dashboard
    And I click element controlcentral.account_context_menu

    #Search a pay plan
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click on element context.acctctx_gotopayplan
    And I click element context.search

    #Select Active Pay plan to cancel
    And I switch to main content
    And I wait for 7 sec
    And I switch to new window
    And I switch to frame frame.data_frame
    And I wait 4 seconds for element payplanpage.active_payplan to display
    And I click on element payplanpage.active_payplan
    And I switch to previous window


    #Cancel Payplan
    And I wait for 3 sec
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I click element payplanpage.cancel_btn
    And I wait for 3 sec
    And I accept alert


#    #Logout C2M
#    And I switch to main content
#    And I switch to frame frame.main_frame
#    And I click element c2mlogout.english_system
#    And I click element c2mlogout.logout
# #   And I close browser

    Examples:
      | searchBy | accountId | cisDivision |
      #C2MTEST| Account ID | 1456426301 | Colorado Springs Utilities |
      | Account ID | 0249438499 | Colorado Springs Utilities |
