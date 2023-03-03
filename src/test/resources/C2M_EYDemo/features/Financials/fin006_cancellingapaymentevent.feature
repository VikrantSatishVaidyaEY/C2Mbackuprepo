#####################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    		Reason:
# 2022-04-07	CTongo		Initial Version.
#
#####################################################################################

Feature: Cancelling A Payment Event

  @FIN006 @regression
  Scenario Outline: Cancelling A Payment Event

    #Login C2M
    Given I navigate to C2M_HOME page
    When I enter credentials.user into input field c2m.username
    And I enter credentials.pass into input field c2m.password
    And I click on element c2m.sign_in

    #Search Payment Event
    And I wait for 5 sec
    And I switch to frame frame.main_frame
    And I click on element main.main_menu
    And I wait 10 seconds for element main.financial to display
    And I click on element main.financial
    And I wait 10 seconds for element submenu.payment_event to display
    And I click on element submenu.payment_event
    And I click on element submenu.search

    #Switch to App Pop Out Window
    And I wait for 10 sec
    And I switch to new window

    #Input Payment Event ID and click Search
    And I wait 10 seconds for element paymenteventpage.payment_event_id to display
    And I enter "<paymentEventId>" into input field paymenteventpage.payment_event_id
    And I click on element paymenteventpage.payment_event_id_search_btn
    And I wait for 10 sec

    #Switch to App Main Window
    And I switch to previous window

    #Switch to Payment Event Tenders Tab
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabmenu_frame
    And I click on element tabs.tenders

    #Click Cancel
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I click on element paymenteventpage.payor_accntid
    And I wait for 5 sec
    And I switch to new window
    And I enter "<accountId>" into input field paymenteventpage.accntid
    And I click on element paymenteventpage.search
    And I switch to previous window
    And I wait for 5 sec
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I click on element paymenteventpage.cancel_btn

    #Switch to App Pop Out Window
    And I switch to new window
    And I wait for 10 sec
    And I select "<cancelReason>" option by text from dropdown paymenteventpage.payment_event_cancel_reason
    And I click on element paymenteventpage.cancel_payment_event_ok_btn
    And I wait for 10 sec

    #Switch to App Main Window
    And I switch to previous window

    #Logout C2M
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click element c2mlogout.english_system
    And I click element c2mlogout.logout
    #And I close browser

    Examples:
      | paymentEventId | cancelReason         |accountId|
     #C2MDEV | 000000617528   | Non Sufficient Funds |6629001533|
      | 002383507589   | Office Error |0023835293|
