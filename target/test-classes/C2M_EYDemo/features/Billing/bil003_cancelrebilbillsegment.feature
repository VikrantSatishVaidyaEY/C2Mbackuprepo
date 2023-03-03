#####################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    		 Reason:
# 2022-04-10	AThott		 Initial Version.
# 2022-05-25    CTongo       Update Test Scripts
#####################################################################################

Feature: Cancel Rebilling Bill Segment


  @BIL003 @regression
  Scenario Outline: Cancel Rebilling Bill Segment


    #User is Logged In
    Given I navigate to C2M_HOME page
    When I enter credentials.user into input field c2m.username
    And I enter credentials.pass into input field c2m.password
    And I click on element c2m.sign_in

    #Switch to Control Central Search Page
    And I wait for 5 sec
    And I switch to frame frame.main_frame
    And I click on element main.main_menu
    And element main.control_central should be present
    And I click element main.control_central

    #Populate Required Control Central Search Page Values
    And I switch to frame frame.tabpage_frame
    And I select "<searchBy>" option by text from dropdown controlcentralsearch.search_by
    And element controlcentralsearch.account_id should be present
    And I enter "<accountId>" into input field controlcentralsearch.account_id
    And I select "<cisDivision>" option by text from dropdown controlcentralsearch.cis_division
    And I click element controlcentralsearch.search

    #Add Meter Read for Rebilling
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
    And I wait 10 seconds for element addmeterreaduipage.read_datetime to display
    And I clear input field addmeterreaduipage.read_datetime
    And I enter "<readDate>" into input field addmeterreaduipage.read_datetime
    And I enter "<meterRead>" into input field addmeterreaduipage.reading
    And I select "<readType>" option by text from dropdown addmeterreaduipage.measurement_condition
    And I click element addmeterreaduipage.save_btn

    #Rebill Bill Segment
    And I wait for 15 sec
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.dashboard
    And I switch to frame frame.dashboard_zonemapframe202
    And I wait 10 seconds for element dashboard.account_ctx_menu to display
    And I click element dashboard.account_ctx_menu
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click element context.acctctx_gotobill
    And I click element context.search
    And I wait for 5 sec
    And I switch to new window
    And I wait for 5 sec
    And I enter "<billId>" into input field billpage.bill_id
    And I click element billpage.bill_search_btn
    And I wait for 5 sec
    And I switch to previous window
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I switch to frame frame.bseg_frame
    And Search for the SA ID <saId> within the BSEG billpage.specific_bseg_link elements
    And I wait for 5 sec
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I click element billsegmentpage.rebill_btn
    And I wait for 5 sec
    And I switch to new window
    And I select "<reason>" option by text from dropdown billsegmentpage.rebill_reason
    And I click element billsegmentpage.calculate_btn
    And I wait for 5 sec
    And I switch to previous window

    #Validate old Bseg status
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And element billsegmentpage.bseg_status should have attribute "text" with value "<status>"
    And I wait for 10 sec

    # Logout C2M
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click element c2mlogout.english_system
    And I click element c2mlogout.logout
    And I close browser

    Examples:
      |searchBy|cisDivision|accountId|readDate|readType|meterRead|billId|reason|saId|status|
      |Account ID|Colorado Springs Utilities|0000132985|05-02-2017|Regular|2924|000001395963|Wrong read|0000139518|Canceled|