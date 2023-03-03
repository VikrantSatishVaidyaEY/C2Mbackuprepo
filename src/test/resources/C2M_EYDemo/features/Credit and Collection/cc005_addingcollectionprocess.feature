#####################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    		Reason:
# 2022-04-27	SAhmad		Initial Version.
#2023-01-22	  VVaidya		Updates to code
#####################################################################################

Feature: Adding a Collection Process

  @CC005 @regression
  Scenario Outline: Verify User is able to Add a Collection Process

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

    #Go to Collection process
    And I switch to main content
    And I switch to frame frame.main_frame
    And I hover over element context.acctctx_gotocollproc
    And I click element context.add


    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame

  # Populate Required Collection Process Page Values
    And I enter "<COLLECTION CLASS CONTROL>" into input field collectionprocesspage.cltn_cntrl_field
    And I press "TAB" key into input field collectionprocesspage.cltn_cntrl_field
    And I select "<COLLECTION PROCESS TEMPLATE>" option by text from dropdown collectionprocesspage.cltn_temp_dropdown
    And I enter "<DAYS IN ARREARS>" into input field collectionprocesspage.days_arrear_field
    And I enter "<COMMENTS>" into input field collectionprocesspage.comments_field
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabmenu_frame
    And I click on element tabs.sas
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I enter "<SERVICE AGREEMENT>" into input field collectionprocesspage.sa_field
    And I select "<STATUS>" option by text from dropdown collectionprocesspage.cltn_status_dropdown
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabmenu_frame
    And I click element tabs.events
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I select "<COLLECTION EVENT TYPE>" option by text from dropdown collectionprocesspage.cltn_event_dropdown
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click element actionbuttons.save

    # Logout C2M
#    And I switch to main content
#    And I switch to frame frame.main_frame
#    And I click element c2mlogout.english_system
#    And I click element c2mlogout.logout
#    And I close browser

    Examples:
      |SEARCH BY |ACCOUNT ID|CIS DIVISION |COLLECTION CLASS CONTROL |COLLECTION PROCESS TEMPLATE|DAYS IN ARREARS|COMMENTS |SERVICE AGREEMENT|STATUS|COLLECTION EVENT TYPE|
      |Account ID |9000835821|Colorado Springs Utilities |RES UTIL |Normal Utility Debt Industrial/Large Commercial |40 |NGTP Collection process Testing|9000835854 |Active|Cancel Budget Billing |