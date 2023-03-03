#####################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    		Reason:
# 2022-05-20	CTongo		Initial Version.
#####################################################################################

Feature: Assigning To Do Entries (Supervisors)

  @TDS003 @regression
  Scenario Outline: Assigning To Do Entries (Supervisors)
    #User is Logged In
    Given I navigate to C2M_HOME page
    When I enter credentials.user into input field c2m.username
    And I enter credentials.pass into input field c2m.password
    And I click on element c2m.sign_in

    #Navigate to Supervisor To Do Assignment Page
    And I wait for 5 sec
    And I switch to frame frame.main_frame
    And I wait 10 seconds for element main.main_menu to display
    And I click on element main.main_menu
    And I wait 10 seconds for element main.to_do to display
    And I click on element main.to_do
    And I click on element submenu.supervisor_to_do_assgnmt

    #Search for To Do Type
    And I wait for 3 sec
    And I switch to new window
    And I wait for 3 sec
    And I wait 10 seconds for element supervisortodoassignmentpage.todo_type to display
    And I enter "<toDoType>" into input field supervisortodoassignmentpage.todo_type
    And I click element supervisortodoassignmentpage.todo_type_search_btn
    And I wait for 7 sec
      #Add selecting To Do Type if data needs to be selected
#    And I switch to frame frame.data_frame
#    And I wait 10 seconds for element supervisortodoassignmentpage.select_to_do_type to display
#    And I click element supervisortodoassignmentpage.select_to_do_type
#    And I wait for 3 sec

    #Filter Supervisor To Do Assignment
    And I switch to previous window
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I wait 10 seconds for element supervisortodoassignmentpage.todo_filter_by to display
    And I select "<filterBy>" option by text from dropdown supervisortodoassignmentpage.todo_filter_by

    #Select To Do for Assignment
    And I wait for 3 sec
    And I switch to previous window
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I switch to frame frame.data_frame
    And I wait 10 seconds for element supervisortodoassignmentpage.todo_checkbox to display
    And I click element supervisortodoassignmentpage.todo_checkbox

    #Assign to Supervisor
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I click element supervisortodoassignmentpage.todo_assign_to_icon
    And I wait for 3 sec
    And I switch to new window
    And I switch to main content
    And I wait 10 seconds for element supervisortodoassignmentpage.todo_user to display
    And I enter "<user>" into input field supervisortodoassignmentpage.todo_user
    And I click element supervisortodoassignmentpage.todo_user_search
    And I wait for 3 sec
    And I switch to previous window
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I click element supervisortodoassignmentpage.todo_assign_btn
    And I wait for 3 sec

    #Logout C2M
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click element c2mlogout.english_system
    And I click element c2mlogout.logout
   # And I close browser

    Examples:
      |    toDoType  	| filterBy 	| user 	|
      |BI	| Being Worked On	|91995040|
  #00169681350825