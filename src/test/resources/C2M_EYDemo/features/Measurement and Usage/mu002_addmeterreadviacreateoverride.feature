#####################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    	   Reason:
# 2022-05-13	AThott	   Initial Version.
#
#####################################################################################

Feature: Verify User is able to Add a meter read via Create/Override Consumption page



  @MU002 @regression
  Scenario Outline: Verify User is able to Add a meter read via Create/Override Consumption page

    #User is Logged In
    Given I navigate to C2M_HOME page
    When I enter credentials.user into input field c2m.username
    And I enter credentials.pass into input field c2m.password
    And I click on element c2m.sign_in


     #Switch to search by device page
    And I wait for 5 sec
    And I switch to frame frame.main_frame
    And I click on element main.main_menu
    And element main.threesixty_search should be present
    And I click element main.threesixty_search
    And element submenu.search_by_device should be present
    And I click element submenu.search_by_device

  #Switch to 360 Search by Device
    And element frame.tabpage_frame should be present
    And I switch to frame frame.tabpage_frame

     #Populate Required Control Central Search Page Values
    And I select "<SEARCH BY>" option by text from dropdown 360searchbydevicepage.search_identifiertype
    And element 360searchbydevicepage.search_identifiervalue should be present
    And I enter "<Badge Number>" into input field 360searchbydevicepage.search_identifiervalue
    And I click element 360searchbydevicepage.search_device


    And I click element 360searchbydevicepage.interval_device_search
    And I switch to main content
    And I switch to frame frame.main_frame
    And element frame.tabmenu_frame should be present
    And I switch to frame frame.tabmenu_frame
    And I click element 360degreeviewpage.measuring_component_tab

    And I switch to main content
    And I switch to frame frame.main_frame
    And element frame.tabpage_frame should be present
    And I switch to frame frame.tabpage_frame
    And element frame.tabpage_zonemapframe3 should be present
    And I switch to frame frame.tabpage_zonemapframe3
    And I click element 360degreeviewpage.finalvalues_img
    And I click element 360degreeviewpage.create_override

    And I switch to main content
    And I switch to frame frame.main_frame
    And element frame.ui_frame should be present
    And I switch to frame frame.ui_frame

    #Switch to Create/Override Interval Consumption page
    #And I clear input field createintervalconsumption.create_override_startdate
    And I enter "<Start Date>" into input field createintervalconsumption.create_override_startdate
    #And I select "<Start Date>" option by value from dropdown createintervalconsumption.create_override_startdate
    #And I select "2022-03-21-23.00.00" option by text from dropdown createintervalconsumption.create_override_startdate
    And I clear input field createintervalconsumption.create_override_enddate
    And I enter "<End Date>" into input field createintervalconsumption.create_override_enddate
    And I uncheck the checkbox createintervalconsumption.uncheck_measurement
    And I enter "<Interval>" into input field createintervalconsumption.total_consumption
    And I select "<Measure Condition>" option by text from dropdown createintervalconsumption.consumption_condition
    And I select "<CONVERSION METHOD>" option by text from dropdown createintervalconsumption.conversion_method
    And I click element createintervalconsumption.meter_ok

    #Switch to initial measurement Page
    And I switch to main content
    And I switch to frame frame.main_frame
    And element frame.tabpage_frame should be present
    And I switch to frame frame.tabpage_frame
    And element frame.tabpage_zonemapframe5 should be present
    And I switch to frame frame.tabpage_zonemapframe5
    And I click element initialmeasurement.perform_vee

    #Logout C2M
    And I wait for 5 sec
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click element c2mlogout.english_system
    And I click element c2mlogout.logout
    #And I wait for 5 sec
    #And I close browser

    Examples:
      | SEARCH BY    | Badge Number | Measure Condition |Start Date|End Date  |Interval|CONVERSION METHOD|
      | Badge Number | 194226 | Regular           |04-01-2022|04-30-2022| 100   |Use Straight Line|