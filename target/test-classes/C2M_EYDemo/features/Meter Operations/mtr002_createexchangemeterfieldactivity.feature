#####################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    		Reason:
# 2022-05-20	CTongo		Initial Version.
#####################################################################################

Feature: Create Exchange Meter Field Activity

  @MTR002 @regression
  Scenario Outline: Create Exchange Meter Field Activity

    #Login C2M
    Given I navigate to C2M_HOME page
    When I enter credentials.user into input field c2m.username
    And I enter credentials.pass into input field c2m.password
    And I click on element c2m.sign_in

    #Go To Communication > Activity > Add
    And I wait for 5 sec
    And I switch to frame frame.main_frame
    And I wait 10 seconds for element main.main_menu to display
    And I click on element main.main_menu
    And I wait 10 seconds for element main.communication to display
    And I click on element main.communication
    And I wait 10 seconds for element submenu.activity to display
    And I click on element submenu.activity
    And I click element submenu.add

    #Populate Required Fields for Install Meter FA
    And I wait for 3 sec
    And I switch to frame frame.ui_frame
    And I select "<activityType>" option by text from dropdown fieldactivitypage.actvity_type
    And I click on element fieldactivitypage.actvity_type_ok
    And I wait for 3 sec
    And I enter "<startDate>" into input field fieldactivitypage.servicedate_box
    And I enter "<servicePoint>" into input field fieldactivitypage.servicepoint_box
    And I select "<fieldTaskType>" option by text from dropdown fieldactivitypage.fieldtask_dropdown
    And I click on element fieldactivitypage.to_do_save_btn
    And I wait for 15 sec

    #Logout C2M
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click element c2mlogout.english_system
    And I click element c2mlogout.logout
    #And I close browser

    Examples:
      |activityType|startDate|servicePoint|fieldTaskType|
      #C2MDEV |Field Activity|02-18-2022|740120333679|Exchange Meter|
     #C2MTEST |Field Activity|02-18-2022|446891971647|Exchange Meter|
      #C2MTEST|Field Activity|02-18-2022|794226164932|Exchange Meter|
      |Field Activity|02-18-2022|847347791349|Meter Exchange|
