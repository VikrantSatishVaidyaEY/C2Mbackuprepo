#####################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    		Reason:
# 2022-05-20	CTongo		Initial Version.
#####################################################################################

Feature: Cancelling A Write Off Process

  @CC010 @regression
  Scenario Outline: Cancelling A Write Off Process
    #User is Logged In
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

    #Search by Account ID and click Search
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I wait 10 seconds for element controlcentralsearch.search_by to display
    And I select "<searchBy>" option by text from dropdown controlcentralsearch.search_by
    And I wait 10 seconds for element controlcentralsearch.account_id to display
    And I enter "<accountId>" into input field controlcentralsearch.account_id
    And I select "<cisDivision>" option by text from dropdown controlcentralsearch.cis_division
    And I click element controlcentralsearch.search

     #Go to Account context Menu
    And I wait for 7 sec
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.dashboard
    And I click element controlcentral.account_context_menu

    #Search an Active Write-off process
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click on element context.acctctx_woproc
    And I click element context.search

    #Select an Active Write-off process to cancel
    And I switch to main content
    And I wait for 7 sec
    And I switch to new window
    And I switch to frame frame.data_frame
    And I wait 4 seconds for element writeoffprocesspage.active_writeoffproc to display
    And I click on element writeoffprocesspage.active_writeoffproc
    And I switch to previous window


    #Cancel Write-Off Process
    And I wait for 3 sec
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I click element writeoffprocesspage.wo_cancel_btn
    And I wait for 3 sec

    #Confirm Alert
    And I accept alert
    And I wait for 3 sec

    #Logout C2M
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click element c2mlogout.english_system
    And I click element c2mlogout.logout
   # And I close browser

    Examples:
      |searchBy|accountId|cisDivision|
      #C2MDEV|Account ID|0710603520|Colorado Springs Utilities|
      #C2MTEST|Account ID|0004504103|Colorado Springs Utilities|
    |Account ID|6905908363|Colorado Springs Utilities|