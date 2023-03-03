#####################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    		Reason:
# 2022-04-07	CTongo		Initial Version.
#
#####################################################################################

Feature: Searching for a Payment

  @FIN007 @regression
  Scenario Outline: Searching for a Payment

    #Login C2M
    Given I navigate to C2M_HOME page
    When I enter credentials.user into input field c2m.username
    And I enter credentials.pass into input field c2m.password
    And I click on element c2m.sign_in

    #Search Payment
    And I wait for 5 sec
    And I switch to frame frame.main_frame
    And I click on element main.main_menu
    And I wait 10 seconds for element main.financial to display
    And I click on element main.financial
    And I wait 10 seconds for element submenu.payment to display
    And I click on element submenu.payment
    And I click on element submenu.search

    #Switch to App Pop Out Window
    And I wait for 5 sec
    And I switch to new window

    #Input Payment ID and click Search
    And I wait 10 seconds for element paymentpage.payment_id to display
    And I enter "<paymentEventId>" into input field paymentpage.payment_id
    And I click on element paymentpage.payment_id_search_btn
    And I wait for 10 sec

    #Switch to App Main Window
    And I switch to previous window

    #Payment page is displayed
    And I switch to main content
    And I switch to frame frame.main_frame

    #Logout C2M
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click element c2mlogout.english_system
    And I click element c2mlogout.logout
    And I close browser

    Examples:
      | paymentEventId |
     #C2MDEV | 000000053785   |
  |080903159281|
