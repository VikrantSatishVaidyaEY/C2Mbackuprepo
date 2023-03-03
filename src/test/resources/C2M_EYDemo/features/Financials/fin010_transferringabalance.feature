#####################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    		Reason:
# 2022-04-08	CTongo		Initial Version.
#
#####################################################################################

Feature: Transferring A Balance

  @FIN010 @regression
  Scenario Outline: Transferring A Balance

    #Login C2M
    Given I navigate to C2M_HOME page
    When I enter credentials.user into input field c2m.username
    And I enter credentials.pass into input field c2m.password
    And I click on element c2m.sign_in

    #Add an Adjustment
    And I wait for 5 sec
    And I switch to frame frame.main_frame
    And I click on element main.main_menu
    And I wait 10 seconds for element main.financial to display
    And I click on element main.financial
    And I wait 10 seconds for element submenu.adjustment to display
    And I click on element submenu.adjustment
    And I click on element submenu.add

    #Populate Required Adjustment Main Tab Values
    And I wait for 10 sec
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I wait for 3 sec
    And I wait 10 seconds for element adjustmentpage.adjustment_service_agreement_id_main_search to display
    And I click on element adjustmentpage.adjustment_service_agreement_id_main_search
    And I wait for 3 sec
    And I switch to new window
    And I wait 10 seconds for element serviceagreementpage.account_id to display
    And I enter "<accountId>" into input field serviceagreementpage.account_id
    And I click element serviceagreementpage.account_id_search_btn
    And I switch to previous window
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I wait 10 seconds for element adjustmentpage.adjustment_type_search to display
    And I click on element adjustmentpage.adjustment_type_search
    And I wait for 3 sec
    And I switch to new window
    And I wait 10 seconds for element adjustmentpage.adjustment_type to display
    And I enter "<adjustmentType>" into input field adjustmentpage.adjustment_type
    And I click element adjustmentpage.adjustment_type_search_btn

      #Workaround - using XFERNP instead of XFER needs to comment out steps below
#    And I switch to frame frame.data_frame
#    And I click element adjustmentpage.search_result

    And I switch to previous window
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I clear input field adjustmentpage.amount
    And I enter "<amount>" into input field adjustmentpage.amount

    #Switch to Transfer Adjustment Tab
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabmenu_frame
    And I click on element tabs.transfer_adjustment
    And I wait for 10 sec

    #Populate Required Adjustment Transfer Adjustment Tab Values
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I click on element adjustmentpage.adjustment_service_agreement_id_transfer_search
    And I wait for 3 sec
    And I switch to new window
    And I wait 10 seconds for element serviceagreementpage.account_id to display
    And I enter "<transferSaAccountId>" into input field serviceagreementpage.account_id
    And I click on element serviceagreementpage.account_id_search_btn
    And I wait for 10 sec

    #Switch to App Main Window
    And I switch to previous window

    #Click on Generate Button
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I click on element adjustmentpage.generate_btn
    And I wait for 10 sec

    #Click on Calculate Button
    And I switch to new window
    And I wait 10 seconds for element adjustmentpage.calculate_btn to display
    And I click on element adjustmentpage.calculate_btn
    And I wait for 10 sec

    #Switch to App Main Window
    And I switch to previous window

    #Click on Freeze Button
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I click on element adjustmentpage.freeze_btn
    And I wait for 10 sec

    #Logout C2M
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click element c2mlogout.english_system
    And I click element c2mlogout.logout
    And I close browser

    Examples:
      | accountId | adjustmentType | amount | transferSaAccountId |
      | 0594218801 | XFERNP | 5.00 | 4565865231 |