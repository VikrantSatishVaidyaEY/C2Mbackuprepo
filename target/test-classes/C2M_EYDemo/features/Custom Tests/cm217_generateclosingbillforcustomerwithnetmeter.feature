#####################################################################################
# CHANGE HISTORY:
#
# Date:       	 by:    		Reason:
# 2022-08-11	AThott	    Initial Version.

#####################################################################################

Feature: Closing bill for customer with meter

  @CM217 @regression
  Scenario Outline: Verify User is able to generate a closing bill for customer that has net meter

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
    And I select "<cisDivision>" option by text from dropdown controlcentralsearch.cis_division
    And I click element controlcentralsearch.search

    #Add Meter Read for delivered scalar
    And I wait for 3 sec
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.dashboard
    And I switch to frame frame.dashboard_zonemapframe202
    And I wait 10 seconds for element dashboard.measuringcomponent_ctx_menu to display
    And I click element dashboard.measuringcomponent_ctx_menu
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click element context.mcctx_gotothreesixtyview
    And I wait for 3 sec
    And I switch to frame frame.tabpage_frame
    And I click element 360degreeviewpage.new_reading
    And I wait for 3 sec
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.ui_frame
    And element addmeterreaduipage.read_datetime should be present
    And I clear input field addmeterreaduipage.read_datetime
    And I enter "<readDate>" into input field addmeterreaduipage.read_datetime
    And I enter "<reading>" into input field addmeterreaduipage.reading
    And I select "<readCondition>" option by text from dropdown addmeterreaduipage.measurement_condition
    And I enter "<reading1>" into input field addmeterreaduipage.reading1
    And I select "<readCondition>" option by text from dropdown addmeterreaduipage.measurement_condition1
    And I click element addmeterreaduipage.save_btn
    And I wait for 30 sec
#
#
##
##    #reading for delivered interval meter
##
    And I switch to main content
    And I switch to frame frame.main_frame
    And element frame.tabpage_frame should be present
    And I switch to frame frame.tabpage_frame
#
    And I click element 360degreeviewpage.interval_meter
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click element context.mcctx_gotothreesixtyview
#    And element frame.tabpage_frame should be present
#    And I switch to frame frame.tabpage_frame
#    And element frame.tabpage_zonemapframe3 should be present
#    And I switch to frame frame.tabpage_zonemapframe3
    And I switch to main content
    And I switch to frame frame.main_frame
    And element frame.tabpage_frame should be present
    And I switch to frame frame.tabpage_frame
    And element frame.tabpage_zonemapframe3 should be present
    And I switch to frame frame.tabpage_zonemapframe3
    And element 360degreeviewpage.finalvalues_img should be present
    And I wait for 10 sec
    And I click element 360degreeviewpage.finalvalues_img
    And I click element 360degreeviewpage.create_override
#
#    And I switch to main content
    And I switch to frame frame.main_frame
    And element frame.ui_frame should be present
    And I switch to frame frame.ui_frame
#
    And I enter "<Start Date>" into input field createintervalconsumption.create_override_startdate
    And I clear input field createintervalconsumption.create_override_enddate
    And I enter "<End Date>" into input field createintervalconsumption.create_override_enddate
    And I uncheck the checkbox createintervalconsumption.uncheck_measurement
    And I enter "<Interval>" into input field createintervalconsumption.total_consumption
    And I select "<Measure Condition>" option by text from dropdown createintervalconsumption.consumption_condition
    And I select "<CONVERSION METHOD>" option by text from dropdown createintervalconsumption.conversion_method
    And I click element createintervalconsumption.meter_ok
#
    And I switch to main content
    And I switch to frame frame.main_frame
    And element frame.tabpage_frame should be present
    And I switch to frame frame.tabpage_frame
    And element frame.tabpage_zonemapframe5 should be present
    And I switch to frame frame.tabpage_zonemapframe5
    And I click element initialmeasurement.perform_vee
#
    And element 360degreeviewpage.interval_meter should be present
    And I click element 360degreeviewpage.interval_meter
    And I switch to main content
    And I switch to frame frame.main_frame
    And element context.mcctx_gotomeasrcomp should be present
    And I click element context.mcctx_gotomeasrcomp

#
    And element frame.tabpage_frame should be present
    And I switch to frame frame.tabpage_frame
    And I click element 360degreeviewpage.interval_meter_received
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click element context.mcctx_gotothreesixtyview
#    And element frame.tabpage_frame should be present
#    And I switch to frame frame.tabpage_frame
#    And element frame.tabpage_zonemapframe3 should be present
#    And I switch to frame frame.tabpage_zonemapframe3
    And I switch to main content
    And I switch to frame frame.main_frame
    And element frame.tabpage_frame should be present
    And I switch to frame frame.tabpage_frame
    And element frame.tabpage_zonemapframe3 should be present
    And I switch to frame frame.tabpage_zonemapframe3
    And element 360degreeviewpage.finalvalues_img should be present
    And I wait for 10 sec
    And I click element 360degreeviewpage.finalvalues_img
    And I click element 360degreeviewpage.create_override

    And I switch to main content
    And I switch to frame frame.main_frame
    And element frame.ui_frame should be present
    And I switch to frame frame.ui_frame
#
    And I enter "<Start Date>" into input field createintervalconsumption.create_override_startdate
    And I clear input field createintervalconsumption.create_override_enddate
    And I enter "<End Date>" into input field createintervalconsumption.create_override_enddate
    And I uncheck the checkbox createintervalconsumption.uncheck_measurement
    And I enter "<Interval>" into input field createintervalconsumption.total_consumption
    And I select "<Measure Condition>" option by text from dropdown createintervalconsumption.consumption_condition
    And I select "<CONVERSION METHOD>" option by text from dropdown createintervalconsumption.conversion_method
    And I click element createintervalconsumption.meter_ok
#
    And I switch to main content
    And I switch to frame frame.main_frame
    And element frame.tabpage_frame should be present
    And I switch to frame frame.tabpage_frame
    And element frame.tabpage_zonemapframe5 should be present
    And I switch to frame frame.tabpage_zonemapframe5
    And I click element initialmeasurement.perform_vee
#

#    #Go To Bill Page
    And I wait for 3 sec
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.dashboard
    And I switch to frame frame.dashboard_zonemapframe202
    And I wait 10 seconds for element dashboard.account_ctx_menu to display
    And I click element dashboard.account_ctx_menu
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click element context.acctctx_gotobill
    And I click element context.add

    #Generate Bill
    And I switch to frame frame.tabpage_frame
    And I click element billpage.generate_bill_btn
    And I wait for 3 sec
    And I switch to new window
    And I enter "<billDate>" into input field billpage.cutoff_date
    And I click element billpage.generate_bill_btn

    #set the bill segment to frozen
    And I switch to previous window
    And I wait for 3 sec
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I click element billpage.freeze_btn

     #complete the bill
    And I wait 10 seconds for element billpage.complete_btn to display
    And I click element billpage.complete_btn
    And I wait for 3 sec
    And I switch to new window
    And I wait 10 seconds for element billpage.complete_date to display
    And I enter "<completeDate>" into input field billpage.complete_date
    And I click element billpage.complete_btn
    And I switch to previous window
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.dashboard
    And I switch to frame frame.dashboard_zonemapframe204
    And I wait 10 seconds for element dashboard.account_ctx_menu to display
    And I click element dashboard.account_ctx_menu
    And I switch to main content
    And I switch to frame frame.main_frame
    And I wait 10 seconds for element context.acctctx_gotosa to display
    And I click element context.acctctx_gotosa
    And I click element context.search
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabmenu_frame
    And I click element context.chars_qty_tab
    And I switch to main content

    # Logout C2M
#    And I switch to main content
#    And I switch to frame frame.main_frame
#    And I click element c2mlogout.english_system
#    And I click element c2mlogout.logout
#    And I close browser


    Examples:
      | searchBy   | accountId1 | accountId |cisDivision                | readDate |reading1 | reading | readCondition |billDate | completeDate |Start Date|End Date  |Interval|CONVERSION METHOD|Measure Condition|
      | Account ID | 5889757850 | 9038984982|Colorado Springs Utilities |08-16-2022| 54000   | 60       |Regular | 01-01-2022 | 01-30-2022   |07-01-2022|07-30-2022    | 600   |Use Straight Line| Regular         |
