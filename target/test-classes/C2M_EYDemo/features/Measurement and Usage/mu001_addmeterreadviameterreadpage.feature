#####################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    	   Reason:
# 2022-05-12	AThott	   Initial Version.
#
#####################################################################################

Feature: Verify User is able to Add a meter read via Meter Read page



  @MU001 @regression
  Scenario Outline: Verify User is able to Add a meter read via Meter Read page

    #User is Logged In
    Given I navigate to C2M_HOME page
    When I enter credentials.user into input field c2m.username
    And I enter credentials.pass into input field c2m.password
    And I click on element c2m.sign_in


     #Switch to search by device page
    And I wait for 5 sec
    And I switch to frame frame.main_frame
    And I click on element main.main_menu
    And element main.threesixty_search should be present
    And I click element main.threesixty_search
    And element submenu.search_by_device should be present
    And I click element submenu.search_by_device

  #Switch to 360 Search by Device
    And element frame.tabpage_frame should be present
    And I switch to frame frame.tabpage_frame

     #Populate Required Control Central Search Page Values
    And I select "<SEARCH BY>" option by text from dropdown 360searchbydevicepage.search_identifiertype
    And element 360searchbydevicepage.search_identifiervalue should be present
    And I enter "<badgeNo>" into input field 360searchbydevicepage.search_identifiervalue
    And I click element 360searchbydevicepage.search_device

    And I wait for 10 sec
    And I click element 360searchbydevicepage.scalar_device_search
    And I wait for 5 sec
    And element 360degreeviewpage.reading_link should be present
    And I wait for 5 sec
    And I click element 360degreeviewpage.reading_link
    And I wait for 5 sec
    And I switch to main content
    And I switch to frame frame.main_frame
    And I wait for 5 sec
    And element frame.ui_frame should be present
    And I switch to frame frame.ui_frame



    #Populate Required Start/Stop Values
    And element 360degreeviewpage.read_date should be present
    And I wait for 5 sec
    #When I put date number into input field 360degreeviewpage.read_date
    And I enter "01-20-2023" into input field 360degreeviewpage.read_date
    And I wait for 25 sec
#    And I press "TAB" key into input field 360degreeviewpage.read_date
    And I wait for 5 sec
    And I enter "<Reading>" into input field 360degreeviewpage.reading
    And I select "<Measure Condition>" option by text from dropdown 360degreeviewpage.measure_condition
    And I click element 360degreeviewpage.reading_save


    #Logout C2M
    And I wait for 10 sec
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click element c2mlogout.english_system
    And I forcefully click on element c2mlogout.logout
    And I close browser

    Examples:
      | SEARCH BY    | badgeNo  | Reading | Measure Condition |
      | Badge Number | 302021  | 10       | Regular           |