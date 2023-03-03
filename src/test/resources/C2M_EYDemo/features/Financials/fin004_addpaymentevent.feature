#####################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    		Reason:
# 2022-04-06	CTongo		Initial Version.
#
#####################################################################################

Feature: Adding Payment Event for an Account

  @FIN004 @regression
  Scenario Outline: Adding a Payment Event for an Account

    #Login C2M
    Given I navigate to C2M_HOME page
    When I enter credentials.user into input field c2m.username
    And I enter credentials.pass into input field c2m.password
    And I click on element c2m.sign_in

    #Add Payment Event
    And I wait for 5 sec
    And I switch to frame frame.main_frame
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
    And I enter "<accountId>" into input field paymenteventpage.payor_acct_id
    And I clear input field paymenteventpage.payment_amount
    And I enter "<amount>" into input field paymenteventpage.payment_amount
    And I switch to frame frame.tendersgrid_frame
    And I clear input field paymenteventpage.amount_tendered
    And I enter "<amount>" into input field paymenteventpage.amount_tendered
    And I select "<tenderType>" option by text from dropdown paymenteventpage.tender_type
    And I switch to main content
    And I clear input field paymenteventpage.payment_date
    And I enter "<paymentDate>" into input field paymenteventpage.payment_date
    And I select "<distributionCode>" option by text from dropdown paymenteventpage.distribution_action
    And I click on element paymenteventpage.add_payment_event_ok_btn

    #Switch to App Main Window
    And I wait for 10 sec
    And I switch to previous window

    #Logout C2M
    And I wait for 10 sec
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click element c2mlogout.english_system
    And I click element c2mlogout.logout
    #And I close browser

    Examples:
      | accountId	| paymentDate	| distributionCode 	| amount	| tenderType	|
    #  | 7981570062	| 06-24-2022	| Distribute and Freeze if OK	| $10	| Cash	|
      | 0000925416	| 06-24-2022	| Distribute and Freeze if OK	| $10	| 2 Cash	|
