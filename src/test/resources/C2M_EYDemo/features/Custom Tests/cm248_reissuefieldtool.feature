#####################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    		Reason:
# 2022-08-22	AThott		Initial Version.
#
#####################################################################################

Feature: Reissue a field tool

  @CM24803 @regression
  Scenario Outline: Reissue a field tool

    #Login C2M
    Given I navigate to C2M_HOME page
    When I enter credentials.user into input field c2m.username
    And I enter credentials.pass into input field c2m.password
    And I click on element c2m.sign_in

    #Go To Asset Management > Asset > Add
    And I wait for 5 sec
    And I switch to frame frame.main_frame
    And I wait 10 seconds for element main.main_menu to display
    And I click on element main.main_menu
    And I wait 10 seconds for element main.asset_management to display
    And I click on element main.asset_management
    And I wait 10 seconds for element submenu.asset to display
    And I click on element submenu.asset
    And I click element submenu.add

    #Switch to Add Asset Page
    And I wait 10 seconds for element frame.ui_frame to display
    And I switch to frame frame.ui_frame

    #Populate Required Add Asset Page Values
    And I wait 10 seconds for element assetpage.asset_date to display
    And I clear input field assetpage.asset_date
    And I enter "<date>" into input field assetpage.asset_date
    And I press "TAB" key into input field assetpage.asset_date
    And I press "TAB" key into input field assetpage.cal_img
    And I enter "<time>" into input field assetpage.asset_time
    And I select "<assetType>" option by text from dropdown assetpage.asset_type
    And I select "<serviceLocation>" option by text from dropdown assetpage.asset_service_location
    And I click element assetpage.asset_ok_btn

    #Switch to Add Meter UI Map Page
    And I clear input field assetpage.asset_creation_date
    And I enter "<date>" into input field assetpage.asset_creation_date
    And I press "TAB" key into input field assetpage.asset_creation_date
    And I press "TAB" key into input field assetpage.cal_img
    And I enter "<time>" into input field assetpage.asset_creation_time
    And I select "<specification>" option by text from dropdown assetpage.asset_spec

    And I put badge number assetpage.asset_type_badge_number into the input field
    And I put serial number assetpage.asset_type_serial_number into the input field

    And I click element assetpage.asset_type_save_btn

    And I switch to main content
    And I switch to frame frame.main_frame
    And element frame.tabpage_frame should be present
    And I switch to frame frame.tabpage_frame
    And element frame.tabpage_zonemapframe1 should be present
    And I switch to frame frame.tabpage_zonemapframe1
    And I click element assetpage.asset_store
    And I switch to main content

    #Switch to Store Window
    And I wait for 10 sec
    And I switch to new window

    And I clear input field assetpage.store_date
    And I enter "<storedate>" into input field assetpage.store_date
    And I press "TAB" key into input field assetpage.store_time
    And I press "TAB" key into input field assetpage.cal_img
    And I enter "<time>" into input field assetpage.store_time
    And I click element assetpage.asset_store_save_btn

    #Switch to To Do Entry Page
    And I wait for 5 sec
    And I switch to previous window

    #Issue to New Person
    And I switch to main content
    And I switch to frame frame.main_frame
    And element frame.tabpage_frame should be present
    And I switch to frame frame.tabpage_frame
    And element frame.tabpage_zonemapframe1 should be present
    And I switch to frame frame.tabpage_zonemapframe1
    And I click element assetpage.asset_store
    And I switch to main content

    #Switch to Store Window
    And I wait for 10 sec
    And I switch to new window

    And I clear input field assetpage.store_date
    And I enter "<Issued storedate>" into input field assetpage.store_date
    And I press "TAB" key into input field assetpage.store_time
    And I press "TAB" key into input field assetpage.cal_img
    And I enter "<time>" into input field assetpage.store_time
    And I select "<New Location>" option by text from dropdown assetpage.asset_store_new_location
    And I click element assetpage.asset_store_save_btn

    And I wait for 5 sec
    And I switch to previous window
    #Change location to Warehouse

    And I switch to main content
    And I switch to frame frame.main_frame
    And element frame.tabpage_frame should be present
    And I switch to frame frame.tabpage_frame
    And element frame.tabpage_zonemapframe1 should be present
    And I switch to frame frame.tabpage_zonemapframe1
    And I click element assetpage.asset_store
    And I switch to main content

    #Switch to Store Window
    And I wait for 10 sec
    And I switch to new window

    And I clear input field assetpage.store_date
    And I enter "<warehousestoredate>" into input field assetpage.store_date
    And I press "TAB" key into input field assetpage.store_time
    And I press "TAB" key into input field assetpage.cal_img
    And I enter "<time>" into input field assetpage.store_time
    And I press "TAB" key into input field assetpage.time_img
    And I check the checkbox assetpage.asset_change_warehouselocation
    #And checkbox assetpage.asset_change_location_btn should be checked
    And I select "<serviceLocation>" option by text from dropdown assetpage.asset_store_new_location
    And I click element assetpage.asset_store_save_btn

    #Switch to To Do Entry Page
    And I wait for 5 sec
    And I switch to previous window

   #Re-Issue to another Person
    And I switch to main content
    And I switch to frame frame.main_frame
    And element frame.tabpage_frame should be present
    And I switch to frame frame.tabpage_frame
    And element frame.tabpage_zonemapframe1 should be present
    And I switch to frame frame.tabpage_zonemapframe1
    And I click element assetpage.asset_store
    And I switch to main content

    #Switch to Store Window
    And I wait for 10 sec
    And I switch to new window

    And I clear input field assetpage.store_date
    And I enter "<Re-Issued storedate>" into input field assetpage.store_date
    And I press "TAB" key into input field assetpage.store_time
    And I press "TAB" key into input field assetpage.cal_img
    And I enter "<time>" into input field assetpage.store_time
    And I select "<Re-Issue Location>" option by text from dropdown assetpage.asset_store_new_location
    And I click element assetpage.asset_store_save_btn

    And I wait for 5 sec
    And I switch to previous window
    #Logout C2M
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click element c2mlogout.english_system
    And I click element c2mlogout.logout
   # And I close browser

    Examples:
      |date	     |time	    |assetType	    |serviceLocation	                                |specification	        |storedate |Issued storedate|warehousestoredate|Re-Issued storedate|New Location|Re-Issue Location|
      |01-01-2021|06:00:00	|Comms Adapter	|East Service Center Warehouse,2910 Willamette Pl	|COMADPT_LAN&GYR_26-1742|01-02-2021|01-03-2021      |01-04-2022        |01-05-2022         |EM06        |FS06             |
