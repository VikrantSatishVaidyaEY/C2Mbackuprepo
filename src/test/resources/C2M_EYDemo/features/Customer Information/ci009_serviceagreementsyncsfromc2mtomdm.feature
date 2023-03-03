#####################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    		Reason:
# 2022-05-25	CTongo		Initial Version.
#
#####################################################################################

Feature: Service Agreement syncs from C2M to MDM

  @CI009 @regression
  Scenario Outline: Service Agreement syncs from C2M to MDM

#   Login C2M
    Given I navigate to C2M_HOME page
    When I enter credentials.user into input field c2m.username
    And I enter credentials.pass into input field c2m.password
    And I click on element c2m.sign_in

    #Go To 360 Search By Name
    And I wait for 5 sec
    And I switch to frame frame.main_frame
    And I click on element main.main_menu
    And element main.threesixty_search should be present
    And I click on element main.threesixty_search
    And I click on element submenu.search_by_name

    #Populate name field and click search
    And I switch to frame frame.tabpage_frame
    And I wait 10 seconds for element 360searchbynamepage.search_name to display
    And I enter "<name>" into input field 360searchbynamepage.search_name
    And I click on element 360searchbynamepage.search_btn

    #Go to Usage Subscription
    And I wait 10 seconds for element 360searchbynamepage.search_usage_subscription to display
    And I click on element 360searchbynamepage.search_usage_subscription
    And I wait for 10 sec

#    Logout C2M
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click element c2mlogout.english_system
    And I click element c2mlogout.logout
    And I close browser


    Examples:
      |name|
      |ADOLFSON,COLLEEN|