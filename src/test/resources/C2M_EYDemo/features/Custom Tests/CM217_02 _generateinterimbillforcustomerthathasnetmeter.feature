#####################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    		Reason:
# 2022-08-22	SAhmad	Initial Version.
#####################################################################################

Feature: Generate Interim Bill for Customer that has Net-meter

  @CM217_2 @regression
  Scenario Outline: Verify User is able to Generate Interim Bill that has Net-meter

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

    #Add Meter Read for Scalar Meter - Reading for Recieved and Delivered
    And I wait for 3 sec
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.dashboard
    And element frame.dashboard_zonemapframe202 should be present
    And I switch to frame frame.dashboard_zonemapframe202
    And element dashboard.measuringcomponent_ctx_menu should be present
    And I click element dashboard.measuringcomponent_ctx_menu
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click element context.mcctx_gotothreesixtyview
    And I switch to frame frame.tabpage_frame
    And I wait for 3 sec
    And I click element 360degreeviewpage.new_reading
    And I wait for 3 sec
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.ui_frame
    And element addmeterreaduipage.read_datetime should be present
    And I clear input field addmeterreaduipage.read_datetime
    And I enter "<READ DATE>" into input field addmeterreaduipage.read_datetime
    And I enter "<RECEIVED READING>" into input field addmeterreaduipage.received_reading
    And I select "<RECEIVED READ CONDITION>" option by text from dropdown addmeterreaduipage.received_msrmnt_condition
    And I enter "<DELIVERED READING>" into input field addmeterreaduipage.delivered_reading
    And I select "<DELIVERED READ CONDITION>" option by text from dropdown addmeterreaduipage.delivered_msrmnt_condition
#    And I click element addmeterreaduipage.save_btn
    And I click element addmeterreaduipage.cancel_btn

    #switch to 360 view page - Adding Interval Meter Read for KWH Recieved
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I wait for 3 sec
    And I click element 360degreeviewpage.interval_channel_recieved
    And I wait for 3 sec
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click element 360degreeviewpage.goto_360_view

    And I wait for 5 sec
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

    #Switch to Create/Override Interval Consumption page
    And I enter "<START DATE R>" into input field createintervalconsumption.create_override_startdate
    And I clear input field createintervalconsumption.create_override_enddate
    And I enter "<END DATE R>" into input field createintervalconsumption.create_override_enddate
    And I uncheck the checkbox createintervalconsumption.uncheck_measurement
    And I enter "<INTERVAL R>" into input field createintervalconsumption.total_consumption
    And I select "<MEASURE CONDITION R>" option by text from dropdown createintervalconsumption.consumption_condition
    And I select "<CONVERSION METHOD R>" option by text from dropdown createintervalconsumption.conversion_method
    And I click element createintervalconsumption.meter_ok

    #Switch to initial measurement Page
    And I switch to main content
    And I switch to frame frame.main_frame
    And element frame.tabpage_frame should be present
    And I switch to frame frame.tabpage_frame
    And element frame.tabpage_zonemapframe5 should be present
    And I switch to frame frame.tabpage_zonemapframe5
#    And I click element initialmeasurement.perform_vee

    #Go To 360 view page
    And I wait for 3 sec
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.dashboard
    And element frame.dashboard_zonemapframe202 should be present
    And I switch to frame frame.dashboard_zonemapframe202
    And element dashboard.measuringcomponent_ctx_menu should be present
    And I click element dashboard.measuringcomponent_ctx_menu
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click element context.mcctx_gotothreesixtyview

    #switch to 360 view page - Adding Interval Meter Read for KWH Delivered
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I wait for 3 sec
    And I click element 360degreeviewpage.interval_channel_delivered
    And I wait for 3 sec
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click element 360degreeviewpage.goto_360_view

    And I wait for 5 sec
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

    #Switch to Create/Override Interval Consumption page
    And I enter "<START DATE D>" into input field createintervalconsumption.create_override_startdate
    And I clear input field createintervalconsumption.create_override_enddate
    And I enter "<END DATE D>" into input field createintervalconsumption.create_override_enddate
    And I uncheck the checkbox createintervalconsumption.uncheck_measurement
    And I enter "<INTERVAL D>" into input field createintervalconsumption.total_consumption
    And I select "<MEASURE CONDITION D>" option by text from dropdown createintervalconsumption.consumption_condition
    And I select "<CONVERSION METHOD D>" option by text from dropdown createintervalconsumption.conversion_method
    And I click element createintervalconsumption.meter_ok

    #Switch to initial measurement Page
    And I switch to main content
    And I switch to frame frame.main_frame
    And element frame.tabpage_frame should be present
    And I switch to frame frame.tabpage_frame
    And element frame.tabpage_zonemapframe5 should be present
    And I switch to frame frame.tabpage_zonemapframe5
    And I click element initialmeasurement.perform_vee

    #Go To Bill Page
    And I wait for 3 sec
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.dashboard
    And I switch to frame frame.dashboard_zonemapframe202
    And element dashboard.account_ctx_menu should be present
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
    And I enter "<BILL DATE>" into input field billpage.cutoff_date
    And I click element billpage.generate_bill_btn

    #set the bill segment to frozen
    And I switch to previous window
    And I wait for 3 sec
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I click element billpage.freeze_btn

#     #complete the bill
#    And element billpage.complete_btn should be present
#    And I click element billpage.complete_btn
#    And I wait for 3 sec
#    And I switch to new window
#    And element billpage.complete_date should be present
#    And I enter "<COMPLETE DATE>" into input field billpage.complete_date
#    And I click element billpage.complete_btn
#    And I switch to previous window

    #Go To Service Agreement
    And I wait for 3 sec
    Then I should see page title as "Control Central"
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.dashboard
    And I switch to frame frame.dashboard_zonemapframe202
    And element dashboard.account_ctx_menu should be present
    And I click element dashboard.account_ctx_menu
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click element context.acctctx_gotosa
    And I click element context.search

  #Switch to Service Agreement Search Window
    And I switch to main content
    And I wait for 10 sec
    And I switch to new window
    And I enter "<SA ID>" into input field serviceagreementpage.sa_id
    And I click element serviceagreementpage.sa_search_button
    And I switch to previous window


     #Switch to Service Agreement Page
    And I wait for 3 sec
    Then I should see page title as "Service Agreement"
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabmenu_frame
    And I click on element tabs.chars_qty_rec_tab
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I switch to frame frame.sa_chargrid_frame
    Then option "<CHARACTERISTIC TYPE>" by Text from dropdown serviceagreementpage.sa_characteristic_typ should be selected
    Then element serviceagreementpage.sa_characteristic_value should have text as "Y"

#    # Logout C2M
##    And I switch to main content
##    And I switch to frame frame.main_frame
##    And I click element c2mlogout.english_system
##    And I click element c2mlogout.logout
##    And I close browser
#

    Examples:
      | SEARCH BY | ACCOUNT ID | CIS DIVISION | READ DATE | RECEIVED READING | RECEIVED READ CONDITION | DELIVERED READING | DELIVERED READ CONDITION | START DATE R | END DATE R  |INTERVAL R|MEASURE CONDITION R | CONVERSION METHOD R| START DATE D | END DATE D  |INTERVAL D |MEASURE CONDITION D | CONVERSION METHOD D | BILL DATE | COMPLETE DATE | SA ID | CHARACTERISTIC TYPE |
      | Account ID| 3126192314 | Colorado Springs Utilities | 05-03-2022 | 30 | Regular | 67605 | Regular | 07-01-2022 | 07-30-2022 | 100 |Regular |Use Straight Line| 07-01-2022 | 07-30-2022 | 100 |Regular |Use Straight Line| 05-03-2022 | 05-14-2022 | 7250905390 | Indefinite True Up |