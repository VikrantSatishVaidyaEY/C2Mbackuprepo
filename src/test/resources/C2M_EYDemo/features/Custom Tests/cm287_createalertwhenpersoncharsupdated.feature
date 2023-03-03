#####################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    		Reason:
# 2022-08-09	vvaidya	  Initial Version.

#####################################################################################

Feature: Validate Alert is created when Person Characteristics Updated

  @CM287 @regression
  Scenario Outline: Validate Alert is created when Person Characteristics Updated

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
    #And I wait for 7 sec

    #Go to Person Context Menu>> Go to Person
#    And I switch to frame frame.tabpage_zonemapframe1
#    And I wait for 7 sec
#    And I click on element controlcentral.person_context_menu
#    And I switch to main content
#    And element frame.main_frame should be present
#    And I switch to frame frame.main_frame
#    And element context.perctx_gotoperson should be present
#    And I forcefully click on element context.perctx_gotoperson
#    #And I switch to main content
#  And I wait for 65 sec
#    # Go to Person>> Characteristics tab
#    And I switch to main content
#    And element frame.tabmenu_frame should be present
#    And I switch to frame frame.tabmenu_frame
#    And I wait for 3 sec
#    And I click on element personpage.characteristics_tab

    # Enter Person's Characteristic Type and Characteristic Value
    And I wait for 5 sec
    And I switch to main content
    And element frame.main_frame should be present
    And I switch to frame frame.main_frame
    And I wait for 3 sec
    And element frame.tabpage_frame should be present
    And I switch to frame frame.tabpage_frame
    And I wait for 3 sec
    And I switch to frame frame.chargrid_frame
    And I wait for 3 sec
    And I select "Strategic Person" option by text from dropdown personpage.characteristics_type
    And I clear input field personpage.characteristics_val
    And I enter "Y" into input field personpage.characteristics_val
    And I press "TAB" key into input field personpage.characteristics_val
    And I wait for 3 sec

    #Click on Save Button
    And I switch to main content
    And element frame.main_frame should be present
    And I switch to frame frame.main_frame
    And I wait for 3 sec
    And I click on element personpage.per_info_save

    # Logout C2M
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click element c2mlogout.english_system
    And I click element c2mlogout.logout
    #And I close browser


    Examples:
      | searchBy | accountId | cisDivision  | readDate | reading |  readCondition |billDate | completeDate |
     # | Account ID | 1701122427 | California | 05-03-2022 | 590 | Regular | 05-03-2022 | 05-14-2022   |
      #C2MTEST| Account ID | 8917455325 | California | 05-03-2022 | 590 | Regular | 05-03-2022 | 05-14-2022   |
      | Account ID | 6547661104 | California | 05-03-2022 | 590 | Regular | 05-03-2022 | 05-14-2022   |
