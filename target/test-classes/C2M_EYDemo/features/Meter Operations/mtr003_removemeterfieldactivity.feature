#####################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    	   Reason:
# 2022-04-25    AThott	   Initial Version.
#
#####################################################################################

Feature: Verify User is able to Remove Meter Field Activity



  @MTR003 @regression
  Scenario Outline: Verify User is able to Remove Meter Field Activity

    #User is Logged In
    Given I navigate to C2M_HOME page
    When I enter credentials.user into input field c2m.username
    And I enter credentials.pass into input field c2m.password
    And I click on element c2m.sign_in

    #Add a Premise
    And I switch to frame frame.main_frame
    And I click on element main.main_menu
    And element main.customer_information should be present
    And I hover over element main.communication
    And element submenu.activity should be present
    And I hover over element submenu.activity
    And I click element submenu.add

    #Switch to Field activity Page
    And element frame.ui_frame should be present
    And I switch to frame frame.ui_frame

    #Populate Required Field activity Page Values
    And I select "<Activity Type>" option by text from dropdown fieldactivitypage.actvity_type
    And I click element fieldactivitypage.actvity_type_ok
    And I enter "<Date of Removal>" into input field fieldactivitypage.servicedate_box
    And I press "TAB" key into input field fieldactivitypage.servicedate_box
    And I enter "<Service Point>" into input field fieldactivitypage.servicepoint_box
    And I select "<FIELD TASK TYPE>" option by text from dropdown fieldactivitypage.fieldtask_dropdown
    And I click element fieldactivitypage.to_do_save_btn


    #Logout C2M
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click element c2mlogout.english_system
    And I click element c2mlogout.logout
   # And I close browser


   Examples:
      |Activity Type   |Date of Removal  |Service Point |FIELD TASK TYPE|
     #C2MDEV |Field Activity  |04-26-2022	     |103742410057  |Remove Meter	|
    #C2MTEST  |Field Activity  |04-26-2022	     |446891971647  |Remove Meter	|
      #C2MTest|Field Activity  |04-26-2022	     |548717207180  |Remove Meter	|
      |Field Activity  |04-26-2022	     |847347791349  |Remove Meter	|