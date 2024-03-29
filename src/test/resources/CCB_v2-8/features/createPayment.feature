Feature: Create a new payment

  @CCBCreatePayment @regression @ccb
  Scenario Outline: Create a new payment

    #User is Logged In
    Given I navigate to CCB_HOME page
    And I wait for 3 sec
    When I enter credentials.user into input field c2m.username
    And I enter credentials.pass into input field c2m.password
    And I click element c2m.sign_in

      #Click on Control Central Search
    And I wait for 5 sec
    And I move to frame frame.main_frame
    And I wait 10 seconds for element main.main_menu to display
    And I click on element main.main_menu
    And I wait 10 seconds for element main.control_central to display
    And I click on element main.control_central

    #Search by Account ID and click Search

    And I move to frame frame.tabpage_frame
    And I wait 10 seconds for element controlcentralsearch.search_by to display
    And I select "<searchBy>" option by text from dropdown controlcentralsearch.search_by
    And I wait 10 seconds for element controlcentralsearch.account_id to display
    And I enter "<accountId>" into input field controlcentralsearch.account_id
   # And I select "<cisDivision>" option by text from dropdown controlcentralsearch.cis_division
    And I click element controlcentralsearch.search


     #Go to Account context Menu
    And I wait for 7 sec
    And I move to frame frame.dashboard
    And I click element controlcentral.account_context_menu
#
    #Go To Payment Arrangement Request
    And I move to frame frame.main_frame
    And I click on element main.acctctx_gotopaymntevt
    And I click element main.add

    #Switch to App Pop Out Window
    And I wait for 10 sec
    And I move to frame frame.ui_frame
    And I select "<tenderType>" option by text from dropdown paymenteventpage.tender_type
    And I click on element paymenteventpage.save_btn

    #Switch to App Main Window
    And I wait for 10 sec
    And I move to frame frame.dashboard
    And I validate element paymenteventpage.current_balance has value "0.00"
    And I click element paymenteventpage.last_payment
    And I wait for 5 sec
    And I move to frame frame.tabpage_frame
    And I validate element paymenteventpage.payment_date has value "12‑01‑2023"
    And I move to frame frame.paymentgrid_frame
    And I validate element paymenteventpage.payment_status has value "Frozen"
    And I move to frame frame.main_frame

    # Logout C2M
    And I click element c2mlogout.english_system
    And I click element c2mlogout.logout

    Examples:

      | searchBy   | accountId  | tenderType |
      | Account ID | 7210551523 |  Cash       |