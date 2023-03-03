#####################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    		Reason:
# 2022-04-12	AThott		Initial Version.
# 2022-05-24	CTongo		Update test scripts
  # 2023-01-24	VVaidya		Update test code
#####################################################################################

Feature: Verify user is able to Modify a Severance Event Trigger Date

  @CC013 @regression
  Scenario Outline: Verify user is able to Modify a Severance Event Trigger Date

    #User is Logged In
    Given I navigate to C2M_HOME page
    When I enter credentials.user into input field c2m.username
    And I enter credentials.pass into input field c2m.password
    And I click on element c2m.sign_in

    #Go to Control Central Page
    And I switch to frame frame.main_frame
    And I wait for 5 sec
    And I click on element main.main_menu
    And element main.control_central should be present
    And I click element main.control_central

    #Control Central Page
    And I switch to frame frame.tabpage_frame
    And I select "<Search By>" option by text from dropdown controlcentralsearch.search_by
    And I enter "<Account ID>" into input field controlcentralsearch.account_id
    And I select "<CIS Division>" option by text from dropdown controlcentralsearch.cis_division
    And I click element controlcentralsearch.search

     #Go to Account context Menu
    And I wait for 7 sec
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.dashboard
    And I click element controlcentral.account_context_menu

     #Add Severance Process page
    And I switch to main content
    And I switch to frame frame.main_frame
    And I hover over element context.acctctx_gotosevproc
    And I click element context.search

    #Select an Active Severance process
    And I switch to main content
    And I wait for 7 sec
    And I switch to new window
    And I switch to frame frame.data_frame
    And I wait 4 seconds for element severanceprocesspage.active_severproc to display
    And I click on element severanceprocesspage.active_severproc
    And I switch to previous window

#
#    #Go to Severance Process Page and events tab
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabmenu_frame
    And I click element tabs.events

    #update trigger date
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And validate the attribute value from the element severanceprocesspage.event_sequence for event sequence <eventSequence> if not matched click severanceprocesspage.event_right_arrow
    And I clear input field severanceprocesspage.event_trigger_date
    And I enter "<Event Trigger Date>" into input field severanceprocesspage.event_trigger_date
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click element actionbuttons.save
    And I wait for 3 sec

    #Logout C2M
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click element c2mlogout.english_system
    And I click element c2mlogout.logout
   # And I close browser

    Examples:
      |Search By |Account ID|CIS Division|eventSequence|Event Trigger Date|
      |Account ID|2611513809|Colorado Springs Utilities |20            |01-26-2023        |