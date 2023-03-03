#####################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    		Reason:
# 2022-08-01	vvaidya		Initial Version.
#####################################################################################

Feature: Validate Backflow Customer Contact Creation for Premise with Single Service point

  @CM353 @regression
  Scenario Outline: Validate Backflow Customer Contact Creation for Premise with Single Service point

    #User is Logged In
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

    #Go to Control Central Page
    And element frame.tabpage_zonemapframe1 should be present
    And I switch to frame frame.tabpage_zonemapframe1
    And I click element controlcentral.moving_service
    And element controlcentral.start_service should be present
    And I click element controlcentral.start_service
    And I wait for 20 sec

    #Go to Process Flow Page
    And I switch to main content
    And I switch to frame frame.main_frame
    And I wait 10 seconds for element frame.tabpage_frame to display
    And I switch to frame frame.tabpage_frame
    And I should see page title as "Process Flow"
    And element frame.tabpage_zonemapframe1 should be present
    And I switch to frame frame.tabpage_zonemapframe1
    #And I enter "<Address>" into input field processpage.address
    And I scroll to element processpage.premise_id
    And element processpage.premise_id should be present
    And I enter "<premiseID>" into input field processpage.premise_id
    And element processpage.premiseid_search should be present
    And I click element processpage.premiseid_search
    And element processpage.enable_address should be present
    And I select radio button processpage.enable_address
    And element processpage.next should be present
    And I click element processpage.next
    And element processpage.continue should be present
    And I click element processpage.continue
    And element processpage.check_deposit_requirement should be present
    And I click element processpage.check_deposit_requirement
    And element processpage.next should be present
    And I click element processpage.next
    And element processpage.start_date should be present
    And I wait for 5 sec
    When I put date number into input field processpage.servicestartdate
   #working And I enter text "08-17-2022" into input field processpage.servicestartdate using javascript
    And I enter "Test Requester" into input field processpage.requestedby

    #Process Flow Step 3
    And element processpage.next should be present
    And I click element processpage.next
    #Process Flow Step 4
    And element processpage.next should be present
    And I click element processpage.next
    #Process Flow Step 5
    And element processpage.finish should be present
    And I click element processpage.finish
    And I wait for 10 sec

    Examples:
      | searchBy  | accountId | cisDivision | premiseID |startDate | startMethod    | address                | city     | rate |
      #C2MDEV| Account ID | 9678761525 | Colorado Springs Utilities  | 6597092224| 02-10-2022 | Start a Premise | 3044 S ACADEMY BLVD | COLO SPGS | E-CM |
      | Account ID | 0183081946 | Colorado Springs Utilities  | 6142794427| 02-10-2022 | Start a Premise | 3044 S ACADEMY BLVD | COLO SPGS | E-CM |