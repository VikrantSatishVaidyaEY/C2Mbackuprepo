#####################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    		Reason:
# 2022-06-07	CTongo		Initial Version.
#
#####################################################################################

Feature: Add Premise to Existing Landlord Agreement

  @CI011 @regression
  Scenario Outline: Add Premise to Existing Landlord Agreement

#   Login C2M
    Given I navigate to C2M_HOME page
    When I enter credentials.user into input field c2m.username
    And I enter credentials.pass into input field c2m.password
    And I click on element c2m.sign_in

    #Go To Premise Management
    And I wait for 5 sec
    And I switch to frame frame.main_frame
    And element main.main_menu should be present
    And I click on element main.main_menu
    And element main.customer_information should be present
    And I click on element main.customer_information
    And element submenu.premise_mgmt should be present
    And I click on element submenu.premise_mgmt

    #Search for the Child Premise
    And I wait for 5 sec
    And I switch to frame frame.tabpage_frame
    And I wait 10 seconds for element premisemanagementpage.premise_filter to display
    And I select "<premiseFilter>" option by text from dropdown premisemanagementpage.premise_filter
    And I wait 10 seconds for element premisemanagementpage.premise_id to display
    And I enter "<PremiseId>" into input field premisemanagementpage.premise_id
    And I press "TAB" key into input field premisemanagementpage.premise_img
    And I click on element premisemanagementpage.search_btn

    #Tick Child Premise Checkbox and Assign Landlord to the Premise
    And I wait for 5 sec
    And I switch to frame frame.datagrid_frame
    And I wait 10 seconds for element premisemanagementpage.child_prem_chk_box to display
    And I click on element premisemanagementpage.child_prem_chk_box
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I click on element premisemanagementpage.assign_landlord_btn
    And I wait for 10 sec
    And I switch to new window
    And I switch to main content
    And I wait 10 seconds for element premisemanagementpage.landlord_id to display
    And I enter "<landLordId>" into input field premisemanagementpage.landlord_id
    And I press "TAB" key into input field premisemanagementpage.landlord_img
    And I click on element premisemanagementpage.assign_landlord_btn
    And I wait for 5 sec
    And I switch to previous window

    #Validate Parent Premise is added to the Child Premise
    And I wait for 5 sec
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I switch to frame frame.datagrid_frame
    And I click on element premisemanagementpage.child_prem_link
    And I wait for 10 sec

#   Logout C2M
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click element c2mlogout.english_system
    And I click element c2mlogout.logout
  #  And I close browser


    Examples:
      | premiseFilter  | PremiseId | landLordId |
      | Show This Specific Premise | 5368117267 | 7504962278 |