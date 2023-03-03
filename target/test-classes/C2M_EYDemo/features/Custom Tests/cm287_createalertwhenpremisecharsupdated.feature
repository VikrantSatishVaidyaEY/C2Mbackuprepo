#####################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    		Reason:
# 2022-08-09	vvaidya	  Initial Version.

#####################################################################################

Feature: Validate Alert is created when Premise Characteristics Updated

  @CM287 @regression
  Scenario Outline: Validate Alert is created when Premise Characteristics Updated

#   Login C2M
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
    #And I select "<cisDivision>" option by text from dropdown controlcentralsearch.cis_division
    And I click element controlcentralsearch.search
    And I wait for 7 sec

    #Go to Premise Context Menu>> Go to Premise
    #Premise Context Menu
    And I switch to main content
    And I switch to frame frame.main_frame
    And I wait for 4 sec
    And I switch to frame frame.tabpage_frame
    And I wait for 4 sec
    And I switch to frame frame.tabpage_zonemapframe1
    And I click on element controlcentral.premise_context_menu
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click on element controlcentral.go_to_premise
    And I wait for 5 sec
    And I switch to new window

    And I wait 10 seconds for element controlcentral.premiseid to display
    And I enter "<premiseId>" into input field controlcentral.premiseid

#    And I switch to frame frame.dashboard
#    And I wait for 4 sec
#    And I switch to frame frame.dashboard_zonemapframe202
#    And I wait for 4 sec
#    And I click on element controlcentral.premise_context_menu
    And I wait for 3 sec
    And I click on element controlcentral.premisesearch
    And I switch to previous window
    And I switch to main content
    And I switch to frame frame.main_frame
    And I wait for 4 sec
#    And I click on element controlcentral.go_to_premise
#    And I wait for 4 sec
    And I switch to frame frame.tabmenu_frame
    And I wait for 4 sec
    And I click on element premisepage.characteristics_tab


    # Enter Premise's Characteristic Type and Characteristic Value
    And I wait for 3 sec
    And I switch to main content
    And element frame.main_frame should be present
    And I switch to frame frame.main_frame
    And I wait for 3 sec
    And element frame.tabpage_frame should be present
    And I switch to frame frame.tabpage_frame
    And I wait for 3 sec
    And I switch to frame frame.premgrid_frame
    And I wait for 3 sec
    And I select "Violence Code" option by text from dropdown premisepage.characteristics_type
    And I clear input field premisepage.characteristics_val
    And I enter "Y" into input field premisepage.characteristics_val
    And I press "TAB" key into input field premisepage.characteristics_val
    And I wait for 3 sec

    #Click on Save Button
    And I switch to main content
    And element frame.main_frame should be present
    And I switch to frame frame.main_frame
    And I wait for 3 sec
    And I click on element premisepage.per_info_save

    # Logout C2M
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click element c2mlogout.english_system
    And I click element c2mlogout.logout
    #And I close browser


    Examples:
      | searchBy | accountId | premiseId|cisDivision  | readDate | reading |  readCondition |billDate | completeDate |
     # | Account ID | 1533665862 | California | 05-03-2022 | 590 | Regular | 05-03-2022 | 05-14-2022   |
   #C2MTEST   | Account ID | 9082701577 |   2730949075    |California | 05-03-2022 | 590 | Regular | 05-03-2022 | 05-14-2022   |
      | Account ID | 4184507179 |   5347543088    |California | 05-03-2022 | 590 | Regular | 05-03-2022 | 05-14-2022   |


