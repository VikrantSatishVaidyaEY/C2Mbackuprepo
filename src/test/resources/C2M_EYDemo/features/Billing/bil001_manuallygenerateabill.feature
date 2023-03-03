#####################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    		Reason:
# 2022-05-12	Jlongakit	Initial Version.
# 2022-05-13    CTongo      Add scripts for adding meter read
#####################################################################################

Feature: Manually Generate a Bill

  @BIL001 @regression
  Scenario Outline: Verify User is able to manually generate a bill

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

    #Add Meter Read for Billing
    And I wait for 3 sec
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.dashboard
    And I switch to frame frame.dashboard_zonemapframe204
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
    And I enter "<reading>" into input field addmeterreaduipage.reading
    And I select "<readCondition>" option by text from dropdown addmeterreaduipage.measurement_condition
    And I click element addmeterreaduipage.save_btn

    #Go To Bill Page
    And I wait for 3 sec
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.dashboard
    And I switch to frame frame.dashboard_zonemapframe204
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

    # Logout C2M
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click element c2mlogout.english_system
    And I click element c2mlogout.logout
  #  And I close browser


    Examples:
      | searchBy | accountId | cisDivision  | readDate | reading |  readCondition |billDate | completeDate |
      | Account ID | 6343565982 | California | 05-03-2022 | 590 | Regular | 05-03-2022 | 05-14-2022   |
