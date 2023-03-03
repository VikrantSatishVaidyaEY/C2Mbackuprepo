#####################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    		Reason:
# 2022-04-12	CTongo		Initial Version.
# 2022-05-25	CTongo	    Update Test scripts
#####################################################################################

Feature: Modifying A Write Off Event Trigger Date

  @CC014 @regression
  Scenario Outline: Modifying A Write Off Event Trigger Date

    #Login C2M
    Given I navigate to C2M_HOME page
    When I enter credentials.user into input field c2m.username
    And I enter credentials.pass into input field c2m.password
    And I click on element c2m.sign_in

    #Search Write Off Process
    And I wait for 5 sec
    And I switch to frame frame.main_frame
    And I click on element main.main_menu
    And element main.credit_collection should be present
    And I click on element main.credit_collection
    And element submenu.write_off_process should be present
    And I click on element submenu.write_off_process
    And I click on element submenu.search

    #Switch to App Pop Out Window
    And I wait for 3 sec
    And I switch to new window

    #Populate Required Write Off Pop Out Window Values then click Search
    And I wait 10 seconds for element writeoffprocesspage.write_off_process_id to display
    And I enter "<writeOffProcessId>" into input field writeoffprocesspage.write_off_process_id
    And I click on element writeoffprocesspage.write_off_process_id_search_btn

    #Switch to App Main Window
    And I switch to previous window

    #Search and Validate Write Off Process Event
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabmenu_frame
    And I click on element tabs.events
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I wait for 3 sec
    And validate the attribute value from the element writeoffprocesspage.write_off_process_event_seq for event sequence <eventSequence> if not matched click writeoffprocesspage.write_off_process_event_right_arrow

    #Edit Write Off Process Event Trigger Date
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I clear input field writeoffprocesspage.write_off_process_event_trigger_date
    And I enter "<newTriggerDate>" into input field writeoffprocesspage.write_off_process_event_trigger_date

    #Click Save
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click element actionbuttons.save
    And I wait for 5 sec

    #Logout C2M
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click element c2mlogout.english_system
    And I click element c2mlogout.logout
   # And I close browser

    Examples:
      | writeOffProcessId  | eventSequence | newTriggerDate |
      #C2MTEST| 0138566646         | 60            | 12-07-2021     |
      | 2613793527         | 60            | 01-24-2023     |
