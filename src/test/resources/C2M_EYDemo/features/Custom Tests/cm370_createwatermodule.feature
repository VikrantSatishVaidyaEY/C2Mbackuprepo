#####################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    		Reason:
# 2022-08-02	VVaidya		Initial Version.
#
#####################################################################################

Feature: Create Asset Water Module

  @CM370 @regression
  Scenario Outline: Create Asset Water Module

    #Login C2M
    Given I navigate to C2M_HOME page
    When I enter credentials.user into input field c2m.username
    And I enter credentials.pass into input field c2m.password
    And I click on element c2m.sign_in

    #Go to Asset Management > Asset > Add
    And I wait for 5 sec
    And I switch to frame frame.main_frame
    And I wait 10 seconds for element main.main_menu to display
    And I click on element main.main_menu
    And I wait 10 seconds for element main.asset_management to display
    And I forcefully click on element main.asset_management
    And I wait 10 seconds for element submenu.asset to display
    And I click on element submenu.asset
    And I click on element submenu.add

    #Populate Asset Type and Location and click OK
    And I switch to frame frame.ui_frame
    And I wait 10 seconds for element assetpage.asset_type to display
    And I select "<assetType>" option by text from dropdown assetpage.asset_type
    And I wait 10 seconds for element assetpage.asset_service_location to display
    And I select "<serviceLocation>" option by text from dropdown assetpage.asset_service_location
    And I click element assetpage.asset_ok_btn

    #Populate Required Add Asset Page and click OK
    And I wait 10 seconds for element assetpage.asset_spec to display
    And I select "<specification>" option by text from dropdown assetpage.asset_spec
    And I put badge number assetpage.asset_type_badge_number into the input field
    And I put serial number assetpage.asset_type_serial_number into the input field
   # And I put Badge Number assetpage.asset_type_badge_number into the input field
    #And I put Serial Number assetpage.asset_type_serial_number into the input field
   # And I select "<metrologyFirmwareVersion>" option by text from dropdown assetpage.asset_type_metrology_firmware_version
  #  And I select "<nicFirmwareVersion>" option by text from dropdown assetpage.asset_type_nic_firmware_version
  #  And I select "<measurementConfiguration>" option by text from dropdown assetpage.asset_type_measurement_configuration
    And I click element assetpage.asset_type_save_btn

    #Transition Added Asset to In Store status
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I wait for 5 sec
    And I wait 10 seconds for element frame.tabpage_zonemapframe1 to display
    And I switch to frame frame.tabpage_zonemapframe1
    And I wait 10 seconds for element assetpage.asset_store to display
    And I click element assetpage.asset_store
    And I switch to main content
    And I wait for 7 sec
    And I switch to new window
      #C2MDEV WORKAROUND
#    And I wait 10 seconds for element assetpage.asset_store_new_location to display
#    And I select "<newServiceLocation>" option by text from dropdown assetpage.asset_store_new_location
    And I wait 10 seconds for element assetpage.asset_store_save_btn to display
    And I click element assetpage.asset_store_save_btn
    And I switch to previous window

    #Go to Device
    And I wait for 3 sec
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I wait for 5 sec
    And I wait 10 seconds for element frame.tabpage_zonemapframe1 to display
    And I switch to frame frame.tabpage_zonemapframe1
    And I wait 10 seconds for element assetpage.asset_device to display
    And I click element assetpage.asset_device

    #Go to Device Configuration
#    And I switch to main content
#    And I switch to frame frame.main_frame
#    And I switch to frame frame.tabpage_frame
#    And I wait 10 seconds for element devicepage.device_configuration to display
#    And I click element devicepage.device_configuration

    #Validate Required Measuring Components are created
    #And Validate that required measuring component list elements deviceconfigurationpage.measuring_component_type are created for device configuration <measurementConfiguration>

    #Logout C2M
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click element c2mlogout.english_system
    And I click element c2mlogout.logout
   # And I close browser

    Examples:
      | assetType                  | serviceLocation                     | specification      | metrologyFirmwareVersion | nicFirmwareVersion | measurementConfiguration | newServiceLocation                              |
     # | Water - 1 Inch | East Service Center Warehouse,2910 Willamette Pl | 1 IN_SENSUS_EMPIRE 6 | 1.0                    | 1.0              | 500-W-TYPICAL         | Pleasanton Satellite Storeroom,5815 Owens Drive |
     # | Water - 1 Inch | East Service Center Warehouse,2910 Willamette Pl | 1 IN_SENSUS_W5500 | 1.0                    | 1.0              | 500-W-TYPICAL         | Pleasanton Satellite Storeroom,5815 Owens Drive |
     # | Water - 4 Inch | East Service Center Warehouse,2910 Willamette Pl | 4 IN_BADGER_T1000 | 1.0                    | 1.0              | 500-W-TYPICAL         | Pleasanton Satellite Storeroom,5815 Owens Drive |
      #| Water - 4 Inch | East Service Center Warehouse,2910 Willamette Pl | 4 IN_BADGER_T1000 | 1.0                    | 1.0              | 500-W-STRAIGHT         | Pleasanton Satellite Storeroom,5815 Owens Drive |
      | Water AMI Interpreter Water Module | East Service Center Warehouse,2910 Willamette Pl | WIN_MSTRMTR_45-2163 | 1.0                    | 1.0              | 500-W-STRAIGHT         | Pleasanton Satellite Storeroom,5815 Owens Drive |
      | Water AMI Pit Mounted Water Module | East Service Center Warehouse,2910 Willamette Pl | WPM_MSTRMTR_26-2537 | 1.0                    | 1.0              | 500-W-STRAIGHT         | Pleasanton Satellite Storeroom,5815 Owens Drive |
      | Water AMR MTU Module | East Service Center Warehouse,2910 Willamette Pl | WMTU_SENSUS_26-1098| 1.0                    | 1.0              | 500-W-STRAIGHT         | Pleasanton Satellite Storeroom,5815 Owens Drive |
      | Water AMR CPR Module | East Service Center Warehouse,2910 Willamette Pl | WMTU_SENSUS_26-1098| 1.0                    | 1.0              | 500-W-STRAIGHT         | Pleasanton Satellite Storeroom,5815 Owens Drive |


