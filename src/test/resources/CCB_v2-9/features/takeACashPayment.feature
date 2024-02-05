Feature: Create a new payment

  @CreatePayment @regression @ccb
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
#    And I move to frame frame.dashboard
#    And I click element controlcentral.account_context_menu
#
    #Go To Payment Arrangement Request
    And I move to frame frame.dashboard_zonemapframe201
    And I click on element paymenteventpage.take_a_payment_link


    #Switch to App Pop Out Window
    And I wait for 10 sec
    And I move to frame frame.ui_frame
    And I select "<tenderType>" option by text from dropdown paymenteventpage.tender_type
    And I click on element paymenteventpage.save_btn

    #Switch to App Main Window
    And I wait for 10 sec
    And I move to frame frame.dashboard
    And I click element paymenteventpage.current_balance
    And I wait for 5 sec
    And I move to frame frame.main_frame
    And I click element actionbuttons.refresh
    And I wait 15 seconds for element frame.dashboard to display
    And I move to frame frame.dashboard
    And I wait 10 seconds for element paymenteventpage.current_balance to display
    And I validate element paymenteventpage.current_balance has value "0.00"
    And I click element paymenteventpage.last_payment
    And I wait for 10 sec
    And I move to frame frame.tabpage_frame
    And I validate element paymenteventpage.payment_date has value "<date>"
    And I move to frame frame.paymentgrid_frame
    And I validate element paymenteventpage.payment_status has value "Frozen"
    And I move to frame frame.main_frame

    # Logout C2M
    And I click element c2mlogout.english_system
    And I click element c2mlogout.logout

    Examples:

      | searchBy   | accountId  | tenderType | date |
      | Account ID | 0689608083 |  Cash      | 01‑31‑2024 |
#      | Account ID | 1086991403 |  Cash      | 01‑31‑2024 |
