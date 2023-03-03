#####################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    		Reason:
# 2022-05-13	SAhmad		Initial Version.
# 2023-01-23	VVaidya		Updated code
#####################################################################################

Feature: Adding a Severance Process

  @CC006 @regression
    Scenario Outline: Verify User is able to Add a Severance Process

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


    #Add Severance Process page
    And I switch to main content
    And I switch to frame frame.main_frame
    And I hover over element context.acctctx_gotosevproc
    And I click element context.add

  #Switch to Service Agreement Search Window
    And I switch to main content
    And I wait for 10 sec
    And I switch to new window
    And I enter "<SA ID>" into input field severanceprocesspage.sa_id
    And I click element severanceprocesspage.sa_search_button
    And I switch to previous window


     # Switch to Severance Process Page
    And I wait for 3 sec
    #Then I should see page title as "Severance Process"
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame

  # Populate Required Severance Process Page Values
    And I enter "<SERVICE AGREEMENT>" into input field severanceprocesspage.sa_field
    And I select "<SEVERANCE PROCESS TEMPLATE>" option by text from dropdown severanceprocesspage.svrnc_temp_dropdown
    And I enter "<COMMENTS>" into input field severanceprocesspage.comments_field
    And I enter "<SEVERANCE AMOUNT BASE DATE>" into input field severanceprocesspage.svrnc_amnt_date
    #Then option "Active" by text from dropdown severanceprocesspage.svrnc_status should be selected
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click element actionbuttons.save

  #    # Logout C2M
#    And I switch to main content
#    And I switch to frame frame.main_frame
#    And I click element c2mlogout.english_system
#    And I click element c2mlogout.logout
#    And I close browser

    Examples:
      |SEARCH BY  |ACCOUNT ID|CIS DIVISION|SA ID|SEVERANCE PROCESS TEMPLATE|COMMENTS|SEVERANCE AMOUNT BASE DATE|
      #C2MDEV|Account ID |3409991894|Colorado Springs Utilities |3409991331|Standard utility severance|NGTP Severance process Testing|06-24-2022|
  |Account ID |0002415856|Colorado Springs Utilities |0002415938|Normal Utility Severance|NGTP Severance process Testing|06-24-2022|
#      |Account ID |7697669556|Division 1 |7694662711 |Standard utility severance|NGTP Test Severance Process|05-18-2022|(DEMO EXAMPLES)
