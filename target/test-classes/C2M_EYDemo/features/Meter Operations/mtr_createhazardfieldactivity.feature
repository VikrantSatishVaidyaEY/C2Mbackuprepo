#####################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    		Reason:
# 2022-05-20	CTongo		Initial Version.
#####################################################################################

Feature: Create Hazard Field Activity

  @MTR006 @regression
  Scenario Outline: Create Hazard Field Activity

    #Login C2M
    Given I navigate to C2M_HOME page
    When I enter credentials.user into input field c2m.username
    And I enter credentials.pass into input field c2m.password
    And I click on element c2m.sign_in

    #new code
    #Click on Control Central Search
    And I wait for 5 sec
    And I switch to frame frame.main_frame
    And I wait for 5 sec
    And I click on element main.main_menu
    And element main.control_central should be present
    And I click on element main.control_central

    #Control Central Search Page
    And I wait for 3 sec
    Then I should see page title as "Control Central Search"
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
   # And I select "<SEARCH BY>" option by text from dropdown controlcentralsearch.search_by
    #And element controlcentralsearch.account_id should be present
    And I enter "106 MANITOU AVE STE A" into input field controlcentralsearch.address
   # And I select "<CIS DIVISION>" option by text from dropdown controlcentralsearch.cis_division
    And I click element controlcentralsearch.search
    And I wait for 2 sec

    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I switch to frame frame.zonemapframe_2_frame
    And I click element controlcentral.premise_context_menu
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click on element controlcentralsearch.gotoactivity

    And I switch to main content
    And I switch to frame frame.main_frame
    And I click on element controlcentralsearch.add

#    And I switch to new window
#    And I select "Field Activity" option by text from dropdown fieldactivitypage.select_activity_type
#    And I click on element fieldactivitypage.actvity_type_ok


    And I wait for 3 sec
    And I switch to frame frame.ui_frame
    And I select "Field Activity" option by text from dropdown fieldactivitypage.actvity_type
    And I click on element fieldactivitypage.actvity_type_ok
    And I wait for 3 sec

    And I enter "11/14/2015" into input field fieldactivitypage.service_date_time
    #And I press "TAB" key into input field fieldactivitypage.service_date_time
    And I wait for 20 sec
    And I clear input field fieldactivitypage.service_time
   # And I enter "1:37:00PM" into input field fieldactivitypage.service_time
   # And I press "TAB" key into input field fieldactivitypage.service_time

    And I select "Red Tag" option by text from dropdown fieldactivitypage.hazard_type

    And I enter "13589" into input field fieldactivitypage.hazard_tag_number
    And I select "Furnace" option by text from dropdown fieldactivitypage.appliance

    And I select "Gas Leak" option by text from dropdown fieldactivitypage.hazard_code
    And I enter "FOUND .5% GAS AND 15 PPM CO IN ATMOSPHERE UTILITY" into input field fieldactivitypage.other

    And I enter "PATRICK PALACOL" into input field fieldactivitypage.classified_by
    And I enter "OWNER" into input field fieldactivitypage.reported_by

    And I enter "RALPH SAYEGH" into input field fieldactivitypage.contact_person
    And I enter "773-771-9275" into input field fieldactivitypage.contact_person_phone

    And I enter "2700 W JARLETH ST  CHICAGO, ILL 60645" into input field fieldactivitypage.property_owner_address

    #And I enter "7301138090" into input field fieldactivitypage.hazard_cust_contact_letter
#And I press "TAB" key into input field fieldactivitypage.hazard_cust_contact_letter
    And I enter "6654" into input field fieldactivitypage.receipt_number

    And I enter "FS42" into input field fieldactivitypage.assign_to
    And I enter "FOUND .5% GAS AND 15 PPM CO IN ATMOSPHERE UTILITY CLOSET COMPLETELY BLOCKED OFF. NEEDS TO BE WHAT METER SERVES AND AIR TEST REQUIRED" into input field fieldactivitypage.instructions
    
  #  And I click on element fieldactivitypage..to_do_save_btn



  #
#    #Go To Communication > Activity > Add
#    And I wait for 5 sec
#    And I switch to frame frame.main_frame
#    And I wait 10 seconds for element main.main_menu to display
#    And I click on element main.main_menu
#    And I wait 10 seconds for element main.communication to display
#    And I click on element main.communication
#    And I wait 10 seconds for element submenu.activity to display
#    And I click on element submenu.activity
#    And I click element submenu.add
#
#    #Populate Required Fields for Install Meter FA
#    And I wait for 3 sec
#    And I switch to frame frame.ui_frame
#    And I select "<activityType>" option by text from dropdown fieldactivitypage.actvity_type
#    And I click on element fieldactivitypage.actvity_type_ok
#    And I wait for 3 sec
#    And I enter "<startDate>" into input field fieldactivitypage.servicedate_box
#    And I enter "<servicePoint>" into input field fieldactivitypage.servicepoint_box
#    And I select "<fieldTaskType>" option by text from dropdown fieldactivitypage.fieldtask_dropdown
#    And I click on element fieldactivitypage.to_do_save_btn
#    And I wait for 15 sec
#
#    #Logout C2M
#    And I switch to main content
#    And I switch to frame frame.main_frame
#    And I click element c2mlogout.english_system
#    And I click element c2mlogout.logout
#    #And I close browser

    Examples:
      |activityType|startDate|servicePoint|fieldTaskType|
      #C2MDEV |Field Activity|02-18-2022|740120333679|Exchange Meter|
     #C2MTEST |Field Activity|02-18-2022|446891971647|Exchange Meter|
      #C2MTEST|Field Activity|02-18-2022|794226164932|Exchange Meter|
      |Field Activity|02-18-2022|847347791349|Meter Exchange|
