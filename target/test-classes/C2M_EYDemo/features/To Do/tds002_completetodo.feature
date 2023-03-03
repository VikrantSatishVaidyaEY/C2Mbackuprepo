#####################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    		Reason:
# 2022-04-18	AThott		Initial Version.
#
#####################################################################################

Feature: Verify user is able to complete a To Do


 @TDS002 @regression
  Scenario Outline: Verify user is able to complete a To Do

    #User is Logged In
    Given I navigate to C2M_HOME page
    When I enter credentials.user into input field c2m.username
    And I enter credentials.pass into input field c2m.password
    And I click on element c2m.sign_in


    #Search for To_DO
   And I wait for 5 sec
    And I switch to frame frame.main_frame
    And I click on element main.main_menu
    And element main.to_do should be present
    And I hover over element main.to_do
    And element submenu.to_do_entry should be present
    And I hover over element submenu.to_do_entry
    And I click element submenu.search

    #Switch to To Do Entry Query Page and give the required values
    And element frame.tabpage_frame should be present
    And I switch to frame frame.tabpage_frame
    And I select "<search_by_list>" option by text from dropdown todoentryquerypage.search_by_list
    And I enter "<TODO_ID>" into input field todoentryquerypage.todo_id
    And I click element todoentryquerypage.todo_search
    And I click element todoentryquerypage.todo_id_link

    #Switch to To DO Entry - Help Ticket Page
    And element frame.tabpage_zonemapframe1 should be present
    And I switch to frame frame.tabpage_zonemapframe1
    And I click element todoentrypage.todo_complete
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.ui_frame
    And I enter "<TODO_Log_Entry>" into input field completetodoentrypage.todo_logentry
    And I click on element todoentrypage.to_do_save_btn




    #Logout C2M
  And I wait for 5 sec
   And I switch to main content
   And I switch to frame frame.main_frame
   And I click element c2mlogout.english_system
   And I click element c2mlogout.logout
   #And I close browser

    Examples:
      |    TODO_ID        	| search_by_list 	| TODO_Log_Entry 	|
   #C2MDEV   |17725789567863	| To Do Entry Identifier	|Complete|
      #C2MTEST|00530844101949	| To Do Entry Identifier	|Complete|
      |47988674077166| To Do Entry Identifier	|Complete|

