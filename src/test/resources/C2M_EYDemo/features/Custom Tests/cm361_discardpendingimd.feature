#####################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    		Reason:
# 2022-08-15	VVaidya		Initial Version.
#####################################################################################

Feature: Verify User can discard pending IMD

  @CM361 @regression
  Scenario Outline: Verify User can discard pending IMD

    #User is Logged In
    Given I navigate to C2M_HOME page
    When I enter credentials.user into input field c2m.username
    And I enter credentials.pass into input field c2m.password
    And I click on element c2m.sign_in

    #Click Add Initial Measurement Data Submenu
    And I wait for 5 sec
    And I switch to frame frame.main_frame
    And I wait for 3 sec
    And I click on element main.main_menu
    And element main.init_msrmt_data should be present
    And I click on element main.init_msrmt_data

    And I wait for 5 sec
    And I switch to frame frame.tabpage_frame

    And I select "IMD Identifier" option by text from dropdown initialmeasurement.imd_search_by

    And I enter "<IMD>" into input field initialmeasurement.imd_search_box
#66024412580154
    And element initialmeasurement.imd_search_btn should be present
    And I click on element initialmeasurement.imd_search_btn
    
    And I wait 5 seconds for element initialmeasurement.go_to_imd to display
    And I click on element initialmeasurement.go_to_imd
    And I wait for 4 sec
    
    And I switch to frame frame.tabpage_zonemapframe5
    
    And I wait 4 seconds for element initialmeasurement.delete to display
    And I forcefully click on element initialmeasurement.delete

    And I wait for 5 sec
    And I switch to new window
    And I wait for 4 sec
    And I click on element initialmeasurement.ok
    
    # Logout C2M
#    And I switch to main content
#    And I switch to frame frame.main_frame
#    And I click element c2mlogout.english_system
#    And I click element c2mlogout.logout
#    And I close browser

    Examples:
      |IMD	|
    #c2mtest  | 16563476993544 |
  |55148449801556|