#####################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    		Reason:
# 2022-05-13	Jlonga		Initial Version.
#
#####################################################################################

Feature: Create High Bill Complaint

  @BIL006 @regression
  Scenario Outline: Verify user is able to create high bill complaint case

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
    And I wait for 3 sec
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I wait 10 seconds for element controlcentralsearch.search_by to display
    And I select "<SEARCH BY>" option by text from dropdown controlcentralsearch.search_by
    And element controlcentralsearch.account_id should be present
    And I enter "<ACCOUNT ID>" into input field controlcentralsearch.account_id
    And I select "<CIS DIVISION>" option by text from dropdown controlcentralsearch.cis_division
    And I click element controlcentralsearch.search

    #Go To Case Page
    And I wait for 5 sec
    And element frame.tabpage_zonemapframe1 should be present
    And I switch to frame frame.tabpage_zonemapframe1
    And I click on element controlcentral.account_context_menu
    And I switch to main content
    And I switch to frame frame.main_frame
    And I hover over element context.acctctx_gotocase
    And I click element context.add

    #Select Case Type
    And I wait for 3 sec
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.ui_frame
    And I select "<CASE TYPE>" option by text from dropdown casepage.case_type
    And I click element casepage.ok_btn

    #Save the High Bill Complaint Case
    And element casepage.complaint_desc should be present
    And I enter "<COMPLAINT>" into input field casepage.complaint_desc
    And I select "<CONTACT METHOD>" option by text from dropdown casepage.pref_contact_method
    And I click element casepage.save_btn

    #Logout C2M
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click element c2mlogout.english_system
    And I click element c2mlogout.logout
    And I close browser

    Examples:
      |SEARCH BY  |ACCOUNT ID|CIS DIVISION  |CASE TYPE |COMPLAINT |CONTACT METHOD |
      |Account ID |0053604592|Colorado Springs Utilities    |High Bill Complaint  |High Bill Description|Postal |
