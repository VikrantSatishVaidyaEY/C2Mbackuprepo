#####################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    		Reason:
# 2022-04-18	AThott		Initial Version.
# 2022-05-16	CTongo		Update test scripts
#####################################################################################

Feature: Add a device

  @DM001 @regression
  Scenario Outline: Add a device

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
    And I enter "<badgeNo>" into input field assetpage.asset_type_badge_number
    And I enter "<serialNo>" into input field assetpage.asset_type_serial_number
    And I select "<metrologyFirmwareVersion>" option by text from dropdown assetpage.asset_type_metrology_firmware_version
    And I select "<nicFirmwareVersion>" option by text from dropdown assetpage.asset_type_nic_firmware_version
    And I select "<measurementConfig>" option by text from dropdown assetpage.asset_type_measurement_configuration
    And I click element assetpage.asset_type_save_btn

    #Switch to Asset EAM Page
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I switch to frame frame.tabpage_zonemapframe1
    And I click element assetpage.asset_store
    And I switch to main content

    #Switch to Store Window
    And I wait for 10 sec
    And I switch to new window

      #C2MDEV WorkAround
    #Select the appropriate characteristic and enter the corresponding value in Store Window
#    And I wait 10 seconds for element assetpage.store_date to display
#    And I clear input field assetpage.store_date
#    And I enter "<date>" into input field assetpage.store_date
#    And I press "TAB" key into input field assetpage.store_time
#    And I press "TAB" key into input field assetpage.cal_img
#    And I enter "<storeTime>" into input field assetpage.store_time
    And I click element assetpage.asset_store_save_btn

    #Switch to To Do Entry Page
    And I wait for 5 sec
    And I switch to previous window

    #Validation
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click on element main.main_menu
    And I wait 10 seconds for element main.threesixty_search to display
    And I hover over element main.threesixty_search
    And I wait 10 seconds for element submenu.search_by_device to display
    And I click element submenu.search_by_device
    And I wait 10 seconds for element frame.tabpage_frame to display
    And I switch to frame frame.tabpage_frame
    And I select "Badge Number" option by text from dropdown 360searchbydevicepage.search_identifiertype
    And I enter "<badgeNo>" into input field 360searchbydevicepage.search_identifiervalue
    And I wait 10 seconds for element 360searchbydevicepage.search_device to display
    And I click element 360searchbydevicepage.search_device
    And I wait 10 seconds for element 360searchbydevicepage.device_search to display
    And I click element 360searchbydevicepage.device_search
    And I switch to frame frame.tabpage_zonemapframe1
    And I click element 360degreeviewpage.device_link
    And I wait for 5 sec

    #Logout C2M
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click element c2mlogout.english_system
    And I click element c2mlogout.logout
    And I close browser

    Examples:
      |date	|time	|assetType	|serviceLocation	|specification	|badgeNo	|serialNo	|measurementConfig	|storeTime	|metrologyFirmwareVersion	|nicFirmwareVersion	|
      |01-20-2023	|4:12:03	|Electric Type 1 - 120V 2W 1PH 100CL	|East Service Center Warehouse,2910 Willamette Pl	|1_LAN&GYR_ALF	|BN-06152208247	|SN-061528022236	|1_E-TYPICAL	|09:22:03	|1.0|1.0|
