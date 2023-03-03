#####################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    		Reason:
# 2022-08-12	Vvaidya		Initial Version.
#
#####################################################################################

Feature: Create MV90 Asset Electric Device Type XXX Meter

  @CM363 @regression
  Scenario Outline: Create MV90 Asset Electric Device Type XXX Meter

    #Login C2M
    Given I navigate to C2M_HOME page
    When I enter credentials.user into input field c2m.username
    And I enter credentials.pass into input field c2m.password
    And I click on element c2m.sign_in

    #Go to Asset Management > Asset > Add
    And I wait for 5 sec
    And I switch to frame frame.main_frame
    And I click on element main.main_menu
    And I wait 10 seconds for element main.asset_management to display
    And I click on element main.asset_management
    And I wait 10 seconds for element submenu.asset to display
    And I click on element submenu.asset
    And I click on element submenu.add

    #Populate Asset Type and Location and click OK
    And I switch to frame frame.ui_frame
    And I wait 10 seconds for element assetpage.asset_type to display
    And I select "<assetType>" option by text from dropdown assetpage.asset_type
    And I wait for 5 sec
    And I wait 10 seconds for element assetpage.asset_service_location to display
    And I select "<serviceLocation>" option by text from dropdown assetpage.asset_service_location
    And I click element assetpage.asset_ok_btn

    #Populate Required Add Asset Page and click OK
    And I wait 10 seconds for element assetpage.asset_spec to display
    And I select "<specification>" option by text from dropdown assetpage.asset_spec
    And I put badge number assetpage.asset_type_badge_number into the input field
    And I put serial number assetpage.asset_type_serial_number into the input field
      #And I put Badge Number assetpage.asset_type_badge_number into the input field
    #And I put Serial Number assetpage.asset_type_serial_number into the input field
    And I select "<metrologyFirmwareVersion>" option by text from dropdown assetpage.asset_type_metrology_firmware_version
    And I select "<nicFirmwareVersion>" option by text from dropdown assetpage.asset_type_nic_firmware_version
    And I select "<measurementConfiguration>" option by text from dropdown assetpage.asset_type_measurement_configuration
    And I click element assetpage.asset_type_save_btn

#     #new code for asset attributes for electric KH
#    And I switch to main content
#    And I switch to frame frame.main_frame
#    And I switch to frame frame.tabpage_frame
#    And I wait for 5 sec
#    And I click on element assetpage.edit_electrickh
#    And I switch to main content
#    And I wait for 7 sec
#    And I switch to new window
#    And I wait 7 seconds for element assetpage.electrickh_value to display
#    And I enter "1" into input field assetpage.electrickh_value
#    And I wait for 2 sec
#    And I click on element assetpage.electrickh_save
#    And I wait for 5 sec
#    And I switch to previous window
#     #code 2Scenario:
#    #new code for asset attributes for gear ratio
#    And I switch to main content
#    And I switch to frame frame.main_frame
#    And I switch to frame frame.tabpage_frame
#    And I wait for 5 sec
#    And I click on element assetpage.edit_gearratio
#    And I switch to main content
#    And I wait for 7 sec
#    And I switch to new window
#    And I wait 7 seconds for element assetpage.electrickh_value to display
#    And I enter "050:01" into input field assetpage.electrickh_value
#    And I wait for 2 sec
#    And I click on element assetpage.electrickh_save
#
#    And I wait for 5 sec
#    And I switch to previous window
#    #code 3Scenario:
#    #new code for asset attributes for register ratio
#    And I switch to main content
#    And I switch to frame frame.main_frame
#    And I switch to frame frame.tabpage_frame
#    And I wait for 5 sec
#    And I click on element assetpage.edit_registerratio
#    And I switch to main content
#    And I wait for 7 sec
#    And I switch to new window
#    And I wait 7 seconds for element assetpage.electrickh_value to display
#    And I enter "0200:000/000" into input field assetpage.electrickh_value
#    And I wait for 2 sec
#    And I click on element assetpage.electrickh_save
#    And I switch to previous window

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
    And I wait 10 seconds for element assetpage.asset_store_save_btn to display
    And I click element assetpage.asset_store_save_btn
    And I switch to previous window

#    #Go to Device
#    And I wait for 3 sec
#    And I switch to main content
#    And I switch to frame frame.main_frame
#    And I switch to frame frame.tabpage_frame
#    And I wait for 5 sec
#    And I wait 10 seconds for element frame.tabpage_zonemapframe1 to display
#    And I switch to frame frame.tabpage_zonemapframe1
#    And I wait 10 seconds for element assetpage.asset_device to display
#    And I click element assetpage.asset_device

    #Go to Device Configuration
#    And I wait for 10 sec
#    And I switch to main content
#    And I switch to frame frame.main_frame
#    And I switch to frame frame.tabpage_frame
#    And I wait 10 seconds for element devicepage.device_configuration to display
#    And I click element devicepage.device_configuration

    #Validate Required Measuring Components are created
    #And Validate that required measuring component list elements deviceconfigurationpage.measuring_component_type are created for device configuration <measurementConfiguration>

    #Logout C2M
#    And I wait for 10 sec
#    And I switch to main content
#    And I switch to frame frame.main_frame
#    And I click element c2mlogout.english_system
#    And I click element c2mlogout.logout
    #And I close browser

    Examples:
      | assetType                            | serviceLocation                                 | specification       | metrologyFirmwareVersion | nicFirmwareVersion | measurementConfiguration  |
      | Electric Type 11R - 120/480V 3W-Y/D 3PH 200CL | East Service Center Warehouse,2910 Willamette Pl | 11R_GE_KV2C | 1.0                    | 1.0              | 11R_E-MV90 |
#      | Electric Type 22R - 120/480V 4W-Y/D 3PH 200CL | East Service Center Warehouse,2910 Willamette Pl | 22R_GE_KV2C | 1.0                    | 1.0              | 22R_E-MV90 |
#      | Electric Type 3R - 120/480V 3W 1PH 200CL | East Service Center Warehouse,2910 Willamette Pl | 3R_GE_KV2C | 1.0                    | 1.0              | 3R_E-MV90 |
#      | Electric Type 60R - 120/480V 3W 3PH 20CL | East Service Center Warehouse,2910 Willamette Pl | 60R_GE_KV2C | 1.0                    | 1.0              |60R_E-MV90  |
#      | Electric Type 71P - 120V 4W-Y 3PH 20CL | East Service Center Warehouse,2910 Willamette Pl | 71P_ITRON_C1SC | 1.0                    | 1.0              | 71P_E-MV90 |
#      | Electric Type 72R - 120/480V 4W-Y/D 3PH 20CL | East Service Center Warehouse,2910 Willamette Pl | 72R_GE_KV2 | 1.0                    | 1.0              | 72R_E-MV90 |
#      | Electric Type 72R - 120/480V 4W-Y/D 3PH 20CL | East Service Center Warehouse,2910 Willamette Pl | 72R_GE_KV2C | 1.0                    | 1.0              | 72R_E-MV90 |
#      | Electric Type 72R - 120/480V 4W-Y/D 3PH 20CL | East Service Center Warehouse,2910 Willamette Pl | 72R_GE_KV2C+ | 1.0                    | 1.0              | 72R_E-MV90|
#      | Electric Type 72R - 120/480V 4W-Y/D 3PH 20CL | East Service Center Warehouse,2910 Willamette Pl | 72R_SCHWEITZ_SEL-734 | 1.0                    | 1.0              | 72R_E-MV90|
#
