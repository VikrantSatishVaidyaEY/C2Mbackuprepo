#####################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    		Reason:
# 2022-05-13	SAhmad		Initial Version.
#
#####################################################################################

Feature: Add a Deposit/Tender Control

  @FIN003 @regression
  Scenario Outline: Verify User is able to Add a Deposit/Tender Control

    #Login C2M
    Given I navigate to C2M_HOME page
    When I enter credentials.user into input field c2m.username
    And I enter credentials.pass into input field c2m.password
    And I click on element c2m.sign_in

    #Add Deposit Control
    And I wait for 5 sec
    And I switch to frame frame.main_frame
    And I wait for 5 sec
    And I click on element main.main_menu
    And element main.financial should be present
    And I click on element main.financial
    And element submenu.deposit_control should be present
    And I click on element submenu.deposit_control
    And I click on element submenu.add
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click element actionbuttons.save

    #switch to Deposit control page
    And I wait for 3 sec
    Then I should see page title as "Deposit Control"
    And element frame.tabpage_frame should be present
    And I switch to frame frame.tabpage_frame
     And element depositcontrol.deposit_cntrl_cntxt should be present
    And I click element depositcontrol.deposit_cntrl_cntxt
    And I switch to main content
    And I switch to frame frame.main_frame
    And I hover over element context.goto_tndr_cntrl
    And I click element context.add_tndr_cntrl

   #switch to Tender control page
    And I wait for 3 sec
    Then I should see page title as "Tender Control"
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame

  #Populate Required Tender control Page Values
    And I enter "<TENDER SOURCE>" into input field tendercontrol.tndr_sourc_field
    And I press "TAB" key into input field tendercontrol.tndr_sourc_field
    And I clear input field tendercontrol.strting_bal_field
    And I enter "<STARTING BALANCE>" into input field tendercontrol.strting_bal_field
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click element actionbuttons.save

    #Logout C2M
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click element c2mlogout.english_system
    And I click element c2mlogout.logout
    And I close browser

    Examples:
      | TENDER SOURCE  | STARTING BALANCE |
      | COPE           | $0.00            |
