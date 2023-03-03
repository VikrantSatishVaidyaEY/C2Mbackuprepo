#####################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    		Reason:
# 2022-04-25	CTongo		Initial Version.
#
#####################################################################################

Feature: Create Asset Gas Device Type XXX Meter

  @DM004 @regression
  Scenario Outline: Create Asset Gas Device Type XXX Meter

    #Login C2M
    Given I navigate to C2M_HOME page
    When I enter credentials.user into input field c2m.username
    And I enter credentials.pass into input field c2m.password
    And I click on element c2m.sign_in

    #Go to Asset Management > Asset > Add
    And I wait for 5 sec
    And I switch to frame frame.main_frame
    And I wait 5 seconds for element main.main_menu to display
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
    And I put Badge Number assetpage.asset_type_badge_number into the input field
    And I put Serial Number assetpage.asset_type_serial_number into the input field
    And I wait for 5 sec
    And I select "<metrologyFirmwareVersion>" option by text from dropdown assetpage.asset_type_metrology_firmware_version
    And I select "<nicFirmwareVersion>" option by text from dropdown assetpage.asset_type_nic_firmware_version
    And I select "<measurementConfiguration>" option by text from dropdown assetpage.asset_type_measurement_configuration
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
    And I wait 7 seconds for element assetpage.asset_store_save_btn to display
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

#    #Go to Device Configuration
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
    And I wait 10 seconds for element c2mlogout.english_system to display
    And I click element c2mlogout.english_system
    And I wait 10 seconds for element c2mlogout.logout to display
    And I click element c2mlogout.logout
 #   And I close browser

    Examples:
      | assetType       | serviceLocation                   | specification       | metrologyFirmwareVersion | nicFirmwareVersion | measurementConfiguration  |
#      C2MDEV
    #  | Gas - 3000 | East Service Center Warehouse,2910 Willamette Pl  | 3000 SENSUS SONX3000     | 1.0                    | 1.0              | 200-G-TYPICAL |
#      | Gas - 250 Diaphragm | East Service Center Warehouse,2910 Willamette Pl  | 250_AMERICAN_250    | 1.0                    | 1.0              | 200-G-TYPICAL |
#      | Gas - 800 Diaphragm  | East Service Center Warehouse,2910 Willamette Pl  | 800 SENSUS SONX800    | 1.0                    | 1.0              | 200-G-TYPICAL |
#      | Gas - 5M Rotary AL  | East Service Center Warehouse,2910 Willamette Pl  | 5-M_ROOTS_5-M    | 1.0                    | 1.0              | 210-G-TYPICAL |
#      | Gas - 5M Rotary AL  | East Service Center Warehouse,2910 Willamette Pl  | 5-M_ROOTS_5-M    | 1.0                    | 1.0              | 210-G-CCFMV90 |
#      | Gas - 6 Turbo  | East Service Center Warehouse,2910 Willamette Pl  | 6-T_ROCKWELL_6 TURBO    | 1.0                    | 1.0              | 220-G-MCF |

      #C2MTEST
      | Gas - 250 Diaphragm | East Service Center Warehouse,2910 Willamette Pl  | 250_AMERICAN_250     | 1.0                    | 1.0              | 250_4-DIAL |
      | Gas - 250 Diaphragm | East Service Center Warehouse,2910 Willamette Pl  | 250_AMERICAN_250AC    | 1.0                    | 1.0              | 250_4-DIAL |
      | Gas - 250 Diaphragm  | East Service Center Warehouse,2910 Willamette Pl  | 250_AMERICAN_250NX    | 1.0                    | 1.0              | 250_4-DIAL |
      | Gas - 250 Diaphragm  | East Service Center Warehouse,2910 Willamette Pl  | 250_ITRON_I-250    | 1.0                    | 1.0              | 250_4-DIAL |
      | Gas - 250 Diaphragm  | East Service Center Warehouse,2910 Willamette Pl  | 250_ROCKWELL_250    | 1.0                    | 1.0              | 250_4-DIAL |
      | Gas - 250 Diaphragm  | East Service Center Warehouse,2910 Willamette Pl  | 250_SPRAGUE_250    | 1.0                    | 1.0              | 250_4-DIAL |
      | Gas - 3000 | East Service Center Warehouse,2910 Willamette Pl  | 3000_ROCKWELL_3000     | 1.0                    | 1.0              | 3000_5-DIAL |
      | Gas - 3000 | East Service Center Warehouse,2910 Willamette Pl  | 3000 SENSUS SONX3000     | 1.0                    | 1.0              | 3000_5-DIAL |
      | Gas - 800 Diaphragm  | East Service Center Warehouse,2910 Willamette Pl  | 800_AMERICAN_800    | 1.0                    | 1.0              | 800_5-DIAL |
      | Gas - 800 Diaphragm  | East Service Center Warehouse,2910 Willamette Pl  | 800_AMERICAN_800AC    | 1.0                    | 1.0              | 800_5-DIAL |
      | Gas - 800 Diaphragm  | East Service Center Warehouse,2910 Willamette Pl  |800_SENSUS_SONX880    | 1.0                    | 1.0              | 800_5-DIAL |
      | Gas - 5M Rotary AL  | East Service Center Warehouse,2910 Willamette Pl  | 5-M_ROOTS_5-M    | 1.0                    | 1.0              | 5-M_5-DIAL |
      | Gas - 6 Turbo  | East Service Center Warehouse,2910 Willamette Pl  | 6-T_ROCKWELL_6 TURBO    | 1.0                    | 1.0              | 6-T_6-DIAL |