#####################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    		Reason:
# 2022-04-06	CTongo		Initial Version.
#
#####################################################################################

Feature: Adding A Payment To Multiple Accounts

  @FIN005 @regression
  Scenario Outline: Adding a Payment to Multiple Accounts

    #Login C2M
    Given I navigate to C2M_HOME page
    When I enter credentials.user into input field c2m.username
    And I enter credentials.pass into input field c2m.password
    And I click on element c2m.sign_in

    #Add Payment Event
    And I wait for 5 sec
    And I switch to frame frame.main_frame
    And I wait 10 seconds for element main.main_menu to display
    And I click on element main.main_menu
    And I wait 10 seconds for element main.financial to display
    And I click on element main.financial
    And I wait 10 seconds for element submenu.payment_event to display
    And I click on element submenu.payment_event
    And I click on element submenu.add

    #Switch to App Pop Out Window
    And I wait for 10 sec
    And I switch to new window

    #Populate Required Payment Event Pop Out Window Values then click OK
    And I wait 10 seconds for element paymenteventpage.payor_acct_id to display
    And I enter "<accountId1>" into input field paymenteventpage.payor_acct_id
    And I clear input field paymenteventpage.payment_amount
    And I enter "<amount1>" into input field paymenteventpage.payment_amount
    And I switch to frame frame.tendersgrid_frame
    And I clear input field paymenteventpage.amount_tendered
    And I enter "<amount1>" into input field paymenteventpage.amount_tendered
    And I select "<tenderType>" option by text from dropdown paymenteventpage.tender_type
    And I switch to main content
    And I clear input field paymenteventpage.payment_date
    And I enter "<paymentDate>" into input field paymenteventpage.payment_date
    And I select "<distributionCode>" option by text from dropdown paymenteventpage.distribution_action
    And I click on element paymenteventpage.add_payment_event_ok_btn

    #Switch to App Main Window
    And I switch to previous window

    #Add Other Account for the Payment
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I switch to frame frame.paymentgrid_frame
    And I wait for 3 sec
    And I click element paymenteventpage.add_payment_btn
    And I enter "<accountId2>" into input field paymenteventpage.add_payment_account_id
    And I enter "<amount2>" into input field paymenteventpage.add_payment_paymentamount

    #Switch to Payment Event Tenders Tab
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabmenu_frame
    And I click on element tabs.tenders

    #Populate Required Payment Event Tenders Tab Values
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I click on element paymenteventpage.add_tender
    And I enter "<accountId2>" into input field paymenteventpage.add_tender_account
    And I wait for 3 sec
    And I click on element paymenteventpage.amount_tendered_tab
    And I clear input field paymenteventpage.amount_tendered_tab
    And I enter "<amount2>" into input field paymenteventpage.amount_tendered_tab
    And I select "<tenderType>" option by text from dropdown paymenteventpage.tender_type_tab

    #Switch to Payment Event Main Tab
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabmenu_frame
    And I click on element tabs.main

    #Click on the Distibute and Freeze Button
    And I wait for 10 sec
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I click on element paymenteventpage.distribute_btn
    And I wait 10 seconds for element paymenteventpage.freeze_btn to display
    And I click on element paymenteventpage.freeze_btn
    And I wait for 10 sec

    #Logout C2M
#    And I wait for 10 sec
#    And I switch to main content
#    And I switch to frame frame.main_frame
#    And I click element c2mlogout.english_system
#    And I click element c2mlogout.logout
   # And I close browser

    Examples:
      | accountId1	| accountId2 	| paymentDate 	| distributionCode  	| amount1 	| amount2 	| tenderType 	|
      | 4758074824	| 0018361582	| 06-19-2022  | Do not Distribute	| $20	| $10	| Cash	|
