#####################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    		Reason:
# 2022-04-08	CTongo		Initial Version.
#
#####################################################################################

Feature: Cancelling Autopay

  @FIN009 @regression
  Scenario Outline: Cancelling Autopay

    #Login C2M
    Given I navigate to C2M_HOME page
    When I enter credentials.user into input field c2m.username
    And I enter credentials.pass into input field c2m.password
    And I click on element c2m.sign_in

    #Search Account
    And I wait for 5 sec
    And I switch to frame frame.main_frame
    And I click on element main.main_menu
    And I wait 10 seconds for element main.customer_information to display
    And I click on element main.customer_information
    And I wait 10 seconds for element submenu.account to display
    And I click on element submenu.account
    And I click on element submenu.search

    #Switch to App Pop Out Window
    And I wait for 10 sec
    And I switch to new window

    #Input Account ID and click Search
    And I wait 10 seconds for element accountpage.account_id to display
    And I enter "<accountId>" into input field accountpage.account_id
    And I click on element accountpage.account_id_search_btn

    #Switch to App Main Window
    And I wait for 10 sec
    And I switch to previous window

    #Switch to Account Autopay Tab
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabmenu_frame
    And I click on element tabs.autopay

    #Populate Required Account Autopay End Date Values
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I clear input field accountpage.autopay_end_date
    And I enter "<endDate>" into input field accountpage.autopay_end_date

    #Click Save
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click element actionbuttons.save
    And I wait for 10 sec

    #Logout C2M
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click element c2mlogout.english_system
    And I click element c2mlogout.logout
    #And I close browser

    Examples:
      | accountId  | endDate    |
      | 1693112067 | 06-24-2022 |
