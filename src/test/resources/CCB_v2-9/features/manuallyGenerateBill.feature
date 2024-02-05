#####################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    		Reason:
# 2022-05-12	Jlongakit	Initial Version.
# 2022-05-13    CTongo      Add scripts for adding meter read
#####################################################################################

Feature: Manually Generate a Bill

  @addBill @regression
  Scenario Outline: Verify User is able to manually generate a bill

#   Login C2M
    Given I navigate to CCB_HOME page
    When I enter credentials.user into input field c2m.username
    And I enter credentials.pass into input field c2m.password
    And I click on element c2m.sign_in

    #Click on Control Central Search
    And I wait for 5 sec
    And I move to frame frame.main_frame
    And I wait 10 seconds for element main.main_menu to display
    And I click on element main.main_menu
    And I wait 10 seconds for element main.control_central to display
    And I click on element main.control_central

    #Control Central Search Page
    And I wait 10 seconds for element frame.tabpage_frame to display
    And I move to frame frame.tabpage_frame
    And I select "<searchBy>" option by text from dropdown controlcentralsearch.search_by
    And I wait 10 seconds for element controlcentralsearch.account_id to display
    And I enter "<accountId>" into input field controlcentralsearch.account_id
#    And I select "<cisDivision>" option by text from dropdown controlcentralsearch.cis_division
    And I click element controlcentralsearch.search

    #Add Meter Read for Billing
    And I wait for 3 sec
    And I move to frame frame.dashboard_zonemapframe202
    And I click element dashboard.go_to_premise_link
    And I wait for 5 sec
    And I move to frame frame.prem_tree_frame
    And I wait 10 seconds for element premisepage.show_sp_context_menu to display
    And I click element premisepage.show_sp_context_menu
    And I move to frame frame.main_frame
    And I click element submenu.go_to_meter_read
    And I click element submenu.add
    And I wait for 5 sec

    And I move to frame frame.tabpage_frame
    And I wait 10 seconds for element addmeterreaduipage.read_date to display
    And I clear input field addmeterreaduipage.read_date
    And I enter "<readDate>" into input field addmeterreaduipage.read_date
    And I press "TAB" key into input field addmeterreaduipage.read_date
    And I move to frame frame.data_frame
    And I enter "<reading>" into input field addmeterreaduipage.reading
    And I select "<readCondition>" option by text from dropdown addmeterreaduipage.read_type
    And I move to frame frame.main_frame
    And I click element actionbuttons.save

    #Go To Bill Page
    And I wait for 3 sec
    And I move to frame frame.dashboard_zonemapframe201
    And I wait 10 seconds for element dashboard.account_cntx_menu to display
    And I click element dashboard.account_cntx_menu
    And I move to frame frame.main_frame
    And I click element context.acctctx_gotobill
    And I click element context.add

    #Generate Bill
    And I move to frame frame.tabpage_frame
    And I click element billpage.generate_bill_btn
    And I wait for 3 sec
    And I switch to new window
    And I clear input field billpage.cutoff_date
    And I enter "<billDate>" into input field billpage.cutoff_date
    And I click element billpage.generate_bill_btn

    #set the bill segment to frozen
    And I switch to previous window
    And I wait for 3 sec
    And I move to frame frame.tabpage_frame
    And I click element billpage.freeze_btn

     #complete the bill
    And I wait for 3 sec
    And I switch to new window
    And I wait 5 seconds for element billpage.complete_btn to be enabled
    And I click element billpage.complete_btn
    And I wait for 3 sec
    And I switch to previous window


    # Logout C2M
    And I move to frame frame.main_frame
    And I click element c2mlogout.english_system
    And I click element c2mlogout.logout
  #  And I close browser


    Examples:
      | searchBy | accountId | cisDivision  | readDate | reading |  readCondition |billDate | completeDate |
      | Account ID | 0689608083  | California | 10-01-2012 | 3600 | Regular | 10-01-2012 | 05-01-2011   |
#      |  Account ID | 1086991403 | California | 11-01-2010 | 28000 | Regular | 11-01-2010 |  09-01-2012 |