#####################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    		 Reason:
# 2022-04-10	AThott		 Initial Version.
# 2022-05-11    CTongo       Update Test Scripts
#####################################################################################

Feature: Verify user is able to Adding a Manual To Do


  @TDS001 @regression
  Scenario Outline: Verify user is able to Adding a Manual To Do


    #User is Logged In
    Given I navigate to C2M_HOME page
    When I enter credentials.user into input field c2m.username
    And I enter credentials.pass into input field c2m.password
    And I click on element c2m.sign_in

    #Add Manual To_DO
    And I wait for 5 sec
    And I switch to frame frame.main_frame
    And I wait 10 seconds for element main.main_menu to display
    And I click on element main.main_menu
    And I wait 10 seconds for element main.to_do to display
    And I click on element main.to_do
    And I wait 10 seconds for element submenu.to_do_entry to display
    And I click on element submenu.to_do_entry
    And I click element submenu.add

    #Switch to To Do Entry Page
    And element frame.ui_frame should be present
    And I switch to frame frame.ui_frame

    #Populate Required To Do Entry Page Values
    And I select "<To DO Type>" option by text from dropdown todoentrypage.to_do_type
    And I click element todoentrypage.to_do_type_ok
    And I enter "<Subject>" into input field todoentrypage.todo_subject
    And I enter "<Comment>" into input field todoentrypage.todo_comments
    And I select "<Override Priority>" option by text from dropdown todoentrypage.override_priority
    And I click element todoentrypage.characteristic_value

    #Switch to Characteristic Window
    And I wait for 5 sec
    And I switch to new window
    And I wait 10 seconds for element todoentrypage.search_by_list to display

    #Select the appropriate characteristic and enter the corresponding value
    And I select "<search_by_list>" option by text from dropdown todoentrypage.search_by_list
    And I enter "<Account_ID>" into input field todoentrypage.account_id
    And I click element todoentrypage.todo_entry_search

    #Switch to To Do Entry Page
    And I switch to previous window

    #Save To Do Entry Page
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.ui_frame
    And I click element todoentrypage.to_do_save_btn
    And I wait for 3 sec

    #Logout C2M
#    And I switch to main content
#    And I switch to frame frame.main_frame
#    And I click element c2mlogout.english_system
#    And I click element c2mlogout.logout
#    And I close browser

    Examples:
      | To DO Type	| Subject 	| Comment 	| Override Priority  	| search_by_list 	|Account_ID 	|
      |Billing     | NGTP Testing	|NGTP Test|Priority 10 -- Highest| Account ID| 0003936282|

     # |Billing     | NGTP Testing	|NGTP Test|Priority 10 -- Highest| Account ID| 0003936282|
