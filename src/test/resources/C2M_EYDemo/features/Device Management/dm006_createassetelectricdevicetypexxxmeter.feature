#####################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    		Reason:
# 2022-04-29	CTongo		Initial Version.
#
#####################################################################################

Feature: Create Asset Electric Device Type XXX Meter

  @DM006 @regression
  Scenario Outline: Create Asset Electric Device Type XXX Meter

    #Login C2M
    Given I navigate to C2M_HOME page
    When I enter credentials.user into input field c2m.username
    And I enter credentials.pass into input field c2m.password
    And I click on element c2m.sign_in

#    #Go to Asset Management > Asset > Add
    And I wait for 5 sec
    And I switch to frame frame.main_frame
    And I wait 5 seconds for element main.main_menu to display
    And I forcefully click on element main.main_menu
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
    And I select "East Service Center Warehouse,2910 Willamette Pl" option by text from dropdown assetpage.asset_service_location
    And I click element assetpage.asset_ok_btn

    And I wait for 7 sec
    #Populate Required Add Asset Page and click OK
    And I wait 10 seconds for element assetpage.asset_spec to display
    And I select "<specification>" option by text from dropdown assetpage.asset_spec
    And I wait for 3 sec
   # And I enter "BN-7466907" into input field assetpage.asset_type_badge_number
    #And I enter "SN-4766708" into input field assetpage.asset_type_serial_number
    And I put badge number assetpage.asset_type_badge_number into the input field
    And I put serial number assetpage.asset_type_serial_number into the input field
    And I select "1.0" option by text from dropdown assetpage.asset_type_metrology_firmware_version
    And I select "1.0" option by text from dropdown assetpage.asset_type_nic_firmware_version
    And I select "<measurementConfiguration>" option by text from dropdown assetpage.asset_type_measurement_configuration
    And I click element assetpage.asset_type_save_btn

  #new code for asset attributes for electric KH
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I wait for 5 sec
    And I click on element assetpage.edit_electrickh
    And I switch to main content
    And I wait for 7 sec
    And I switch to new window
    And I wait 7 seconds for element assetpage.electrickh_value to display
    And I enter "1" into input field assetpage.electrickh_value
    And I wait for 2 sec
    And I click on element assetpage.electrickh_save
    And I wait for 5 sec
    And I switch to previous window
     #code 2Scenario:
    #new code for asset attributes for gear ratio
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I wait for 5 sec
    And I click on element assetpage.edit_gearratio
    And I switch to main content
    And I wait for 7 sec
    And I switch to new window
    And I wait 7 seconds for element assetpage.electrickh_value to display
    And I enter "050:01" into input field assetpage.electrickh_value
    And I wait for 2 sec
    And I click on element assetpage.electrickh_save

    And I wait for 5 sec
    And I switch to previous window
    #code 3Scenario:
    #new code for asset attributes for register ratio
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I wait for 5 sec
    And I click on element assetpage.edit_registerratio
    And I switch to main content
    And I wait for 7 sec
    And I switch to new window
    And I wait 7 seconds for element assetpage.electrickh_value to display
    And I enter "0200:000/000" into input field assetpage.electrickh_value
    And I wait for 2 sec
    And I click on element assetpage.electrickh_save
    And I switch to previous window

#    #Transition Added Asset to 'In Store' status
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
    And I wait for 5 sec
    #And I quit browser
    #itheparyant
#    And I wait for 7 sec
#
#  #see page title having partial text as "New Location - Google Chrome"
#    And I switch to previous window
#    And I wait for 2 sec
#
#  #see page title having partial text as "New Location - Google Chrome"
# #alert text as "New Location- Google Chrome"
#    #Go to Device
##    And I wait for 3 sec
##    And I switch to main content
##    And I switch to frame frame.main_frame
##    And I switch to frame frame.tabpage_frame
##    And I wait for 5 sec
##    And I wait 10 seconds for element frame.tabpage_zonemapframe1 to display
##    And I switch to frame frame.tabpage_zonemapframe1
##    And I wait 10 seconds for element assetpage.asset_device to display
##    And I click element assetpage.asset_device
##
##    #Go to Device Configuration
##    And I wait for 10 sec
##    And I switch to main content
##    And I switch to frame frame.main_frame
##    And I switch to frame frame.tabpage_frame
##    And I wait 10 seconds for element devicepage.device_configuration to display
##    And I click element devicepage.device_configuration

    #Validate Required Measuring Components are created
    #And Validate that required measuring component list elements deviceconfigurationpage.measuring_component_type are created for device configuration <measurementConfiguration>

    #Logout C2M
#    And I wait for 5 sec
#    And I switch to main content
#    And I switch to frame frame.main_frame
#    And I wait 4 seconds for element c2mlogout.english_system to display
#    And I click element c2mlogout.english_system
#    And I wait 4 seconds for element c2mlogout.logout to display
#    And I click element c2mlogout.logout
 #   And I close browser


    #C2MTEST Regular set of Testcases
    Examples:
      | assetType                            | serviceLocation                                 | specification       | metrologyFirmwareVersion | nicFirmwareVersion | measurementConfiguration  |
      | Electric Type 1 - 120V 2W 1PH 100CL | East Service Center Warehouse,2910 Willamette Pl | 1_LAN&GYR_ALF | 1.0                    | 1.0              | 1_E-TYPICAL |
      | Electric Type 10D - 120V 3W-Y 3PH 200CL 2-Way Service Discon | East Service Center Warehouse,2910 Willamette Pl | 10D_LAN&GYR_AXSD | 1.0                    | 1.0              | 10D_E-TYPICAL |
      | Electric Type 22M - 120/480V 4W-Y/D 3PH 200CL | East Service Center Warehouse,2910 Willamette Pl | 22M_GE_KV2C | 1.0                    | 1.0              | 22M_AMR-E-KVA |
      |Electric Type 52M - 240V 2W 1PH 20CL | East Service Center Warehouse,2910 Willamette Pl | 52M_GE_KV2C | 1.0                    | 1.0              | 52M_AMR-E-KVA |
      |Electric Type 52M - 240V 2W 1PH 20CL | East Service Center Warehouse,2910 Willamette Pl | 52M_GE_KV2C | 1.0                    | 1.0              | 52M_AMR-E-TOUNET |
      |Electric Type 52M - 240V 2W 1PH 20CL | East Service Center Warehouse,2910 Willamette Pl | 52M_GE_KV2C | 1.0                    | 1.0              | 52M_E-COM-S4X |
#      | Electric Type 3M - 120/480V 3W 1PH 200CL | East Service Center Warehouse,2910 Willamette Pl | 3-M_AMERICAN_RABO | 1.0                    | 1.0              | 3-M_5-DIAL |
      | Electric Type 5 - 240V 3W 1PH 200CL | East Service Center Warehouse,2910 Willamette Pl | 5_LAN&GYR_AX | 1.0                    | 1.0              | 5_AMR-E-TYPICAL |
      | Electric Type 5 - 240V 3W 1PH 200CL | East Service Center Warehouse,2910 Willamette Pl | 5_LAN&GYR_AX | 1.0                    | 1.0              | 5_E-TYPICAL |
      | Electric Type 5 - 240V 3W 1PH 200CL | East Service Center Warehouse,2910 Willamette Pl | 5_LAN&GYR_AX | 1.0                    | 1.0              | 5_AMR-E-ENRGYTOU |
      | Electric Type 5 - 240V 3W 1PH 200CL | East Service Center Warehouse,2910 Willamette Pl | 5_LAN&GYR_AX | 1.0                    | 1.0              | 5_AMR-E-NET |
      | Electric Type 5 - 240V 3W 1PH 200CL | East Service Center Warehouse,2910 Willamette Pl | 5_LAN&GYR_AX | 1.0                    | 1.0              | 5_E-RES-NET|
      | Electric Type 5 - 240V 3W 1PH 200CL | East Service Center Warehouse,2910 Willamette Pl | 5_LAN&GYR_AX | 1.0                    | 1.0              | 5_E-RES-TOU |
      | Electric Type 5 - 240V 3W 1PH 200CL | East Service Center Warehouse,2910 Willamette Pl | 5_ITRON_C1SC | 1.0                    | 1.0              | 5_E-TYPICAL |
      | Electric Type 5 - 240V 3W 1PH 200CL | East Service Center Warehouse,2910 Willamette Pl | 5_ITRON_C1SC | 1.0                    | 1.0              | 5_E-TYPICAL |
      | Electric Type 5 - 240V 3W 1PH 200CL | East Service Center Warehouse,2910 Willamette Pl | 5_ITRON_C1SC | 1.0                    | 1.0              | 5_AMR-E-TYPICAL |
      | Electric Type 5 - 240V 3W 1PH 200CL | East Service Center Warehouse,2910 Willamette Pl | 5_ITRON_C1SC | 1.0                    | 1.0              | 5_AMR-E-NET |
                #      | Electric Type 55 - 120V 2W 1PH 20CL | East Service Center Warehouse,2910 Willamette Pl | 55_LAN&GYR_AX | 1.0                    | 1.0              | 37410-E-TOU/NET |
#      | Electric Type 55 - 120V 2W 1PH 20CL | East Service Center Warehouse,2910 Willamette Pl | 55_LAN&GYR_AX | 1.0                    | 1.0              | 47620-E-TYPICAL |
      | Electric Type 5D - 240V 3W 1PH 200CL 2-Way Service Discon | East Service Center Warehouse,2910 Willamette Pl | 5D_LAN&GYR_AXRE | 1.0                    | 1.0              | 5D_AMR-E-TYPICAL |
      | Electric Type 5D - 240V 3W 1PH 200CL 2-Way Service Discon | East Service Center Warehouse,2910 Willamette Pl | 5D_LAN&GYR_AXRE | 1.0                    | 1.0              | 5D_E-TYPICAL |
      | Electric Type 5D - 240V 3W 1PH 200CL 2-Way Service Discon | East Service Center Warehouse,2910 Willamette Pl | 5D_LAN&GYR_AXRE | 1.0                    | 1.0              | 5D_AMR-E-ENRGYTOU |
      | Electric Type 5D - 240V 3W 1PH 200CL 2-Way Service Discon | East Service Center Warehouse,2910 Willamette Pl | 5D_LAN&GYR_AXRE | 1.0                    | 1.0              | 5D_AMR-E-NET |
      | Electric Type 5D - 240V 3W 1PH 200CL 2-Way Service Discon | East Service Center Warehouse,2910 Willamette Pl | 5D_LAN&GYR_AXRE | 1.0                    | 1.0              | 5D_E-RES-NET |
      | Electric Type 5D - 240V 3W 1PH 200CL 2-Way Service Discon | East Service Center Warehouse,2910 Willamette Pl | 5D_LAN&GYR_AXRE | 1.0                    | 1.0              | 5D_E-RES-TOU |
#      | Electric Type 5D - 240V 3W 1PH 200CL 2-Way Service Discon | East Service Center Warehouse,2910 Willamette Pl | 5D_LAN&GYR_AXRE | 1.0                    | 1.0              | 37410-E-SPPCS3 |
      | Electric Type 5E - 240V 3W 1PH 320CL | East Service Center Warehouse,2910 Willamette Pl | 5E_LAN&GYR_ALF | 1.0                    | 1.0              | 5E_AMR-E-TYPICAL |
      | Electric Type 5E - 240V 3W 1PH 320CL | East Service Center Warehouse,2910 Willamette Pl | 5E_LAN&GYR_ALF | 1.0                    | 1.0              | 5E_E-TYPICAL |
      | Electric Type 5E - 240V 3W 1PH 320CL | East Service Center Warehouse,2910 Willamette Pl | 5E_LAN&GYR_ALF | 1.0                    | 1.0              | 5E_AMR-E-ENRGYTOU |
      | Electric Type 5E - 240V 3W 1PH 320CL | East Service Center Warehouse,2910 Willamette Pl | 5E_LAN&GYR_ALF | 1.0                    | 1.0              | 5E_AMR-E-NET |
      | Electric Type 5E - 240V 3W 1PH 320CL | East Service Center Warehouse,2910 Willamette Pl | 5E_LAN&GYR_ALF | 1.0                    | 1.0              | 5E_E-RES-NET |
      | Electric Type 5E - 240V 3W 1PH 320CL | East Service Center Warehouse,2910 Willamette Pl | 5E_LAN&GYR_ALF | 1.0                    | 1.0              | 5E_E-RES-TOU |
      | Electric Type 5L - 240V 3W 1PH 200CL Prog for Load Profile | East Service Center Warehouse,2910 Willamette Pl | 5L_LAN&GYR_AX | 1.0                    | 1.0              | 5L_AMR-E-ENRGYTOU |
      | Electric Type 5L - 240V 3W 1PH 200CL Prog for Load Profile | East Service Center Warehouse,2910 Willamette Pl | 5L_LAN&GYR_AX | 1.0                    | 1.0              |5L_AMR-E-TYPICAL  |
      | Electric Type 5L - 240V 3W 1PH 200CL Prog for Load Profile | East Service Center Warehouse,2910 Willamette Pl | 5L_LAN&GYR_AX | 1.0                    | 1.0              | 5L_E-TYPICAL |
      | Electric Type 5L - 240V 3W 1PH 200CL Prog for Load Profile | East Service Center Warehouse,2910 Willamette Pl | 5L_LAN&GYR_AX | 1.0                    | 1.0              | 5L_AMR-E-NET |
      | Electric Type 5L - 240V 3W 1PH 200CL Prog for Load Profile | East Service Center Warehouse,2910 Willamette Pl | 5L_LAN&GYR_AX | 1.0                    | 1.0              | 5L_E-RES-NET |
      | Electric Type 5L - 240V 3W 1PH 200CL Prog for Load Profile | East Service Center Warehouse,2910 Willamette Pl | 5L_LAN&GYR_AX | 1.0                    | 1.0              | 5L_E-RES-TOU  |
      | Electric Type 5N - 240V 3W 1PH 200CL Programmed for Net | East Service Center Warehouse,2910 Willamette Pl | 5N_LAN&GYR_AX | 1.0                    | 1.0              | 5N_AMR-E-TYPICAL |
      | Electric Type 5N - 240V 3W 1PH 200CL Programmed for Net | East Service Center Warehouse,2910 Willamette Pl | 5N_LAN&GYR_AX | 1.0                    | 1.0              | 5N_E-TYPICAL |
      | Electric Type 5N - 240V 3W 1PH 200CL Programmed for Net | East Service Center Warehouse,2910 Willamette Pl | 5N_LAN&GYR_AX | 1.0                    | 1.0              | 5N_AMR-E-ENRGYTOU |
      | Electric Type 5N - 240V 3W 1PH 200CL Programmed for Net | East Service Center Warehouse,2910 Willamette Pl | 5N_LAN&GYR_AX | 1.0                    | 1.0              |  5N_AMR-E-NET|
      | Electric Type 5N - 240V 3W 1PH 200CL Programmed for Net | East Service Center Warehouse,2910 Willamette Pl | 5N_LAN&GYR_AX | 1.0                    | 1.0              | 5N_E-RES-NET |
      | Electric Type 5N - 240V 3W 1PH 200CL Programmed for Net | East Service Center Warehouse,2910 Willamette Pl | 5N_LAN&GYR_AX | 1.0                    | 1.0              | 5N_E-RES-TOU |
 | Electric Type 72M - 120/480V 4W-Y/D 3PH 20CL | East Service Center Warehouse,2910 Willamette Pl | 72M_GE_KV2C | 1.0                    | 1.0              |72M_AMR-E-KVA  |
      | Electric Type 72M - 120/480V 4W-Y/D 3PH 20CL | East Service Center Warehouse,2910 Willamette Pl | 72M_GE_KV2C | 1.0                    | 1.0              | 72M_AMR-E-TOUNET |
      | Electric Type 72M - 120/480V 4W-Y/D 3PH 20CL | East Service Center Warehouse,2910 Willamette Pl | 72M_GE_KV2C | 1.0                    | 1.0              | 72M_E-COM-S4X |
      | Electric Type 5ED - 240V 3W 1PH 320CL 2-Way Service Discon | East Service Center Warehouse,2910 Willamette Pl | 5ED_LAN&GYR_AXRE | 1.0                    | 1.0              |5ED_AMR-E-TYPICAL  |
      | Electric Type 5ED - 240V 3W 1PH 320CL 2-Way Service Discon | East Service Center Warehouse,2910 Willamette Pl | 5ED_LAN&GYR_AXRE | 1.0                    | 1.0              | 5ED_E-TYPICAL |
      | Electric Type 5ED - 240V 3W 1PH 320CL 2-Way Service Discon | East Service Center Warehouse,2910 Willamette Pl | 5ED_LAN&GYR_AXRE | 1.0                    | 1.0              | 5ED_AMR-E-ENRGYTOU |
      | Electric Type 5ED - 240V 3W 1PH 320CL 2-Way Service Discon | East Service Center Warehouse,2910 Willamette Pl | 5ED_LAN&GYR_AXRE | 1.0                    | 1.0              | 5ED_AMR-E-NET |
      | Electric Type 5ED - 240V 3W 1PH 320CL 2-Way Service Discon | East Service Center Warehouse,2910 Willamette Pl |5ED_LAN&GYR_AXRE  | 1.0                    | 1.0              | 5ED_E-RES-NET|
      | Electric Type 5ED - 240V 3W 1PH 320CL 2-Way Service Discon | East Service Center Warehouse,2910 Willamette Pl | 5ED_LAN&GYR_AXRE | 1.0                    | 1.0              | 5ED_E-RES-TOU |
      |Electric Type 5EN - 240V 3W 1PH 320CL Programmed for Net | East Service Center Warehouse,2910 Willamette Pl | 5EN_LAN&GYR_AX | 1.0                    | 1.0              | 5EN_AMR-E-TYPICAL |
      |Electric Type 5EN - 240V 3W 1PH 320CL Programmed for Net | East Service Center Warehouse,2910 Willamette Pl | 5EN_LAN&GYR_AX| 1.0                    | 1.0              | 5EN_E-TYPICAL |
      | Electric Type 1D - 120V 2W 1PH 100CL | East Service Center Warehouse,2910 Willamette Pl | 1D_LAN&GYR_AXRE | 1.0                    | 1.0              | 1D_AMR-E-TYPICAL |
      | Electric Type 1D - 120V 2W 1PH 100CL | East Service Center Warehouse,2910 Willamette Pl | 1D_LAN&GYR_AXRE | 1.0                    | 1.0              | 1D_E-TYPICAL |
      | Electric Type 1D - 120V 2W 1PH 100CL | East Service Center Warehouse,2910 Willamette Pl |1D_LAN&GYR_AXRE  | 1.0                    | 1.0              | 1D_AMR-E-ENRGYTOU|
      | Electric Type 1D - 120V 2W 1PH 100CL | East Service Center Warehouse,2910 Willamette Pl | 1D_LAN&GYR_AXRE | 1.0                    | 1.0              | 1D_AMR-E-NET |
      |Electric Type 1D - 120V 2W 1PH 100CL | East Service Center Warehouse,2910 Willamette Pl | 1D_LAN&GYR_AXRE | 1.0                    | 1.0              | 1D_E-RES-NET |
      |Electric Type 1D - 120V 2W 1PH 100CL | East Service Center Warehouse,2910 Willamette Pl | 1D_LAN&GYR_AXRE| 1.0                    | 1.0              | 1D_E-RES-TOU |
      | Electric Type 60M - 120/480V 3W 3PH 20CL | East Service Center Warehouse,2910 Willamette Pl | 60M_GE_KV2C | 1.0                    | 1.0              | 60M_AMR-E-KVA |
      |Electric Type 60M - 120/480V 3W 3PH 20CL | East Service Center Warehouse,2910 Willamette Pl | 60M_GE_KV2C | 1.0                    | 1.0              | 60M_AMR-E-TOUNET |
      |Electric Type 60M - 120/480V 3W 3PH 20CL | East Service Center Warehouse,2910 Willamette Pl | 60M_GE_KV2C| 1.0                    | 1.0              | 60M_E-COM-S4X |
#      |Water - 1 Inch| East Service Center Warehouse,2910 Willamette Pl | 1 IN_BADGER_55 |  1.0                    | 1.0              |1 IN_W-TYPICAL|
#      |Water - 1 1/2 Inch |East Service Center Warehouse,2910 Willamette Pl |1.5 IN_BADGER_160 T|1.0                    | 1.0         |1.5 IN_W-TYPICAL|
#      |Water - 1 1/2 Inch|East Service Center Warehouse,2910 Willamette Pl |1.5 IN_ABBWM_ABB 6|1.0                    | 1.0         |1.5 IN_W-TYPICAL|
#      |Water - 12 Inch|East Service Center Warehouse,2910 Willamette Pl |12 IN_SENSUS_EMPIRE 6|1.0                    | 1.0         |  12 IN_W-TYPICAL|
#      |Water - 18 Inch|East Service Center Warehouse,2910 Willamette Pl |18 IN_BADGER_MAG|1.0                    | 1.0              | 18 IN_W-TYPICAL|
#      |Water - 20 Inch|East Service Center Warehouse,2910 Willamette Pl |20 IN_BADGER_MAG|1.0                    | 1.0              |20 IN_W-TYPICAL|
#      |Water - 20 Inch|East Service Center Warehouse,2910 Willamette Pl |20 IN_BADGER_M2000|1.0                    | 1.0              |20 IN_W-TYPICAL|
#      |Water - 2 Inch|East Service Center Warehouse,2910 Willamette Pl |2 IN_ABBWM_ABB 6|1.0                    | 1.0              |2 IN_W-TYPICAL|
#      |Water - 2 Inch|East Service Center Warehouse,2910 Willamette Pl |2 IN_SENSUS_EMPIRE 6|1.0                    | 1.0              |2 IN_W-TYPICAL|
#      |Water - 4 Inch|East Service Center Warehouse,2910 Willamette Pl |4 IN_ACTARIS_WF 400|1.0                    | 1.0              |4 IN_W-TYPICAL|
#      |Water - 4 Inch|East Service Center Warehouse,2910 Willamette Pl |4 IN_BADGER_ADE|1.0                    | 1.0              |4 IN_W-TYPICAL|
#      |Water - 4 Inch|East Service Center Warehouse,2910 Willamette Pl |4 IN_SENSUS_101|1.0                    | 1.0              |4 IN_W-TYPICAL|
#      |Water - 3 Inch|East Service Center Warehouse,2910 Willamette Pl |3 IN_MSTRMTR_OCTAVE|1.0                    | 1.0              |3 IN_W-TYPICAL|
#      |Water - 3 Inch|East Service Center Warehouse,2910 Willamette Pl |3 IN_ACTARIS_WF 300|1.0                    | 1.0              |3 IN_W-TYPICAL|
#      |Water - 3 Inch|East Service Center Warehouse,2910 Willamette Pl |3 IN_BADGER_450 T|1.0                    | 1.0              |3 IN_W-TYPICAL|
#      |Water - 8 Inch|East Service Center Warehouse,2910 Willamette Pl |8 IN_BADGER_MAG|1.0                    | 1.0              |8 IN_W-TYPICAL|
#      |Water - 8 Inch|East Service Center Warehouse,2910 Willamette Pl |8 IN_MSTRMTR_OCTAVE|1.0                    | 1.0              |8 IN_W-TYPICAL|
#      |Water - 6 Inch|East Service Center Warehouse,2910 Willamette Pl |6 IN_ACTARIS_WF 600|1.0                    | 1.0              |6 IN_W-TYPICAL|
#      |Water - 3/4 Inch|East Service Center Warehouse,2910 Willamette Pl |3/4 IN_BADGER_ADE|1.0                    | 1.0              |3/4 IN_W-TYPICAL|
#      |Water - 6 Inch|East Service Center Warehouse,2910 Willamette Pl |6 IN_SENSUS_OMNI C2|1.0                    | 1.0              |6 IN_W-TYPICAL|
#    |Gas - 2300 Diaphragm|                                                                  East Service Center Warehouse,2910 Willamette Pl  |2300_AMERICAN_2300|1.0                    | 1.0             |2300_G-MCF|
#|Gas - 2300 Diaphragm|East Service Center Warehouse,2910 Willamette Pl  |2300_AMERICAN_2300|1.0                    | 1.0             |2300_5-DIAL|
#|Gas - 175 Diaphragm|East Service Center Warehouse,2910 Willamette Pl  |175_SPRAGUE_175AC AL|1.0                    | 1.0             |175_G-CCFMV90|
#|Gas - 175 Diaphragm|East Service Center Warehouse,2910 Willamette Pl  |175_ROCKWELL_175|1.0                    | 1.0             |175_G-CCFMV90|
#|Gas - 425 Diaphragm|East Service Center Warehouse,2910 Willamette Pl  |425_AMERICAN_425|1.0                    | 1.0             |425_G-CCFMV90|
#|Gas - 425 Diaphragm|East Service Center Warehouse,2910 Willamette Pl  |425_AMERICAN_425|1.0                    | 1.0             |425_G-MCF|
#  |Gas - 800 Diaphragm|East Service Center Warehouse,2910 Willamette Pl  |800_AMERICAN_800|1.0                    | 1.0             |800_5-DIAL|
#|Gas - 800 Diaphragm|East Service Center Warehouse,2910 Willamette Pl  |800_AMERICAN_800AC|1.0                    | 1.0             |800_5-DIAL|
#  |Gas - 12 Turbo|East Service Center Warehouse,2910 Willamette Pl  |12-T_ROCKWELL_12 TURBO|1.0                    | 1.0             |12-T_G-MCF|
#  |Gas - 200 Diaphragm|East Service Center Warehouse,2910 Willamette Pl  |200_ROCKWELL_200|1.0                    | 1.0             |200_G-CCFMV90|
#|Gas - 200 Diaphragm|East Service Center Warehouse,2910 Willamette Pl  |200_ROCKWELL_200|1.0                    | 1.0             |200_G-MCF|
#  |Gas - 3000|East Service Center Warehouse,2910 Willamette Pl  |3000 SENSUS SONX3000|1.0                    | 1.0             |3000_5-DIAL|
#|Gas - 3000|East Service Center Warehouse,2910 Willamette Pl  |3000_ROCKWELL_3000|1.0                    | 1.0             |3000_5-DIAL|
#  |Gas - 5000 Diaphragm|East Service Center Warehouse,2910 Willamette Pl  |5000_AMERICAN_5000|1.0                    | 1.0             |5000_G-MCF|
#|Gas - 5000 Diaphragm|East Service Center Warehouse,2910 Willamette Pl  |5000_ROCKWELL_5000|1.0                    | 1.0             |5000_G-MCF|
#  |Gas - 8 Turbo|East Service Center Warehouse,2910 Willamette Pl  |8-T_AMERICAN_8 TURBO|1.0                    | 1.0             |8-T_G-CCFMV90|
#|Gas - 8 Turbo|East Service Center Warehouse,2910 Willamette Pl  |8-T_ROCKWELL_8 TURBO|1.0                    | 1.0             |8-T_G-CCFMV90|
#  |Gas - 10000 Diaphragm|East Service Center Warehouse,2910 Willamette Pl  |10000_ROOTS_7-M|1.0                    | 1.0             |10000_G-MCF|
#  |Gas - 16M Rotary AL|East Service Center Warehouse,2910 Willamette Pl  |16-M_ROOTS_16-M|1.0                    | 1.0             |16-M_G-CCFMV90|
#|Gas - 16M Rotary AL|East Service Center Warehouse,2910 Willamette Pl  |16-M_ROOTS_16-M|1.0                    | 1.0             |16-M_6-DIAL|
#|Gas - 38M Rotary AL|East Service Center Warehouse,2910 Willamette Pl  |38-M_ROOTS_38-M|1.0                    | 1.0             |38-M_G-CCFMV90|
#|Gas - 38M Rotary AL|East Service Center Warehouse,2910 Willamette Pl  |38-M_ROOTS_38-M|1.0                    | 1.0             |38-M_6-DIAL|
#  |Gas - 7M Rotary AL|East Service Center Warehouse,2910 Willamette Pl  |7-M_ROOTS_7-M|1.0                    | 1.0             |7-M_5-DIAL|
#  |Gas - Ultrasonic|East Service Center Warehouse,2910 Willamette Pl  |880_DANIEL_ULTRA4|1.0                    | 1.0             |880_5-DIAL|
#|Gas - Ultrasonic|East Service Center Warehouse,2910 Willamette Pl  |880_DANIEL_ULTRA8|1.0                    | 1.0             |880_5-DIAL|
#  |Gas - 400 Diaphragm|East Service Center Warehouse,2910 Willamette Pl  |400_SPRAGUE_400|1.0                    | 1.0             |400_4-DIAL|
#
#      |Electric Type 10 - 120V 3W-Y 3PH 200CL|East Service Center Warehouse,2910 Willamette Pl | 10_LAN&GYR_AX|1.0                    | 1.0|10_AMR-E-TYPICAL|
#      |Electric Type 10D - 120V 3W-Y 3PH 200CL 2-Way Service Discon|East Service Center Warehouse,2910 Willamette Pl |10D_LAN&GYR_AXSD|1.0                    | 1.0|10D_E-RES-TOU|
#      |Electric Type 10N - 240V 3W 1PH 200CL Programmed for Net|East Service Center Warehouse,2910 Willamette Pl |10N_LAN&GYR_AX|1.0                    | 1.0|10N_E-COM-TOU|
#      |Electric Type 11 - 120/480V 3W  3PH 200CL AMR|East Service Center Warehouse,2910 Willamette Pl |11_ITRON_SS2S1T|1.0                    | 1.0|11_E-RES-KVA/NET|
#      |Electric Type 22 - 120/480V 4W-Y/D 3PH 200CL|East Service Center Warehouse,2910 Willamette Pl |22_SIEMENS_AXLS4|1.0                    | 1.0|22_AMR-E-KVA|
#      |Electric Type 52 - 240V 2W 1PH 20CL|East Service Center Warehouse,2910 Willamette Pl |52_LAN&GYR_AX|1.0                    | 1.0|52_AMR-E-KVA|
#      |Electric Type 60 - 120/480V 3W 3PH 20CL|East Service Center Warehouse,2910 Willamette Pl |60_ITRON_SS3S1T|1.0                    | 1.0|60_AMR-E-TOUNET|
#      |Electric Type 72 - 120/480V 4W-Y/D 3PH 20CL|East Service Center Warehouse,2910 Willamette Pl |72_GE_KV2C|1.0                    | 1.0|72_AMR-E-KVA|
#      |Electric Type 10N - 240V 3W 1PH 200CL Programmed for Net|East Service Center Warehouse,2910 Willamette Pl |10N_LAN&GYR_AXRE|1.0                    | 1.0|10N_E-COM-TOU|
##      | Electric Type 55 - 120V 2W 1PH 20CL | East Service Center Warehouse,2910 Willamette Pl | 55_LAN&GYR_AX | 1.0                    | 1.0              | 37410-E-TOU/NET |

            #    C2MDEV Regular set of Testcases
#      | assetType                            | serviceLocation                                 | specification       | metrologyFirmwareVersion | nicFirmwareVersion | measurementConfiguration  |
#      | Electric Type 1 - 120V 2W 1PH 100CL | East Service Center Warehouse,2910 Willamette Pl | 1_LAN&GYR_ALF | 1.0                    | 1.0              | 17420-E-TYPICAL |
#      | Electric Type 10D - 120V 3W-Y 3PH 200CL 2-Way Service Discon | East Service Center Warehouse,2910 Willamette Pl | 10D_LAN&GYR_AXSD | 1.0                    | 1.0              | 101-E-TYPICAL |
 #     | Electric Type 22M - 120/480V 4W-Y/D 3PH 200CL | East Service Center Warehouse,2910 Willamette Pl | 22M_GE_KV2C | 1.0                    | 1.0              | 410-E-TOU/NET |
  #   | Electric Type 3M - 120/480V 3W 1PH 200CL | East Service Center Warehouse,2910 Willamette Pl | 3M_GE_KV2C | 1.0                    | 1.0              | 421-E-KVA |
#      | Electric Type 3M - 120/480V 3W 1PH 200CL | East Service Center Warehouse,2910 Willamette Pl | 3M_GE_KV2C | 1.0                    | 1.0              | 140-E-KVA |
#      | Electric Type 3M - 120/480V 3W 1PH 200CL | East Service Center Warehouse,2910 Willamette Pl | 3M_GE_KV2C | 1.0                    | 1.0              | 330-E-KVA |
#      | Electric Type 3M - 120/480V 3W 1PH 200CL | East Service Center Warehouse,2910 Willamette Pl | 3M_GE_KV2C | 1.0                    | 1.0              | 400-E-KVA |
#      | Electric Type 5 - 240V 3W 1PH 200CL | East Service Center Warehouse,2910 Willamette Pl | 5_GE_I70S | 1.0                    | 1.0              | 605-E-TYPICAL |
#      | Electric Type 55 - 120V 2W 1PH 20CL | East Service Center Warehouse,2910 Willamette Pl | 55_LAN&GYR_AX | 1.0                    | 1.0              | 37410-E-TOU/NET |
#      | Electric Type 55 - 120V 2W 1PH 20CL | East Service Center Warehouse,2910 Willamette Pl | 55_LAN&GYR_AX | 1.0                    | 1.0              | 47620-E-TYPICAL |
#      | Electric Type 5D - 240V 3W 1PH 200CL 2-Way Service Discon | East Service Center Warehouse,2910 Willamette Pl | 5D_LAN&GYR_AXRE | 1.0                    | 1.0              | 27300-E-SPPCS5 |
#      | Electric Type 5D - 240V 3W 1PH 200CL 2-Way Service Discon | East Service Center Warehouse,2910 Willamette Pl | 5D_LAN&GYR_AXRE | 1.0                    | 1.0              | 17010-E-SPPCS3 |
#      | Electric Type 5D - 240V 3W 1PH 200CL 2-Way Service Discon | East Service Center Warehouse,2910 Willamette Pl | 5D_LAN&GYR_AXRE | 1.0                    | 1.0              | 37410-E-SPPCS5 |
#     | Electric Type 5D - 240V 3W 1PH 200CL 2-Way Service Discon | East Service Center Warehouse,2910 Willamette Pl | 5D_LAN&GYR_AXRE | 1.0                    | 1.0              | 17010-E-SPPCS5 |
#      | Electric Type 5D - 240V 3W 1PH 200CL 2-Way Service Discon | East Service Center Warehouse,2910 Willamette Pl | 5D_LAN&GYR_AXRE | 1.0                    | 1.0              | 27300-E-SPPCS3 |
#      | Electric Type 5D - 240V 3W 1PH 200CL 2-Way Service Discon | East Service Center Warehouse,2910 Willamette Pl | 5D_LAN&GYR_AXRE | 1.0                    | 1.0              | 27300-E-NET |
#      | Electric Type 5D - 240V 3W 1PH 200CL 2-Way Service Discon | East Service Center Warehouse,2910 Willamette Pl | 5D_LAN&GYR_AXRE | 1.0                    | 1.0              | 37410-E-SPPCS3 |
#      | Electric Type 5E - 240V 3W 1PH 320CL | East Service Center Warehouse,2910 Willamette Pl | 5E_LAN&GYR_ALF | 1.0                    | 1.0              | 17020-E-ENRGYTOU |
#      | Electric Type 5E - 240V 3W 1PH 320CL | East Service Center Warehouse,2910 Willamette Pl | 5E_LAN&GYR_ALF | 1.0                    | 1.0              | 17030-E-TYPICAL |
#      | Electric Type 5E - 240V 3W 1PH 320CL | East Service Center Warehouse,2910 Willamette Pl | 5E_LAN&GYR_ALF | 1.0                    | 1.0              | 27200-E-TYPICAL |
#      | Electric Type 5E - 240V 3W 1PH 320CL | East Service Center Warehouse,2910 Willamette Pl | 5E_LAN&GYR_ALF | 1.0                    | 1.0              | 27200-E-ENRGYTOU |
#      | Electric Type 5E - 240V 3W 1PH 320CL | East Service Center Warehouse,2910 Willamette Pl | 5E_LAN&GYR_ALF | 1.0                    | 1.0              | 17020-E-TYPICAL |
#      | Electric Type 5L - 240V 3W 1PH 200CL Prog for Load Profile | East Service Center Warehouse,2910 Willamette Pl | 5L_LAN&GYR_AX | 1.0                    | 1.0              | 6051-E-TYPICAL |
#      | Electric Type 5L - 240V 3W 1PH 200CL Prog for Load Profile | East Service Center Warehouse,2910 Willamette Pl | 5L_LAN&GYR_AX | 1.0                    | 1.0              | 609-E-ENRGYTOU |
#      | Electric Type 5L - 240V 3W 1PH 200CL Prog for Load Profile | East Service Center Warehouse,2910 Willamette Pl | 5L_LAN&GYR_AX | 1.0                    | 1.0              | 120-E-ENRGYTOU |
#      | Electric Type 5N - 240V 3W 1PH 200CL Programmed for Net | East Service Center Warehouse,2910 Willamette Pl | 5N_LAN&GYR_AX | 1.0                    | 1.0              | 606-E-NET |
#      | Electric Type 5N - 240V 3W 1PH 200CL Programmed for Net | East Service Center Warehouse,2910 Willamette Pl | 5N_LAN&GYR_AX | 1.0                    | 1.0              | 17010-E-NET |
#      | Electric Type 5N - 240V 3W 1PH 200CL Programmed for Net | East Service Center Warehouse,2910 Willamette Pl | 5N_LAN&GYR_AX | 1.0                    | 1.0              | 110-E-NET |
#      | Electric Type 5N - 240V 3W 1PH 200CL Programmed for Net | East Service Center Warehouse,2910 Willamette Pl | 5N_LAN&GYR_AX | 1.0                    | 1.0              | 608-E-ENRGYTOU |
#      | Electric Type 71P - 120V 4W-Y 3PH 20CL | East Service Center Warehouse,2910 Willamette Pl | 71P_ITRON_C1SC | 1.0                    | 1.0              | 150-E-WHEELING |
#      | Electric Type 71P - 120V 4W-Y 3PH 20CL | East Service Center Warehouse,2910 Willamette Pl | 71P_ITRON_C1SC | 1.0                    | 1.0              | 160-E-OATT |
#      | Electric Type 72M - 120/480V 4W-Y/D 3PH 20CL | East Service Center Warehouse,2910 Willamette Pl | 72M_GE_KV2C | 1.0                    | 1.0              | 335-E-TOU/NET |
#      | Electric Type 72M - 120/480V 4W-Y/D 3PH 20CL | East Service Center Warehouse,2910 Willamette Pl | 72M_GE_KV2C | 1.0                    | 1.0              | 37410-E-KVA |
#      | Electric Type 72R - 120/480V 4W-Y/D 3PH 20CL | East Service Center Warehouse,2910 Willamette Pl | 72R_GE_KV2C | 1.0                    | 1.0              | 17420-E-TOU/NET |
#      | Electric Type 72R - 120/480V 4W-Y/D 3PH 20CL | East Service Center Warehouse,2910 Willamette Pl | 72R_GE_KV2C | 1.0                    | 1.0              | 330-E-MV90 |
#      | Electric Type 72R - 120/480V 4W-Y/D 3PH 20CL | East Service Center Warehouse,2910 Willamette Pl | 72R_GE_KV2C | 1.0                    | 1.0              | 340-E-MV90 |
#      | Electric Type 72R - 120/480V 4W-Y/D 3PH 20CL | East Service Center Warehouse,2910 Willamette Pl | 72R_GE_KV2C | 1.0                    | 1.0              | 17420-E-TYPICAL |
#      | Electric Type 72R - 120/480V 4W-Y/D 3PH 20CL | East Service Center Warehouse,2910 Willamette Pl | 72R_GE_KV2C | 1.0                    | 1.0              | 400-E-MV90 |
#      | Electric Type 72R - 120/480V 4W-Y/D 3PH 20CL | East Service Center Warehouse,2910 Willamette Pl | 72R_GE_KV2C | 1.0                    | 1.0              | 17420-E-KVA |
#      | Electric Type 72R - 120/480V 4W-Y/D 3PH 20CL | East Service Center Warehouse,2910 Willamette Pl | 72R_GE_KV2C | 1.0                    | 1.0              | 130-E-MV90 |
#      | Electric Type 72R - 120/480V 4W-Y/D 3PH 20CL | East Service Center Warehouse,2910 Willamette Pl | 72R_GE_KV2C | 1.0                    | 1.0              | 37410-E-TYPICAL |
###      | Electric - Cell Phone - IP addressing | East Service Center Warehouse,2910 Willamette Pl | CELL_UNKNOWN_UNKE | 1.0                    | 1.0              | Standard |
###      | Electric AMI RF Module | East Service Center Warehouse,2910 Willamette Pl | ERF_LAN&GYR_ERF | 1.0                    | 1.0              | Standard |




##      | Electric - Cell Phone - IP addressing | East Service Center Warehouse,2910 Willamette Pl | CELL_UNKNOWN_UNKE | 1.0                    | 1.0              | Standard |
##      | Electric AMI RF Module | East Service Center Warehouse,2910 Willamette Pl | ERF_LAN&GYR_ERF | 1.0                    | 1.0              | Standard |
#C2MTEST All comprehensive set of 686 testcases

 #     | assetType                             | specification        | measurementConfiguration  |
#|Electric Type 1 - 120V 2W 1PH 100CL|1_GE_KV2C|1_AMR-E-ENRGYTOU|
#|Electric Type 1 - 120V 2W 1PH 100CL|1_ITRON_C1SC|1_AMR-E-ENRGYTOU|
#|Electric Type 1 - 120V 2W 1PH 100CL|1_LAN&GYR_ALF|1_AMR-E-ENRGYTOU|
#|Electric Type 1 - 120V 2W 1PH 100CL|1_LAN&GYR_AXRE|1_AMR-E-ENRGYTOU|
#|Electric Type 1 - 120V 2W 1PH 100CL|1_GE_KV2C|1_E-COM-TOU|
#|Electric Type 1 - 120V 2W 1PH 100CL|1_ITRON_C1SC|1_E-COM-TOU|
#|Electric Type 1 - 120V 2W 1PH 100CL|1_LAN&GYR_ALF|1_E-COM-TOU|
#|Electric Type 1 - 120V 2W 1PH 100CL|1_LAN&GYR_AXRE|1_E-COM-TOU|
#|Electric Type 1 - 120V 2W 1PH 100CL|1_GE_KV2C|1_E-RES-NET|
#|Electric Type 1 - 120V 2W 1PH 100CL|1_ITRON_C1SC|1_E-RES-NET|
#|Electric Type 1 - 120V 2W 1PH 100CL|1_LAN&GYR_ALF|1_E-RES-NET|
#|Electric Type 1 - 120V 2W 1PH 100CL|1_LAN&GYR_AXRE|1_E-RES-NET|
#|Electric Type 1 - 120V 2W 1PH 100CL|1_GE_KV2C|1_AMR-E-TYPICAL|
#|Electric Type 1 - 120V 2W 1PH 100CL|1_ITRON_C1SC|1_AMR-E-TYPICAL|
#|Electric Type 1 - 120V 2W 1PH 100CL|1_LAN&GYR_ALF|1_AMR-E-TYPICAL|
#|Electric Type 1 - 120V 2W 1PH 100CL|1_LAN&GYR_AXRE|1_AMR-E-TYPICAL|
#|Electric Type 1 - 120V 2W 1PH 100CL|1_GE_KV2C|1_E-RES-TOU|
#|Electric Type 1 - 120V 2W 1PH 100CL|1_ITRON_C1SC|1_E-RES-TOU|
#|Electric Type 1 - 120V 2W 1PH 100CL|1_LAN&GYR_ALF|1_E-RES-TOU|
#|Electric Type 1 - 120V 2W 1PH 100CL|1_LAN&GYR_AXRE|1_E-RES-TOU|
#|Electric Type 1 - 120V 2W 1PH 100CL|1_GE_KV2C|1_E-TYPICAL|
#|Electric Type 1 - 120V 2W 1PH 100CL|1_ITRON_C1SC|1_E-TYPICAL|
#|Electric Type 1 - 120V 2W 1PH 100CL|1_LAN&GYR_ALF|1_E-TYPICAL|
#|Electric Type 1 - 120V 2W 1PH 100CL|1_LAN&GYR_AXRE|1_E-TYPICAL|
#|Water - 1 Inch|1 IN_ABBWM_ABB 6|1 IN_W-TYPICAL|
##fail |Water - 1 Inch|1IN_SENSUS_W5500|1 IN_W-TYPICAL|
#|Water - 1 Inch| 1 IN_BADGER_55 | 1 IN_W-TYPICAL|
#      |Water - 1 1/2 Inch |1.5 IN_BADGER_160 T|1.5 IN_W-TYPICAL|
#      |Water - 1 1/2 Inch|1.5 IN_ABBWM_ABB 6|1.5 IN_W-TYPICAL|
#      |Water - 12 Inch|12 IN_SENSUS_EMPIRE 6|12 IN_W-TYPICAL|
#      |Water - 18 Inch|18 IN_BADGER_MAG|18 IN_W-TYPICAL|
#      |Water - 20 Inch|20 IN_BADGER_MAG|20 IN_W-TYPICAL|
#      |Water - 20 Inch|20 IN_BADGER_M2000|20 IN_W-TYPICAL|
#      |Water - 2 Inch|2 IN_ABBWM_ABB 6|2 IN_W-TYPICAL|
#      |Water - 2 Inch|2 IN_SENSUS_EMPIRE 6|2 IN_W-TYPICAL|
#      |Water - 4 Inch|4 IN_ACTARIS_WF 400|4 IN_W-TYPICAL|
#      |Water - 4 Inch|4 IN_BADGER_ADE|4 IN_W-TYPICAL|
#      |Water - 4 Inch|4 IN_SENSUS_101|4 IN_W-TYPICAL|
#      |Water - 3 Inch|3 IN_MSTRMTR_OCTAVE|3 IN_W-TYPICAL|
#      |Water - 3 Inch|3 IN_ACTARIS_WF 300|3 IN_W-TYPICAL|
#      |Water - 3 Inch|3 IN_BADGER_450 T|3 IN_W-TYPICAL|
#      |Water - 8 Inch|8 IN_BADGER_MAG|8 IN_W-TYPICAL|
#      |Water - 8 Inch|8 IN_MSTRMTR_OCTAVE|8 IN_W-TYPICAL|
#      |Water - 6 Inch|6 IN_ACTARIS_WF 600|6 IN_W-TYPICAL|
#      |Water - 3/4 Inch|3/4 IN_BADGER_ADE|3/4 IN_W-TYPICAL|
#      |Water - 6 Inch|6 IN_SENSUS_OMNI C2|6 IN_W-TYPICAL|
#|Water - 1 Inch|1 IN_BADGER_70|1 IN_W-TYPICAL|
#|Water - 1 Inch|1 IN_BADGER_ADE|1 IN_W-TYPICAL|
#|Water - 1 Inch|1 IN_MT STATE_BADGER 6|1 IN_W-TYPICAL|
#|Water - 1 Inch|1 IN_NATIONAL_BADGER 6|1 IN_W-TYPICAL|
#|Water - 1 Inch|1 IN_NEPTUNE_TRIDNT 6|1 IN_W-TYPICAL|
#|Water - 1 Inch|1 IN_SCHLBRGR_TRIDNT 6|1 IN_W-TYPICAL|
#|Water - 1 Inch|1 IN_SEN/ROCK_EMPIRE 6|1 IN_W-TYPICAL|
#|Water - 1 Inch|1 IN_SENSUS_EMPIRE 6|1 IN_W-TYPICAL|
#|Water - 1 Inch|1 IN_SENSUS_W5500|1 IN_W-TYPICAL|
#|Water - 1 Inch|1 IN_BADGER_40PN|1 IN_W-TYPICAL|
#|Water - 1 Inch|1 Inch Sensus Empire 6|1 IN_W-TYPICAL|

#|Water - 1 1/2 Inch|1.5 IN_MT STATE_BADGER 6|1.5 IN_W-TYPICAL|
#|Water - 1 1/2 Inch|1.5 IN_NATIONAL_BADGER 6|1.5 IN_W-TYPICAL|
#|Water - 1 1/2 Inch|1.5 IN_SCHLBRGR_TRIDNT 6|1.5 IN_W-TYPICAL|
#|Water - 1 1/2 Inch|1.5 IN_SEN/ROCK_EMPIRE 6|1.5 IN_W-TYPICAL|
#|Water - 1 1/2 Inch|1.5 IN_SENSUS_EMPIRE 6|1.5 IN_W-TYPICAL|
#|Water - 1 1/2 Inch|1.5 IN_SENSUS_OMNI T2|1.5 IN_W-TYPICAL|
#|Water - 1 1/2 Inch|1.5 IN_BADGER_ADE|1.5 IN_W-TYPICAL|
#|Water - 1 1/2 Inch|1.5 IN_BADGER_120|1.5 IN_W-TYPICAL|
#|Electric Type 10 - 120V 3W-Y 3PH 200CL|10_ITRON_CN1SC|10_E-RES-TOU|
#|Electric Type 10 - 120V 3W-Y 3PH 200CL|10_LAN&GYR_ALF|10_E-RES-TOU|
#|Electric Type 10 - 120V 3W-Y 3PH 200CL|10_SCHLBRGR_CENTRON|10_E-RES-TOU|
#|Electric Type 10 - 120V 3W-Y 3PH 200CL|10_SANGAMO_S12S|10_E-RES-TOU|
#|Electric Type 10 - 120V 3W-Y 3PH 200CL|10_LAN&GYR_AXSD|10_E-RES-TOU|
#|Electric Type 10 - 120V 3W-Y 3PH 200CL|10_LAN&GYR_AX|10_E-RES-TOU|
#|Electric Type 10 - 120V 3W-Y 3PH 200CL|10_ITRON_CN1SC|10_E-TYPICAL|
#|Electric Type 10 - 120V 3W-Y 3PH 200CL|10_LAN&GYR_ALF|10_E-TYPICAL|
#|Electric Type 10 - 120V 3W-Y 3PH 200CL|10_SCHLBRGR_CENTRON|10_E-TYPICAL|
#|Electric Type 10 - 120V 3W-Y 3PH 200CL|10_SANGAMO_S12S|10_E-TYPICAL|
#|Electric Type 10 - 120V 3W-Y 3PH 200CL|10_LAN&GYR_AXSD|10_E-TYPICAL|
#|Electric Type 10 - 120V 3W-Y 3PH 200CL|10_LAN&GYR_AX|10_E-TYPICAL|
#|Electric Type 10 - 120V 3W-Y 3PH 200CL|10_ITRON_CN1SC|10_AMR-E-NET|
#|Electric Type 10 - 120V 3W-Y 3PH 200CL|10_LAN&GYR_ALF|10_AMR-E-NET|
#|Electric Type 10 - 120V 3W-Y 3PH 200CL|10_SCHLBRGR_CENTRON|10_AMR-E-NET|
#|Electric Type 10 - 120V 3W-Y 3PH 200CL|10_SANGAMO_S12S|10_AMR-E-NET|
#|Electric Type 10 - 120V 3W-Y 3PH 200CL|10_LAN&GYR_AXSD|10_AMR-E-NET|
#|Electric Type 10 - 120V 3W-Y 3PH 200CL|10_LAN&GYR_AX|10_AMR-E-NET|
#|Electric Type 10 - 120V 3W-Y 3PH 200CL|10_ITRON_CN1SC|10_E-RES-NET|
#|Electric Type 10 - 120V 3W-Y 3PH 200CL|10_LAN&GYR_ALF|10_E-RES-NET|
#|Electric Type 10 - 120V 3W-Y 3PH 200CL|10_SCHLBRGR_CENTRON|10_E-RES-NET|
#|Electric Type 10 - 120V 3W-Y 3PH 200CL|10_SANGAMO_S12S|10_E-RES-NET|
#|Electric Type 10 - 120V 3W-Y 3PH 200CL|10_LAN&GYR_AXSD|10_E-RES-NET|
#|Electric Type 10 - 120V 3W-Y 3PH 200CL|10_LAN&GYR_AX|10_E-RES-NET|
#|Electric Type 10 - 120V 3W-Y 3PH 200CL|10_ITRON_CN1SC|10_AMR-E-ENRGYTOU|
#|Electric Type 10 - 120V 3W-Y 3PH 200CL|10_LAN&GYR_ALF|10_AMR-E-ENRGYTOU|
#|Electric Type 10 - 120V 3W-Y 3PH 200CL|10_SCHLBRGR_CENTRON|10_AMR-E-ENRGYTOU|
#|Electric Type 10 - 120V 3W-Y 3PH 200CL|10_SANGAMO_S12S|10_AMR-E-ENRGYTOU|
#|Electric Type 10 - 120V 3W-Y 3PH 200CL|10_LAN&GYR_AXSD|10_AMR-E-ENRGYTOU|
#|Electric Type 10 - 120V 3W-Y 3PH 200CL|10_LAN&GYR_AX|10_AMR-E-ENRGYTOU|
#|Electric Type 10 - 120V 3W-Y 3PH 200CL|10_ITRON_CN1SC|10_E-COM-TOU|
#|Electric Type 10 - 120V 3W-Y 3PH 200CL|10_LAN&GYR_ALF|10_E-COM-TOU|
#|Electric Type 10 - 120V 3W-Y 3PH 200CL|10_SCHLBRGR_CENTRON|10_E-COM-TOU|
#|Electric Type 10 - 120V 3W-Y 3PH 200CL|10_SANGAMO_S12S|10_E-COM-TOU|
#|Electric Type 10 - 120V 3W-Y 3PH 200CL|10_LAN&GYR_AXSD|10_E-COM-TOU|
#|Electric Type 10 - 120V 3W-Y 3PH 200CL|10_LAN&GYR_AX|10_E-COM-TOU|
#|Electric Type 10 - 120V 3W-Y 3PH 200CL|10_ITRON_CN1SC|10_AMR-E-TYPICAL|
#|Electric Type 10 - 120V 3W-Y 3PH 200CL|10_LAN&GYR_ALF|10_AMR-E-TYPICAL|
#|Electric Type 10 - 120V 3W-Y 3PH 200CL|10_SCHLBRGR_CENTRON|10_AMR-E-TYPICAL|
#|Electric Type 10 - 120V 3W-Y 3PH 200CL|10_SANGAMO_S12S|10_AMR-E-TYPICAL|
#|Electric Type 10 - 120V 3W-Y 3PH 200CL|10_LAN&GYR_AXSD|10_AMR-E-TYPICAL|

#|Gas - 1000 Diaphragm|1000_AMERICAN_1000|1000_G-MCF|
#|Gas - 1000 Diaphragm|1000_AMERICAN_1000|1000_G-CCFMV90|
#|Gas - 1000 Diaphragm|1000_AMERICAN_1000|1000_5-DIAL|
#|Gas - 10000 Diaphragm|10000_ROOTS_7-M|10000_G-MCF|
#|Gas - 10000 Diaphragm|10000_ROOTS_7-M|10000_G-CCFMV90|

#|Electric Type 10D - 120V 3W-Y 3PH 200CL 2-Way Service Discon|10D_LAN&GYR_AXRE-SD|10D_E-RES-TOU|
#|Electric Type 10D - 120V 3W-Y 3PH 200CL 2-Way Service Discon|10D_LAN&GYR_AXSD|10D_AMR-E-NET|
#|Electric Type 10D - 120V 3W-Y 3PH 200CL 2-Way Service Discon|10D_LAN&GYR_AXRE-SD|10D_AMR-E-NET|
#|Electric Type 10D - 120V 3W-Y 3PH 200CL 2-Way Service Discon|10D_LAN&GYR_AXSD|10D_AMR-E-TYPICAL|
#|Electric Type 10D - 120V 3W-Y 3PH 200CL 2-Way Service Discon|10D_LAN&GYR_AXRE-SD|10D_AMR-E-TYPICAL|
#|Electric Type 10D - 120V 3W-Y 3PH 200CL 2-Way Service Discon|10D_LAN&GYR_AXSD|10D_E-TYPICAL|
#|Electric Type 10D - 120V 3W-Y 3PH 200CL 2-Way Service Discon|10D_LAN&GYR_AXRE-SD|10D_E-TYPICAL|
#|Electric Type 10D - 120V 3W-Y 3PH 200CL 2-Way Service Discon|10D_LAN&GYR_AXSD|10D_E-RES-NET|
#|Electric Type 10D - 120V 3W-Y 3PH 200CL 2-Way Service Discon|10D_LAN&GYR_AXRE-SD|10D_E-RES-NET|
#|Electric Type 10D - 120V 3W-Y 3PH 200CL 2-Way Service Discon|10D_LAN&GYR_AXSD|10D_AMR-E-ENRGYTOU|
#|Electric Type 10D - 120V 3W-Y 3PH 200CL 2-Way Service Discon|10D_LAN&GYR_AXRE-SD|10D_AMR-E-ENRGYTOU|
#|Electric Type 10D - 120V 3W-Y 3PH 200CL 2-Way Service Discon|10D_LAN&GYR_AXSD|10D_E-COM-TOU|
#|Electric Type 10D - 120V 3W-Y 3PH 200CL 2-Way Service Discon|10D_LAN&GYR_AXRE-SD|10D_E-COM-TOU|


#|Electric Type 10N - 240V 3W 1PH 200CL Programmed for Net|10N_LAN&GYR_AXSD|10N_E-COM-TOU|
#|Electric Type 10N - 240V 3W 1PH 200CL Programmed for Net|10N_LAN&GYR_AX|10N_E-TYPICAL|
#|Electric Type 10N - 240V 3W 1PH 200CL Programmed for Net|10N_LAN&GYR_AXRE|10N_E-TYPICAL|
#|Electric Type 10N - 240V 3W 1PH 200CL Programmed for Net|10N_LAN&GYR_AXSD|10N_E-TYPICAL|
#|Electric Type 10N - 240V 3W 1PH 200CL Programmed for Net|10N_LAN&GYR_AX|10N_AMR-E-ENRGYTOU|
#|Electric Type 10N - 240V 3W 1PH 200CL Programmed for Net|10N_LAN&GYR_AXRE|10N_AMR-E-ENRGYTOU|
#|Electric Type 10N - 240V 3W 1PH 200CL Programmed for Net|10N_LAN&GYR_AXSD|10N_AMR-E-ENRGYTOU|
#|Electric Type 10N - 240V 3W 1PH 200CL Programmed for Net|10N_LAN&GYR_AX|10N_AMR-E-NET|
#|Electric Type 10N - 240V 3W 1PH 200CL Programmed for Net|10N_LAN&GYR_AXRE|10N_AMR-E-NET|
#|Electric Type 10N - 240V 3W 1PH 200CL Programmed for Net|10N_LAN&GYR_AXSD|10N_AMR-E-NET|
#|Electric Type 10N - 240V 3W 1PH 200CL Programmed for Net|10N_LAN&GYR_AX|10N_E-RES-TOU|
#|Electric Type 10N - 240V 3W 1PH 200CL Programmed for Net|10N_LAN&GYR_AXRE|10N_E-RES-TOU|
#|Electric Type 10N - 240V 3W 1PH 200CL Programmed for Net|10N_LAN&GYR_AXSD|10N_E-RES-TOU|
#|Electric Type 10N - 240V 3W 1PH 200CL Programmed for Net|10N_LAN&GYR_AX|10N_AMR-E-TYPICAL|
#|Electric Type 10N - 240V 3W 1PH 200CL Programmed for Net|10N_LAN&GYR_AXRE|10N_AMR-E-TYPICAL|
#|Electric Type 10N - 240V 3W 1PH 200CL Programmed for Net|10N_LAN&GYR_AXSD|10N_AMR-E-TYPICAL|
#|Electric Type 10N - 240V 3W 1PH 200CL Programmed for Net|10N_LAN&GYR_AX|10N_E-RES-NET|
#|Electric Type 10N - 240V 3W 1PH 200CL Programmed for Net|10N_LAN&GYR_AXRE|10N_E-RES-NET|
#|Electric Type 10N - 240V 3W 1PH 200CL Programmed for Net|10N_LAN&GYR_AXSD|10N_E-RES-NET|

#|Electric Type 11 - 120/480V 3W  3PH 200CL AMR|11_ITRON_SS2S1T|11_AMR-E-TOUNET|
#|Electric Type 11 - 120/480V 3W  3PH 200CL AMR|11_ITRON_SS2S1T|11_E-COM-KVA/NET|
#|Electric Type 11 - 120/480V 3W  3PH 200CL AMR|11_ITRON_SS2S1T|11_AMR-E-KVA|
#|Gas - 11M Rotary AL|11-M_ROOTS_11-M|11-M_G-CCFMV90|
#|Gas - 11M Rotary AL|11-M_ROOTS_11-M|11-M_G-MCF|
#|Gas - 11M Rotary AL|11-M_ROOTS_11-M|11-M_5-DIAL|
#|Electric Type 11M - 120/480V 3W 3PH 200CL|11M_GE_KV2C|11M_E-RES-KVA/NET|
#|Electric Type 11M - 120/480V 3W 3PH 200CL|11M_LAN&GYR_S4X|11M_E-RES-KVA/NET|
#|Electric Type 11M - 120/480V 3W 3PH 200CL|11M_GE_KV|11M_E-RES-KVA/NET|
#|Electric Type 11M - 120/480V 3W 3PH 200CL|11M_GE_KV2C|11M_AMR-E-TOUNET|
#|Electric Type 11M - 120/480V 3W 3PH 200CL|11M_LAN&GYR_S4X|11M_AMR-E-TOUNET|
#|Electric Type 11M - 120/480V 3W 3PH 200CL|11M_GE_KV|11M_AMR-E-TOUNET|
#|Electric Type 11M - 120/480V 3W 3PH 200CL|11M_GE_KV2C|11M_AMR-E-KVA|
#|Electric Type 11M - 120/480V 3W 3PH 200CL|11M_LAN&GYR_S4X|11M_AMR-E-KVA|
#|Electric Type 11M - 120/480V 3W 3PH 200CL|11M_GE_KV|11M_AMR-E-KVA|
#|Electric Type 11M - 120/480V 3W 3PH 200CL|11M_GE_KV2C|11M_E-COM-KVA/NET|
#|Electric Type 11M - 120/480V 3W 3PH 200CL|11M_LAN&GYR_S4X|11M_E-COM-KVA/NET|
#|Electric Type 11M - 120/480V 3W 3PH 200CL|11M_GE_KV|11M_E-COM-KVA/NET|
#|Electric Type 11R - 120/480V 3W-Y/D 3PH 200CL|11R_GE_KV2C|11R_E-MV90|

#|Water - 12 Inch|12 IN_SENSUS_PROPLR12|12 IN_W-TYPICAL|
#|Water - 12 Inch|12 IN_END+HAUS_PROMAG53|12 IN_W-TYPICAL|
#|Gas - 12 Turbo|12-T_ROCKWELL_12 TURBO|12-T_G-MCF|
#|Gas - 12 Turbo|12-T_ROCKWELL_12 TURBO|12-T_G-CCFMV90|
#|Gas - 1400 Diaphragm|1400_AMERICAN_1400|1400_G-MCF|
#|Gas - 1400 Diaphragm|1400_AMERICAN_1400|1400_G-CCFMV90|
#|Gas - 1400 Diaphragm|1400_AMERICAN_1400|1400_5-DIAL|
#|Water - 16 Inch|16 IN_BADGER_MAG|16 IN_W-TYPICAL|
#|Gas - 16M Rotary AL|16-M_ROOTS_16-M|16-M_G-CCFMV90|
#|Gas - 16M Rotary AL|16-M_ROOTS_16-M|16-M_6-DIAL|
#|Gas - 16M Rotary AL|16-M_ROOTS_16-M|16-M_G-MCF|
#|Gas - 175 Diaphragm|175_SPRAGUE_175AC AL|175_G-CCFMV90|
#|Gas - 175 Diaphragm|175_ROCKWELL_175|175_G-CCFMV90|
#|Gas - 175 Diaphragm|175_AMERICAN_175|175_G-CCFMV90|
#|Gas - 175 Diaphragm|175_SPRAGUE_175ACC|175_G-CCFMV90|
#|Gas - 175 Diaphragm|175_SPRAGUE_175AC AL|175_4-DIAL|
#|Gas - 175 Diaphragm|175_ROCKWELL_175|175_4-DIAL|
#|Gas - 175 Diaphragm|175_AMERICAN_175|175_4-DIAL|
#|Gas - 175 Diaphragm|175_SPRAGUE_175ACC|175_4-DIAL|
#|Gas - 175 Diaphragm|175_SPRAGUE_175AC AL|175_G-MCF|
#|Gas - 175 Diaphragm|175_ROCKWELL_175|175_G-MCF|
#|Gas - 175 Diaphragm|175_AMERICAN_175|175_G-MCF|
#|Gas - 175 Diaphragm|175_SPRAGUE_175ACC|175_G-MCF|

#|Water - 18 Inch|18 IN_END+HAUS_PROMAG53|18 IN_W-TYPICAL|
#|Electric Type 1D - 120V 2W 1PH 100CL|1D_LAN&GYR_AXRE|1D_E-RES-NET|
#|Electric Type 1D - 120V 2W 1PH 100CL|1D_LAN&GYR_AXRE-SD|1D_E-RES-NET|
#|Electric Type 1D - 120V 2W 1PH 100CL|1D_LAN&GYR_AXRE|1D_AMR-E-TYPICAL|
#|Electric Type 1D - 120V 2W 1PH 100CL|1D_LAN&GYR_AXRE-SD|1D_AMR-E-TYPICAL|
#|Electric Type 1D - 120V 2W 1PH 100CL|1D_LAN&GYR_AXRE|1D_E-COM-TOU|
#|Electric Type 1D - 120V 2W 1PH 100CL|1D_LAN&GYR_AXRE-SD|1D_E-COM-TOU|
#|Electric Type 1D - 120V 2W 1PH 100CL|1D_LAN&GYR_AXRE|1D_E-RES-TOU|
#|Electric Type 1D - 120V 2W 1PH 100CL|1D_LAN&GYR_AXRE-SD|1D_E-RES-TOU|
#|Electric Type 1D - 120V 2W 1PH 100CL|1D_LAN&GYR_AXRE|1D_E-TYPICAL|
#|Electric Type 1D - 120V 2W 1PH 100CL|1D_LAN&GYR_AXRE-SD|1D_E-TYPICAL|
#|Electric Type 1D - 120V 2W 1PH 100CL|1D_LAN&GYR_AXRE|1D_AMR-E-ENRGYTOU|
#|Electric Type 1D - 120V 2W 1PH 100CL|1D_LAN&GYR_AXRE-SD|1D_AMR-E-ENRGYTOU|
#|Electric Type 1D - 120V 2W 1PH 100CL|1D_LAN&GYR_AXRE|1D_AMR-E-NET|
#|Electric Type 1D - 120V 2W 1PH 100CL|1D_LAN&GYR_AXRE-SD|1D_AMR-E-NET|

#|Water - 2 Inch|2 IN_BADGER_170|2 IN_W-TYPICAL|

#|Water - 2 Inch|2 IN_SENSUS_OMNI T2|2 IN_W-TYPICAL|
#|Water - 2 Inch|2 IN_SENSUS_OMNI C2|2 IN_W-TYPICAL|
#|Water - 2 Inch|2 IN_BADGER_200 T|2 IN_W-TYPICAL|
#|Water - 2 Inch|2 IN_SEN/ROCK_EMPIRE 6|2 IN_W-TYPICAL|
#|Water - 2 Inch|2 IN_SCHLBRGR_TRIDNT 6|2 IN_W-TYPICAL|
#|Water - 2 Inch|2 IN_BADGER_ADE|2 IN_W-TYPICAL|
#|Water - 2 Inch|2 IN_BADGER_T2000|2 IN_W-TYPICAL|
#|Water - 2 Inch|2 IN_METRON_SPEC 130|2 IN_W-TYPICAL|
#|Water - 2 Inch|2 IN_MT STATE_BADGER 6|2 IN_W-TYPICAL|
#|Water - 2 Inch|2 IN_NATIONAL_BADGER 6|2 IN_W-TYPICAL|
#|Gas - 2M Rotary AL|2-M_ROOTS_2-M|2-M_5-DIAL|
#|Gas - 2M Rotary AL|2-M_ROOTS_2-M|2-M_G-CCFMV90|
#|Gas - 2M Rotary AL|2-M_ROOTS_2-M|2-M_G-MCF|

#|Gas - 200 Diaphragm|200_ROCKWELL_200|200_G-CCFMV90|
#|Gas - 200 Diaphragm|200_ROCKWELL_200|200_G-MCF|
#|Gas - 200 Diaphragm|200_ROCKWELL_200|200_4-DIAL|

#|Electric Type 22 - 120/480V 4W-Y/D 3PH 200CL|22_LAN&GYR_AXR|22_AMR-E-KVA|
#|Electric Type 22 - 120/480V 4W-Y/D 3PH 200CL|22_ITRON_SS4S1T|22_AMR-E-KVA|
#|Electric Type 22 - 120/480V 4W-Y/D 3PH 200CL|22_LAN&GYR_AXLS4|22_AMR-E-KVA|
#|Electric Type 22 - 120/480V 4W-Y/D 3PH 200CL|22_SIEMENS_AXLS4|22_E-RES-KVA/NET|
#|Electric Type 22 - 120/480V 4W-Y/D 3PH 200CL|22_LAN&GYR_AXR|22_E-RES-KVA/NET|
#|Electric Type 22 - 120/480V 4W-Y/D 3PH 200CL|22_ITRON_SS4S1T|22_E-RES-KVA/NET|
#|Electric Type 22 - 120/480V 4W-Y/D 3PH 200CL|22_LAN&GYR_AXLS4|22_E-RES-KVA/NET|
#|Electric Type 22 - 120/480V 4W-Y/D 3PH 200CL|22_SIEMENS_AXLS4|22_E-COM-KVA/NET|
#|Electric Type 22 - 120/480V 4W-Y/D 3PH 200CL|22_LAN&GYR_AXR|22_E-COM-KVA/NET|
#|Electric Type 22 - 120/480V 4W-Y/D 3PH 200CL|22_ITRON_SS4S1T|22_E-COM-KVA/NET|
#|Electric Type 22 - 120/480V 4W-Y/D 3PH 200CL|22_LAN&GYR_AXLS4|22_E-COM-KVA/NET|
#|Electric Type 22 - 120/480V 4W-Y/D 3PH 200CL|22_SIEMENS_AXLS4|22_AMR-E-TOUNET|
#|Electric Type 22 - 120/480V 4W-Y/D 3PH 200CL|22_LAN&GYR_AXR|22_AMR-E-TOUNET|
#|Electric Type 22 - 120/480V 4W-Y/D 3PH 200CL|22_ITRON_SS4S1T|22_AMR-E-TOUNET|
#|Electric Type 22 - 120/480V 4W-Y/D 3PH 200CL|22_LAN&GYR_AXLS4|22_AMR-E-TOUNET|
#|Electric Type 22M - 120/480V 4W-Y/D 3PH 200CL|22M_LAN&GYR_S4X|22M_AMR-E-TOUNET|
#|Electric Type 22M - 120/480V 4W-Y/D 3PH 200CL|22M_LAN&GYR_AXR|22M_AMR-E-TOUNET|
#|Electric Type 22M - 120/480V 4W-Y/D 3PH 200CL|22M_GE_KV2C|22M_AMR-E-TOUNET|
#|Electric Type 22M - 120/480V 4W-Y/D 3PH 200CL|22M_GE_KV|22M_AMR-E-TOUNET|
#|Electric Type 22M - 120/480V 4W-Y/D 3PH 200CL|22M_LAN&GYR_S4X|22M_AMR-E-KVA|
#|Electric Type 22M - 120/480V 4W-Y/D 3PH 200CL|22M_LAN&GYR_AXR|22M_AMR-E-KVA|
#|Electric Type 22M - 120/480V 4W-Y/D 3PH 200CL|22M_GE_KV2C|22M_AMR-E-KVA|
#|Electric Type 22M - 120/480V 4W-Y/D 3PH 200CL|22M_GE_KV|22M_AMR-E-KVA|
#|Electric Type 22M - 120/480V 4W-Y/D 3PH 200CL|22M_LAN&GYR_S4X|22M_E-RES-KVA/NET|
#|Electric Type 22M - 120/480V 4W-Y/D 3PH 200CL|22M_LAN&GYR_AXR|22M_E-RES-KVA/NET|
#|Electric Type 22M - 120/480V 4W-Y/D 3PH 200CL|22M_GE_KV2C|22M_E-RES-KVA/NET|
#|Electric Type 22M - 120/480V 4W-Y/D 3PH 200CL|22M_GE_KV|22M_E-RES-KVA/NET|
#|Electric Type 22M - 120/480V 4W-Y/D 3PH 200CL|22M_LAN&GYR_S4X|22M_E-COM-KVA/NET|
#|Electric Type 22M - 120/480V 4W-Y/D 3PH 200CL|22M_LAN&GYR_AXR|22M_E-COM-KVA/NET|
#|Electric Type 22M - 120/480V 4W-Y/D 3PH 200CL|22M_GE_KV2C|22M_E-COM-KVA/NET|
#|Electric Type 22M - 120/480V 4W-Y/D 3PH 200CL|22M_GE_KV|22M_E-COM-KVA/NET|
#|Electric Type 22R - 120/480V 4W-Y/D 3PH 200CL|22R_GE_KV2C|22R_E-MV90|
#|Gas - 23M Rotary AL|23-M_ROOTS_23-M|23-M_6-DIAL|
#|Gas - 23M Rotary AL|23-M_ROOTS_23-M|23-M_G-MCF|
#|Gas - 23M Rotary AL|23-M_ROOTS_23-M|23-M_G-CCFMV90|
#|Gas - 2300 Diaphragm|2300_AMERICAN_2300|2300_G-MCF|
#|Gas - 2300 Diaphragm|2300_AMERICAN_2300|2300_5-DIAL|


  #vikrant

  ########################################################
#|Gas - 2300 Diaphragm|2300_AMERICAN_2300|2300_G-CCFMV90|
#|Gas - 250 Diaphragm|250_AMERICAN_250|250_G-MCF|
#|Gas - 250 Diaphragm|250_AMERICAN_250AC|250_G-MCF|
#|Gas - 250 Diaphragm|250_AMERICAN_250NX|250_G-MCF|
#|Gas - 250 Diaphragm|250_ITRON_I-250|250_G-MCF|
#|Gas - 250 Diaphragm|250_ROCKWELL_250|250_G-MCF|
#|Gas - 250 Diaphragm|250_SPRAGUE_250|250_G-MCF|
#|Gas - 250 Diaphragm|250_AMERICAN_250|250_4-DIAL|
#|Gas - 250 Diaphragm|250_AMERICAN_250AC|250_4-DIAL|
#|Gas - 250 Diaphragm|250_AMERICAN_250NX|250_4-DIAL|
#|Gas - 250 Diaphragm|250_ITRON_I-250|250_4-DIAL|
#|Gas - 250 Diaphragm|250_ROCKWELL_250|250_4-DIAL|
#|Gas - 250 Diaphragm|250_SPRAGUE_250|250_4-DIAL|
#|Gas - 250 Diaphragm|250_AMERICAN_250|250_G-CCFMV90|
#|Gas - 250 Diaphragm|250_AMERICAN_250AC|250_G-CCFMV90|
#|Gas - 250 Diaphragm|250_AMERICAN_250NX|250_G-CCFMV90|
#|Gas - 250 Diaphragm|250_ITRON_I-250|250_G-CCFMV90|
#|Gas - 250 Diaphragm|250_ROCKWELL_250|250_G-CCFMV90|
#|Gas - 250 Diaphragm|250_SPRAGUE_250|250_G-CCFMV90|
#|Gas - 275 Diaphragm|275_ROCKWELL_275|275_G-CCFMV90|
#|Gas - 275 Diaphragm|275_ROCKWELL_275|275_G-MCF|
#|Gas - 275 Diaphragm|275_ROCKWELL_275|275_4-DIAL|

#|Water - 3 Inch|3 IN_SENSUS_PROPLR 3|3 IN_W-TYPICAL|
#|Water - 3 Inch|3 IN_SENSUS_OMNI T2|3 IN_W-TYPICAL|
#|Water - 3 Inch|3 IN_SENSUS_OMNI C2|3 IN_W-TYPICAL|
#|Water - 3 Inch|3 IN_SENSUS_EMPIRE 6|3 IN_W-TYPICAL|
#|Water - 3 Inch|3 IN_SEN/ROCK_EMPIRE 6|3 IN_W-TYPICAL|
#|Water - 3 Inch|3 IN_NEPTUNE_TRIDNT 6|3 IN_W-TYPICAL|

#|Water - 3 Inch|3 IN_METRON_SPEC 260|3 IN_W-TYPICAL|
#|Water - 3 Inch|3 IN_METRON_SPEC 175|3 IN_W-TYPICAL|
#|Water - 3 Inch|3 IN_BADGER_T450|3 IN_W-TYPICAL|
#|Water - 3 Inch|3 IN_BADGER_MAG|3 IN_W-TYPICAL|
#|Water - 3 Inch|3 IN_BADGER_M2000|3 IN_W-TYPICAL|
#|Water - 3 Inch|3 IN_BADGER_ADE|3 IN_W-TYPICAL|
#|Gas - 3M Rotary AL|3-M_AMERICAN_RABO|3-M_G-MCF|
#|Gas - 3M Rotary AL|3-M_ROOTS_3-M|3-M_G-MCF|
#|Gas - 3M Rotary AL|3-M_AMERICAN_RABO|3-M_5-DIAL|
#|Gas - 3M Rotary AL|3-M_ROOTS_3-M|3-M_5-DIAL|
#|Gas - 3M Rotary AL|3-M_AMERICAN_RABO|3-M_G-CCFMV90|
#|Gas - 3M Rotary AL|3-M_ROOTS_3-M|3-M_G-CCFMV90|

#|Water - 3/4 Inch|3/4 IN_ABBWM_ABB 6|3/4 IN_W-TYPICAL|
#|Water - 3/4 Inch|3/4 IN_BADGER_35|3/4 IN_W-TYPICAL|
#|Water - 3/4 Inch|3/4 IN_NATIONAL_BADGER 6|3/4 IN_W-TYPICAL|
#|Water - 3/4 Inch|3/4 IN_SCHLBRGR_TRIDNT 6|3/4 IN_W-TYPICAL|
#|Water - 3/4 Inch|3/4 IN_SENSUS_EMPIRE 6|3/4 IN_W-TYPICAL|
#|Gas - 3000|3000 SENSUS SONX3000|3000_5-DIAL|
#|Gas - 3000|3000_ROCKWELL_3000|3000_5-DIAL|
#|Gas - 3000|3000 SENSUS SONX3000|3000_G-MCF|
#|Gas - 3000|3000_ROCKWELL_3000|3000_G-MCF|
#|Gas - 3000|3000 SENSUS SONX3000|3000_G-CCFMV90|
#|Gas - 3000|3000_ROCKWELL_3000|3000_G-CCFMV90|
#|Gas - 38M Rotary AL|38-M_ROOTS_38-M|38-M_G-CCFMV90|
#|Gas - 38M Rotary AL|38-M_ROOTS_38-M|38-M_6-DIAL|
#|Gas - 38M Rotary AL|38-M_ROOTS_38-M|38-M_G-MCF|
#|Electric Type 3R - 120/480V 3W 1PH 200CL|3R_GE_KV2C|3R_E-MV90|

#|Water - 4 Inch|4 IN_Sen/Rock_Empire 6|4 IN_W-TYPICAL|
#|Water - 4 Inch|4 IN_SENSUS_PROPLR 4|4 IN_W-TYPICAL|
#|Water - 4 Inch|4 IN_SENSUS_OMNI T2|4 IN_W-TYPICAL|
#|Water - 4 Inch|4 IN_SENSUS_OMNI C2|4 IN_W-TYPICAL|
#|Water - 4 Inch|4 IN_BADGER_T1000|4 IN_W-TYPICAL|
#|Water - 4 Inch|4 IN_BADGER_T450|4 IN_W-TYPICAL|
#|Water - 4 Inch|4 IN_END+HAUS_PROMAG53|4 IN_W-TYPICAL|
#|Water - 4 Inch|4 IN_METRON_SPEC 260|4 IN_W-TYPICAL|
#|Water - 4 Inch|4 IN_METRON_SPEC 440|4 IN_W-TYPICAL|
#|Water - 4 Inch|4 IN_MSTRMTR_OCTAVE|4 IN_W-TYPICAL|
#|Water - 4 Inch|4 IN_SEN/ROCK_EMPIRE 6|4 IN_W-TYPICAL|

#|Water - 4 Inch|4 IN_SENSUS_EMPIRE 6|4 IN_W-TYPICAL|
#|Gas - 4 Turbo|4-T_ROOTS_7-M|4-T_6-DIAL|
#|Gas - 4 Turbo|4-T_ROCKWELL_4 TURBO|4-T_6-DIAL|
#|Gas - 4 Turbo|4-T_AMERICAN_4 TURBO|4-T_6-DIAL|
#|Gas - 4 Turbo|4-T_ROOTS_7-M|4-T_G-MCF|
#|Gas - 4 Turbo|4-T_ROCKWELL_4 TURBO|4-T_G-MCF|
#|Gas - 4 Turbo|4-T_AMERICAN_4 TURBO|4-T_G-MCF|
#|Gas - 4 Turbo|4-T_ROOTS_7-M|4-T_G-CCFMV90|
#|Gas - 4 Turbo|4-T_ROCKWELL_4 TURBO|4-T_G-CCFMV90|
#|Gas - 4 Turbo|4-T_AMERICAN_4 TURBO|4-T_G-CCFMV90|
#|Gas - 400 Diaphragm|400_SPRAGUE_400|400_4-DIAL|
#|Gas - 400 Diaphragm|400_SPRAGUE_400|400_G-CCFMV90|
#|Gas - 400 Diaphragm|400_SPRAGUE_400|400_G-MCF|
#|Gas - 425 Diaphragm|425_AMERICAN_425|425_G-CCFMV90|
#|Gas - 425 Diaphragm|425_AMERICAN_425|425_G-MCF|
#|Gas - 425 Diaphragm|425_AMERICAN_425|425_4-DIAL|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_DUNCAN_MQS|605-E-TYPICAL|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_DUNCAN_MS|605-E-TYPICAL|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_GE_I70S|605-E-TYPICAL|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_ITRON_C1SC|605-E-TYPICAL|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_LAN&GYR_ALF|605-E-TYPICAL|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_LAN&GYR_AX|605-E-TYPICAL|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_LAN&GYR_AXRE|605-E-TYPICAL|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_LAN&GYR_MX|605-E-TYPICAL|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_SANGAMO_J3S|605-E-TYPICAL|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_SANGAMO_J5S|605-E-TYPICAL|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_SCHLBRGR_CENTC1SC|605-E-TYPICAL|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_WESTHOUS_D3S|605-E-TYPICAL|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_WESTHOUS_D4S|605-E-TYPICAL|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_DUNCAN_MQS|5_AMR-E-NET|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_DUNCAN_MS|5_AMR-E-NET|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_GE_I70S|5_AMR-E-NET|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_ITRON_C1SC|5_AMR-E-NET|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_LAN&GYR_ALF|5_AMR-E-NET|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_LAN&GYR_AX|5_AMR-E-NET|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_LAN&GYR_AXRE|5_AMR-E-NET|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_LAN&GYR_MX|5_AMR-E-NET|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_SANGAMO_J3S|5_AMR-E-NET|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_SANGAMO_J5S|5_AMR-E-NET|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_SCHLBRGR_CENTC1SC|5_AMR-E-NET|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_WESTHOUS_D3S|5_AMR-E-NET|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_WESTHOUS_D4S|5_AMR-E-NET|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_DUNCAN_MQS|5_E-RES-TOU|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_DUNCAN_MS|5_E-RES-TOU|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_GE_I70S|5_E-RES-TOU|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_ITRON_C1SC|5_E-RES-TOU|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_LAN&GYR_ALF|5_E-RES-TOU|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_LAN&GYR_AX|5_E-RES-TOU|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_LAN&GYR_AXRE|5_E-RES-TOU|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_LAN&GYR_MX|5_E-RES-TOU|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_SANGAMO_J3S|5_E-RES-TOU|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_SANGAMO_J5S|5_E-RES-TOU|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_SCHLBRGR_CENTC1SC|5_E-RES-TOU|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_WESTHOUS_D3S|5_E-RES-TOU|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_WESTHOUS_D4S|5_E-RES-TOU|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_DUNCAN_MQS|5_E-TYPICAL|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_DUNCAN_MS|5_E-TYPICAL|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_GE_I70S|5_E-TYPICAL|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_ITRON_C1SC|5_E-TYPICAL|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_LAN&GYR_ALF|5_E-TYPICAL|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_LAN&GYR_AX|5_E-TYPICAL|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_LAN&GYR_AXRE|5_E-TYPICAL|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_LAN&GYR_MX|5_E-TYPICAL|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_SANGAMO_J3S|5_E-TYPICAL|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_SANGAMO_J5S|5_E-TYPICAL|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_SCHLBRGR_CENTC1SC|5_E-TYPICAL|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_WESTHOUS_D3S|5_E-TYPICAL|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_WESTHOUS_D4S|5_E-TYPICAL|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_DUNCAN_MQS|5_E-COM-TOU|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_DUNCAN_MS|5_E-COM-TOU|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_GE_I70S|5_E-COM-TOU|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_ITRON_C1SC|5_E-COM-TOU|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_LAN&GYR_ALF|5_E-COM-TOU|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_LAN&GYR_AX|5_E-COM-TOU|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_LAN&GYR_AXRE|5_E-COM-TOU|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_LAN&GYR_MX|5_E-COM-TOU|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_SANGAMO_J3S|5_E-COM-TOU|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_SANGAMO_J5S|5_E-COM-TOU|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_SCHLBRGR_CENTC1SC|5_E-COM-TOU|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_WESTHOUS_D3S|5_E-COM-TOU|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_WESTHOUS_D4S|5_E-COM-TOU|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_DUNCAN_MQS|5_E-RES-NET|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_DUNCAN_MS|5_E-RES-NET|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_GE_I70S|5_E-RES-NET|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_ITRON_C1SC|5_E-RES-NET|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_LAN&GYR_ALF|5_E-RES-NET|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_LAN&GYR_AX|5_E-RES-NET|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_LAN&GYR_AXRE|5_E-RES-NET|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_LAN&GYR_MX|5_E-RES-NET|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_SANGAMO_J3S|5_E-RES-NET|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_SANGAMO_J5S|5_E-RES-NET|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_SCHLBRGR_CENTC1SC|5_E-RES-NET|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_WESTHOUS_D3S|5_E-RES-NET|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_WESTHOUS_D4S|5_E-RES-NET|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_DUNCAN_MQS|5_AMR-E-ENRGYTOU|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_DUNCAN_MS|5_AMR-E-ENRGYTOU|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_GE_I70S|5_AMR-E-ENRGYTOU|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_ITRON_C1SC|5_AMR-E-ENRGYTOU|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_LAN&GYR_ALF|5_AMR-E-ENRGYTOU|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_LAN&GYR_AX|5_AMR-E-ENRGYTOU|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_LAN&GYR_AXRE|5_AMR-E-ENRGYTOU|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_LAN&GYR_MX|5_AMR-E-ENRGYTOU|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_SANGAMO_J3S|5_AMR-E-ENRGYTOU|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_SANGAMO_J5S|5_AMR-E-ENRGYTOU|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_SCHLBRGR_CENTC1SC|5_AMR-E-ENRGYTOU|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_WESTHOUS_D3S|5_AMR-E-ENRGYTOU|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_WESTHOUS_D4S|5_AMR-E-ENRGYTOU|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_DUNCAN_MQS|5_AMR-E-TYPICAL|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_DUNCAN_MS|5_AMR-E-TYPICAL|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_GE_I70S|5_AMR-E-TYPICAL|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_ITRON_C1SC|5_AMR-E-TYPICAL|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_LAN&GYR_ALF|5_AMR-E-TYPICAL|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_LAN&GYR_AX|5_AMR-E-TYPICAL|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_LAN&GYR_AXRE|5_AMR-E-TYPICAL|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_LAN&GYR_MX|5_AMR-E-TYPICAL|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_SANGAMO_J3S|5_AMR-E-TYPICAL|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_SANGAMO_J5S|5_AMR-E-TYPICAL|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_SCHLBRGR_CENTC1SC|5_AMR-E-TYPICAL|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_WESTHOUS_D3S|5_AMR-E-TYPICAL|
#|Electric Type 5 - 240V 3W 1PH 200CL|5_WESTHOUS_D4S|5_AMR-E-TYPICAL|
#|Gas - 5M Rotary AL|5-M_ROOTS_5-M|5-M_G-MCF|
#|Gas - 5M Rotary AL|5-M_ROOTS_5-M|5-M_G-CCFMV90|
#|Gas - 5M Rotary AL|5-M_ROOTS_5-M|5-M_5-DIAL|
#|Water - 5/8 Inch|5/8 IN_BADGER_ADE|5/8 IN_W-TYPICAL|
#|Gas - 5000 Diaphragm|5000_AMERICAN_5000|5000_G-MCF|
#|Gas - 5000 Diaphragm|5000_ROCKWELL_5000|5000_G-MCF|
#|Gas - 5000 Diaphragm|5000_AMERICAN_5000|5000_5-DIAL|
#|Gas - 5000 Diaphragm|5000_ROCKWELL_5000|5000_5-DIAL|
#|Gas - 5000 Diaphragm|5000_AMERICAN_5000|5000_G-CCFMV90|
#|Gas - 5000 Diaphragm|5000_ROCKWELL_5000|5000_G-CCFMV90|

#|Electric Type 52 - 240V 2W 1PH 20CL|52_LAN&GYR_AXRE|52_AMR-E-KVA|
#|Electric Type 52 - 240V 2W 1PH 20CL|52_ITRON_C1SC|52_AMR-E-KVA|
#|Electric Type 52 - 240V 2W 1PH 20CL|52_LAN&GYR_AX|52_AMR-E-TOUNET|
#|Electric Type 52 - 240V 2W 1PH 20CL|52_LAN&GYR_AXRE|52_AMR-E-TOUNET|
#|Electric Type 52 - 240V 2W 1PH 20CL|52_ITRON_C1SC|52_AMR-E-TOUNET|
#|Electric Type 52 - 240V 2W 1PH 20CL|52_LAN&GYR_AX|52_E-COM-KVA/NET|
#|Electric Type 52 - 240V 2W 1PH 20CL|52_LAN&GYR_AXRE|52_E-COM-KVA/NET|
#|Electric Type 52 - 240V 2W 1PH 20CL|52_ITRON_C1SC|52_E-COM-KVA/NET|
#|Electric Type 52 - 240V 2W 1PH 20CL|52_LAN&GYR_AX|52_E-RES-KVA/NET|
#|Electric Type 52 - 240V 2W 1PH 20CL|52_LAN&GYR_AXRE|52_E-RES-KVA/NET|
#|Electric Type 52 - 240V 2W 1PH 20CL|52_ITRON_C1SC|52_E-RES-KVA/NET|
#|Electric Type 52M - 240V 2W 1PH 20CL|52M_GE_KV2C|52M_AMR-E-KVA|
#|Electric Type 52M - 240V 2W 1PH 20CL|52M_LAN&GYR_S4X|52M_AMR-E-KVA|
#|Electric Type 52M - 240V 2W 1PH 20CL|52M_GE_KV2C|52M_AMR-E-TOUNET|
#|Electric Type 52M - 240V 2W 1PH 20CL|52M_LAN&GYR_S4X|52M_AMR-E-TOUNET|
#|Electric Type 52M - 240V 2W 1PH 20CL|52M_GE_KV2C|52M_E-RES-KVA/NET|
#|Electric Type 52M - 240V 2W 1PH 20CL|52M_LAN&GYR_S4X|52M_E-RES-KVA/NET|
#|Electric Type 52M - 240V 2W 1PH 20CL|52M_GE_KV2C|52M_E-COM-KVA/NET|
#|Electric Type 52M - 240V 2W 1PH 20CL|52M_LAN&GYR_S4X|52M_E-COM-KVA/NET|
#|Electric Type 55 - 120V 2W 1PH 20CL|55_LAN&GYR_AX|55_E-CAPBANK|
#|Electric Type 55 - 120V 2W 1PH 20CL|55_LAN&GYR_AXRE|55_E-CAPBANK|
#|Electric Type 5D - 240V 3W 1PH 200CL 2-Way Service Discon|5D_LAN&GYR_AXRE-SD|5D_E-COM-TOU|
#|Electric Type 5D - 240V 3W 1PH 200CL 2-Way Service Discon|5D_LAN&GYR_AXRE|5D_E-COM-TOU|
#|Electric Type 5D - 240V 3W 1PH 200CL 2-Way Service Discon|5D_LAN&GYR_AXSD|5D_E-COM-TOU|
#|Electric Type 5D - 240V 3W 1PH 200CL 2-Way Service Discon|5D_LAN&GYR_AXRE-SD|5D_AMR-E-ENRGYTOU|
#|Electric Type 5D - 240V 3W 1PH 200CL 2-Way Service Discon|5D_LAN&GYR_AXRE|5D_AMR-E-ENRGYTOU|
#|Electric Type 5D - 240V 3W 1PH 200CL 2-Way Service Discon|5D_LAN&GYR_AXSD|5D_AMR-E-ENRGYTOU|
#|Electric Type 5D - 240V 3W 1PH 200CL 2-Way Service Discon|5D_LAN&GYR_AXRE-SD|5D_AMR-E-TYPICAL|
#|Electric Type 5D - 240V 3W 1PH 200CL 2-Way Service Discon|5D_LAN&GYR_AXRE|5D_AMR-E-TYPICAL|
#|Electric Type 5D - 240V 3W 1PH 200CL 2-Way Service Discon|5D_LAN&GYR_AXSD|5D_AMR-E-TYPICAL|
#|Electric Type 5D - 240V 3W 1PH 200CL 2-Way Service Discon|5D_LAN&GYR_AXRE-SD|5D_E-TYPICAL|
#|Electric Type 5D - 240V 3W 1PH 200CL 2-Way Service Discon|5D_LAN&GYR_AXRE|5D_E-TYPICAL|
#|Electric Type 5D - 240V 3W 1PH 200CL 2-Way Service Discon|5D_LAN&GYR_AXSD|5D_E-TYPICAL|
#|Electric Type 5D - 240V 3W 1PH 200CL 2-Way Service Discon|5D_LAN&GYR_AXRE-SD|5D_AMR-E-NET|
#|Electric Type 5D - 240V 3W 1PH 200CL 2-Way Service Discon|5D_LAN&GYR_AXRE|5D_AMR-E-NET|
#|Electric Type 5D - 240V 3W 1PH 200CL 2-Way Service Discon|5D_LAN&GYR_AXSD|5D_AMR-E-NET|
#|Electric Type 5D - 240V 3W 1PH 200CL 2-Way Service Discon|5D_LAN&GYR_AXRE-SD|5D_E-RES-TOU|
#|Electric Type 5D - 240V 3W 1PH 200CL 2-Way Service Discon|5D_LAN&GYR_AXRE|5D_E-RES-TOU|
#|Electric Type 5D - 240V 3W 1PH 200CL 2-Way Service Discon|5D_LAN&GYR_AXSD|5D_E-RES-TOU|
#|Electric Type 5D - 240V 3W 1PH 200CL 2-Way Service Discon|5D_LAN&GYR_AXRE-SD|5D_E-RES-NET|
#|Electric Type 5D - 240V 3W 1PH 200CL 2-Way Service Discon|5D_LAN&GYR_AXRE|5D_E-RES-NET|
#|Electric Type 5D - 240V 3W 1PH 200CL 2-Way Service Discon|5D_LAN&GYR_AXSD|5D_E-RES-NET|
#|Electric Type 5E - 240V 3W 1PH 320CL|5E_LAN&GYR_ALF|5E_E-RES-NET|
#|Electric Type 5E - 240V 3W 1PH 320CL|5E_LAN&GYR_AXRE|5E_E-RES-NET|
#|Electric Type 5E - 240V 3W 1PH 320CL|5E_GE_I70S|5E_E-RES-NET|
#|Electric Type 5E - 240V 3W 1PH 320CL|5E_LAN&GYR_ALF|5E_E-TYPICAL|
#|Electric Type 5E - 240V 3W 1PH 320CL|5E_LAN&GYR_AXRE|5E_E-TYPICAL|
#|Electric Type 5E - 240V 3W 1PH 320CL|5E_GE_I70S|5E_E-TYPICAL|
#|Electric Type 5E - 240V 3W 1PH 320CL|5E_LAN&GYR_ALF|5E_E-COM-TOU|
#|Electric Type 5E - 240V 3W 1PH 320CL|5E_LAN&GYR_AXRE|5E_E-COM-TOU|
#|Electric Type 5E - 240V 3W 1PH 320CL|5E_GE_I70S|5E_E-COM-TOU|
#|Electric Type 5E - 240V 3W 1PH 320CL|5E_LAN&GYR_ALF|5E_AMR-E-TYPICAL|
#|Electric Type 5E - 240V 3W 1PH 320CL|5E_LAN&GYR_AXRE|5E_AMR-E-TYPICAL|
#|Electric Type 5E - 240V 3W 1PH 320CL|5E_GE_I70S|5E_AMR-E-TYPICAL|
#|Electric Type 5E - 240V 3W 1PH 320CL|5E_LAN&GYR_ALF|5E_E-RES-TOU|
#|Electric Type 5E - 240V 3W 1PH 320CL|5E_LAN&GYR_AXRE|5E_E-RES-TOU|
#|Electric Type 5E - 240V 3W 1PH 320CL|5E_GE_I70S|5E_E-RES-TOU|
#|Electric Type 5E - 240V 3W 1PH 320CL|5E_LAN&GYR_ALF|5E_AMR-E-NET|
#|Electric Type 5E - 240V 3W 1PH 320CL|5E_LAN&GYR_AXRE|5E_AMR-E-NET|
#|Electric Type 5E - 240V 3W 1PH 320CL|5E_GE_I70S|5E_AMR-E-NET|
#|Electric Type 5E - 240V 3W 1PH 320CL|5E_LAN&GYR_ALF|5E_AMR-E-ENRGYTOU|
#|Electric Type 5E - 240V 3W 1PH 320CL|5E_LAN&GYR_AXRE|5E_AMR-E-ENRGYTOU|
#|Electric Type 5E - 240V 3W 1PH 320CL|5E_GE_I70S|5E_AMR-E-ENRGYTOU|
#|Electric Type 5ED - 240V 3W 1PH 320CL 2-Way Service Discon|5ED_LAN&GYR_AXRE-SD|5ED_E-RES-NET|
#|Electric Type 5ED - 240V 3W 1PH 320CL 2-Way Service Discon|5ED_LAN&GYR_AXRE|5ED_E-RES-NET|
#|Electric Type 5ED - 240V 3W 1PH 320CL 2-Way Service Discon|5ED_LAN&GYR_AXRE-SD|5ED_E-RES-TOU|
#|Electric Type 5ED - 240V 3W 1PH 320CL 2-Way Service Discon|5ED_LAN&GYR_AXRE|5ED_E-RES-TOU|
#|Electric Type 5ED - 240V 3W 1PH 320CL 2-Way Service Discon|5ED_LAN&GYR_AXRE-SD|5ED_AMR-E-TYPICAL|
#|Electric Type 5ED - 240V 3W 1PH 320CL 2-Way Service Discon|5ED_LAN&GYR_AXRE|5ED_AMR-E-TYPICAL|
#|Electric Type 5ED - 240V 3W 1PH 320CL 2-Way Service Discon|5ED_LAN&GYR_AXRE-SD|5ED_E-TYPICAL|
#|Electric Type 5ED - 240V 3W 1PH 320CL 2-Way Service Discon|5ED_LAN&GYR_AXRE|5ED_E-TYPICAL|
#|Electric Type 5ED - 240V 3W 1PH 320CL 2-Way Service Discon|5ED_LAN&GYR_AXRE-SD|5ED_AMR-E-ENRGYTOU|
#|Electric Type 5ED - 240V 3W 1PH 320CL 2-Way Service Discon|5ED_LAN&GYR_AXRE|5ED_AMR-E-ENRGYTOU|
#|Electric Type 5ED - 240V 3W 1PH 320CL 2-Way Service Discon|5ED_LAN&GYR_AXRE-SD|5ED_E-COM-TOU|
#|Electric Type 5ED - 240V 3W 1PH 320CL 2-Way Service Discon|5ED_LAN&GYR_AXRE|5ED_E-COM-TOU|
#|Electric Type 5ED - 240V 3W 1PH 320CL 2-Way Service Discon|5ED_LAN&GYR_AXRE-SD|5ED_AMR-E-NET|
#|Electric Type 5ED - 240V 3W 1PH 320CL 2-Way Service Discon|5ED_LAN&GYR_AXRE|5ED_AMR-E-NET|
#|Electric Type 5EN - 240V 3W 1PH 320CL Programmed for Net|5EN_LAN&GYR_AX|5EN_E-RES-TOU|
#|Electric Type 5EN - 240V 3W 1PH 320CL Programmed for Net|5EN_LAN&GYR_AXRE-SD|5EN_E-RES-TOU|
#|Electric Type 5EN - 240V 3W 1PH 320CL Programmed for Net|5EN_LAN&GYR_AXSD|5EN_E-RES-TOU|
#|Electric Type 5EN - 240V 3W 1PH 320CL Programmed for Net|5EN_LAN&GYR_AX|5EN_E-RES-NET|
#|Electric Type 5EN - 240V 3W 1PH 320CL Programmed for Net|5EN_LAN&GYR_AXRE-SD|5EN_E-RES-NET|
#|Electric Type 5EN - 240V 3W 1PH 320CL Programmed for Net|5EN_LAN&GYR_AXSD|5EN_E-RES-NET|
#|Electric Type 5EN - 240V 3W 1PH 320CL Programmed for Net|5EN_LAN&GYR_AX|5EN_AMR-E-NET|
#|Electric Type 5EN - 240V 3W 1PH 320CL Programmed for Net|5EN_LAN&GYR_AXRE-SD|5EN_AMR-E-NET|
#|Electric Type 5EN - 240V 3W 1PH 320CL Programmed for Net|5EN_LAN&GYR_AXSD|5EN_AMR-E-NET|
#|Electric Type 5EN - 240V 3W 1PH 320CL Programmed for Net|5EN_LAN&GYR_AX|5EN_E-COM-TOU|
#|Electric Type 5EN - 240V 3W 1PH 320CL Programmed for Net|5EN_LAN&GYR_AXRE-SD|5EN_E-COM-TOU|
#|Electric Type 5EN - 240V 3W 1PH 320CL Programmed for Net|5EN_LAN&GYR_AXSD|5EN_E-COM-TOU|
#|Electric Type 5EN - 240V 3W 1PH 320CL Programmed for Net|5EN_LAN&GYR_AX|5EN_AMR-E-ENRGYTOU|
#|Electric Type 5EN - 240V 3W 1PH 320CL Programmed for Net|5EN_LAN&GYR_AXRE-SD|5EN_AMR-E-ENRGYTOU|
#|Electric Type 5EN - 240V 3W 1PH 320CL Programmed for Net|5EN_LAN&GYR_AXSD|5EN_AMR-E-ENRGYTOU|
#|Electric Type 5EN - 240V 3W 1PH 320CL Programmed for Net|5EN_LAN&GYR_AX|5EN_AMR-E-TYPICAL|
#|Electric Type 5EN - 240V 3W 1PH 320CL Programmed for Net|5EN_LAN&GYR_AXRE-SD|5EN_AMR-E-TYPICAL|
#|Electric Type 5EN - 240V 3W 1PH 320CL Programmed for Net|5EN_LAN&GYR_AXSD|5EN_AMR-E-TYPICAL|
#|Electric Type 5EN - 240V 3W 1PH 320CL Programmed for Net|5EN_LAN&GYR_AX|5EN_E-TYPICAL|
#|Electric Type 5EN - 240V 3W 1PH 320CL Programmed for Net|5EN_LAN&GYR_AXRE-SD|5EN_E-TYPICAL|
#|Electric Type 5EN - 240V 3W 1PH 320CL Programmed for Net|5EN_LAN&GYR_AXSD|5EN_E-TYPICAL|
#|Electric Type 5L - 240V 3W 1PH 200CL Prog for Load Profile|5L_LAN&GYR_AX|5L_E-RES-NET|
#|Electric Type 5L - 240V 3W 1PH 200CL Prog for Load Profile|5L_LAN&GYR_AXSD|5L_E-RES-NET|
#|Electric Type 5L - 240V 3W 1PH 200CL Prog for Load Profile|5L_LAN&GYR_AX|5L_AMR-E-ENRGYTOU|
#|Electric Type 5L - 240V 3W 1PH 200CL Prog for Load Profile|5L_LAN&GYR_AXSD|5L_AMR-E-ENRGYTOU|
#|Electric Type 5L - 240V 3W 1PH 200CL Prog for Load Profile|5L_LAN&GYR_AX|5L_E-COM-TOU|
#|Electric Type 5L - 240V 3W 1PH 200CL Prog for Load Profile|5L_LAN&GYR_AXSD|5L_E-COM-TOU|
#|Electric Type 5L - 240V 3W 1PH 200CL Prog for Load Profile|5L_LAN&GYR_AX|5L_E-TYPICAL|
#|Electric Type 5L - 240V 3W 1PH 200CL Prog for Load Profile|5L_LAN&GYR_AXSD|5L_E-TYPICAL|
#|Electric Type 5L - 240V 3W 1PH 200CL Prog for Load Profile|5L_LAN&GYR_AX|5L_AMR-E-NET|
#|Electric Type 5L - 240V 3W 1PH 200CL Prog for Load Profile|5L_LAN&GYR_AXSD|5L_AMR-E-NET|
#|Electric Type 5L - 240V 3W 1PH 200CL Prog for Load Profile|5L_LAN&GYR_AX|5L_E-RES-TOU|
#|Electric Type 5L - 240V 3W 1PH 200CL Prog for Load Profile|5L_LAN&GYR_AXSD|5L_E-RES-TOU|
#|Electric Type 5L - 240V 3W 1PH 200CL Prog for Load Profile|5L_LAN&GYR_AX|5L_AMR-E-TYPICAL|
#|Electric Type 5L - 240V 3W 1PH 200CL Prog for Load Profile|5L_LAN&GYR_AXSD|5L_AMR-E-TYPICAL|
#|Electric Type 5N - 240V 3W 1PH 200CL Programmed for Net|5N_LAN&GYR_AXSD|5N_AMR-E-ENRGYTOU|
#|Electric Type 5N - 240V 3W 1PH 200CL Programmed for Net|5N_LAN&GYR_AX|5N_AMR-E-ENRGYTOU|
#|Electric Type 5N - 240V 3W 1PH 200CL Programmed for Net|5N_LAN&GYR_AXRE-SD|5N_AMR-E-ENRGYTOU|
#|Electric Type 5N - 240V 3W 1PH 200CL Programmed for Net|5N_LAN&GYR_AXSD|5N_AMR-E-TYPICAL|
#|Electric Type 5N - 240V 3W 1PH 200CL Programmed for Net|5N_LAN&GYR_AX|5N_AMR-E-TYPICAL|
#|Electric Type 5N - 240V 3W 1PH 200CL Programmed for Net|5N_LAN&GYR_AXRE-SD|5N_AMR-E-TYPICAL|
#|Electric Type 5N - 240V 3W 1PH 200CL Programmed for Net|5N_LAN&GYR_AXSD|5N_E-RES-NET|
#|Electric Type 5N - 240V 3W 1PH 200CL Programmed for Net|5N_LAN&GYR_AX|5N_E-RES-NET|
#|Electric Type 5N - 240V 3W 1PH 200CL Programmed for Net|5N_LAN&GYR_AXRE-SD|5N_E-RES-NET|
#|Electric Type 5N - 240V 3W 1PH 200CL Programmed for Net|5N_LAN&GYR_AXSD|5N_E-COM-TOU|
#|Electric Type 5N - 240V 3W 1PH 200CL Programmed for Net|5N_LAN&GYR_AX|5N_E-COM-TOU|
#|Electric Type 5N - 240V 3W 1PH 200CL Programmed for Net|5N_LAN&GYR_AXRE-SD|5N_E-COM-TOU|
#|Electric Type 5N - 240V 3W 1PH 200CL Programmed for Net|5N_LAN&GYR_AXSD|5N_E-TYPICAL|
#|Electric Type 5N - 240V 3W 1PH 200CL Programmed for Net|5N_LAN&GYR_AX|5N_E-TYPICAL|
#|Electric Type 5N - 240V 3W 1PH 200CL Programmed for Net|5N_LAN&GYR_AXRE-SD|5N_E-TYPICAL|
#|Electric Type 5N - 240V 3W 1PH 200CL Programmed for Net|5N_LAN&GYR_AXSD|5N_E-RES-TOU|
#|Electric Type 5N - 240V 3W 1PH 200CL Programmed for Net|5N_LAN&GYR_AX|5N_E-RES-TOU|
#|Electric Type 5N - 240V 3W 1PH 200CL Programmed for Net|5N_LAN&GYR_AXRE-SD|5N_E-RES-TOU|
#|Electric Type 5N - 240V 3W 1PH 200CL Programmed for Net|5N_LAN&GYR_AXSD|5N_AMR-E-NET|
#|Electric Type 5N - 240V 3W 1PH 200CL Programmed for Net|5N_LAN&GYR_AX|5N_AMR-E-NET|
#|Electric Type 5N - 240V 3W 1PH 200CL Programmed for Net|5N_LAN&GYR_AXRE-SD|5N_AMR-E-NET|

#|Water - 6 Inch|6 IN_BADGER_ADE|6 IN_W-TYPICAL|
#|Water - 6 Inch|6 IN_BADGER_T2000|6 IN_W-TYPICAL|
#|Water - 6 Inch|6 IN_END+HAUS_PROMG53W|6 IN_W-TYPICAL|
#|Water - 6 Inch|6 IN_METRON_SPEC 260|6 IN_W-TYPICAL|
#|Water - 6 Inch|6 IN_METRON_SPEC 440|6 IN_W-TYPICAL|
#|Water - 6 Inch|6 IN_MSTRMTR_OCTAVE|6 IN_W-TYPICAL|
#|Water - 6 Inch|6 IN_SEN/ROCK_EMPIRE 6|6 IN_W-TYPICAL|
#|Water - 6 Inch|6 IN_SENSUS_EMPIRE 6|6 IN_W-TYPICAL|

#|Water - 6 Inch|6 IN_SENSUS_OMNI T2|6 IN_W-TYPICAL|
#|Water - 6 Inch|6 IN_SENSUS_PROPLR 6|6 IN_W-TYPICAL|
#|Water - 6 Inch|6 IN_SENSUS_W2000|6 IN_W-TYPICAL|
#|Gas - 6 Turbo|6-T_ROCKWELL_6 TURBO|6-T_G-MCF|
#|Gas - 6 Turbo|6-T_ROCKWELL_6 TURBO|6-T_6-DIAL|
#|Gas - 6 Turbo|6-T_ROCKWELL_6 TURBO|6-T_G-CCFMV90|

#|Electric Type 60 - 120/480V 3W 3PH 20CL|60_ITRON_SS3S1T|60_AMR-E-KVA|
#|Electric Type 60 - 120/480V 3W 3PH 20CL|60_ITRON_SS3S1T|60_E-RES-KVA/NET|
#|Electric Type 60 - 120/480V 3W 3PH 20CL|60_ITRON_SS3S1T|60_E-COM-KVA/NET|
#|Electric Type 60M - 120/480V 3W 3PH 20CL|60M_GE_KV2C|60M_AMR-E-KVA|
#|Electric Type 60M - 120/480V 3W 3PH 20CL|60M_LAN&GYR_S4X|60M_AMR-E-KVA|
#|Electric Type 60M - 120/480V 3W 3PH 20CL|60M_GE_KV2C|60M_AMR-E-TOUNET|
#|Electric Type 60M - 120/480V 3W 3PH 20CL|60M_LAN&GYR_S4X|60M_AMR-E-TOUNET|
#|Electric Type 60M - 120/480V 3W 3PH 20CL|60M_GE_KV2C|60M_E-RES-KVA/NET|
#|Electric Type 60M - 120/480V 3W 3PH 20CL|60M_LAN&GYR_S4X|60M_E-RES-KVA/NET|
#|Electric Type 60M - 120/480V 3W 3PH 20CL|60M_GE_KV2C|60M_E-COM-KVA/NET|
#|Electric Type 60M - 120/480V 3W 3PH 20CL|60M_LAN&GYR_S4X|60M_E-COM-KVA/NET|
#|Electric Type 60R - 120/480V 3W 3PH 20CL|60R_GE_KV2C|60R_E-MV90|
#|Gas - 630 Diaphragm|630_AMERICAN_630|630_4-DIAL|
#|Gas - 630 Diaphragm|630_AMERICAN_630|630_G-CCFMV90|
#|Gas - 630 Diaphragm|630_AMERICAN_630|630_G-MCF|
#|Gas - 7M Rotary AL|7-M_ROOTS_7-M|7-M_5-DIAL|
#|Gas - 7M Rotary AL|7-M_ROOTS_7-M|7-M_G-CCFMV90|
#|Gas - 7M Rotary AL|7-M_ROOTS_7-M|7-M_G-MCF|
#|Electric Type 71P - 120V 4W-Y 3PH 20CL|71P_ITRON_C1SC|71P_E-MV90|
#|Electric Type 71P - 120V 4W-Y 3PH 20CL|71P_GE_UNKE|71P_E-MV90|
#|Electric Type 71P - 120V 4W-Y 3PH 20CL|71P_GE_TMR92P|71P_E-MV90|

#|Electric Type 72 - 120/480V 4W-Y/D 3PH 20CL|72_ITRON_SS4S1T|72_AMR-E-KVA|
#|Electric Type 72 - 120/480V 4W-Y/D 3PH 20CL|72_GE_KV2C|72_AMR-E-TOUNET|
#|Electric Type 72 - 120/480V 4W-Y/D 3PH 20CL|72_ITRON_SS4S1T|72_AMR-E-TOUNET|
#|Electric Type 72 - 120/480V 4W-Y/D 3PH 20CL|72_GE_KV2C|72_E-RES-KVA/NET|
#|Electric Type 72 - 120/480V 4W-Y/D 3PH 20CL|72_ITRON_SS4S1T|72_E-RES-KVA/NET|
#|Electric Type 72 - 120/480V 4W-Y/D 3PH 20CL|72_GE_KV2C|72_E-COM-KVA/NET|
#|Electric Type 72 - 120/480V 4W-Y/D 3PH 20CL|72_ITRON_SS4S1T|72_E-COM-KVA/NET|
#|Electric Type 72M - 120/480V 4W-Y/D 3PH 20CL|72M_GE_KV2C|72M_AMR-E-TOUNET|
#|Electric Type 72M - 120/480V 4W-Y/D 3PH 20CL|72M_LAN&GYR_S4X|72M_AMR-E-TOUNET|
#|Electric Type 72M - 120/480V 4W-Y/D 3PH 20CL|72M_GE_KV2C|72M_AMR-E-KVA|
#|Electric Type 72M - 120/480V 4W-Y/D 3PH 20CL|72M_LAN&GYR_S4X|72M_AMR-E-KVA|
#|Electric Type 72M - 120/480V 4W-Y/D 3PH 20CL|72M_GE_KV2C|72M_E-RES-KVA/NET|
#|Electric Type 72M - 120/480V 4W-Y/D 3PH 20CL|72M_LAN&GYR_S4X|72M_E-RES-KVA/NET|
#|Electric Type 72M - 120/480V 4W-Y/D 3PH 20CL|72M_GE_KV2C|72M_E-COM-KVA/NET|
#|Electric Type 72M - 120/480V 4W-Y/D 3PH 20CL|72M_LAN&GYR_S4X|72M_E-COM-KVA/NET|
#|Electric Type 72R - 120/480V 4W-Y/D 3PH 20CL|72R_SCHWEITZ_SEL-734|72R_E-MV90|
#|Electric Type 72R - 120/480V 4W-Y/D 3PH 20CL|72R_GE_KV2C+|72R_E-MV90|
#|Electric Type 72R - 120/480V 4W-Y/D 3PH 20CL|72R_GE_KV2C|72R_E-MV90|
#|Electric Type 72R - 120/480V 4W-Y/D 3PH 20CL|72R_GE_KV2|72R_E-MV90|
#|Electric Type 72R - 120/480V 4W-Y/D 3PH 20CL|72R_AMETEK_JEMSTAR|72R_E-MV90|
#|Gas - 750 Diaphragm|750_ROCKWELL_750|750_4-DIAL|
#|Gas - 750 Diaphragm|750_ROCKWELL_750|750_G-MCF|
#|Gas - 750 Diaphragm|750_ROCKWELL_750|750_G-CCFMV90|

#|Water - 8 Inch|8 IN_SEN/ROCK_EMPIRE 6|8 IN_W-TYPICAL|
#|Water - 8 Inch|8 IN_SENSUS_EMPIRE 6|8 IN_W-TYPICAL|
#|Water - 8 Inch|8 IN_SENSUS_OMNI C2|8 IN_W-TYPICAL|
#|Water - 8 Inch|8 IN_SENSUS_OMNI T2|8 IN_W-TYPICAL|
#|Water - 8 Inch|8 IN_SENSUS_PROPLR 8|8 IN_W-TYPICAL|
#|Gas - 8 Turbo|8-T_AMERICAN_8 TURBO|8-T_G-CCFMV90|
#|Gas - 8 Turbo|8-T_ROCKWELL_8 TURBO|8-T_G-CCFMV90|
#|Gas - 8 Turbo|8-T_AMERICAN_8 TURBO|8-T_G-MCF|
#|Gas - 8 Turbo|8-T_ROCKWELL_8 TURBO|8-T_G-MCF|
#|Gas - 800 Diaphragm|800_AMERICAN_800|800_5-DIAL|
#|Gas - 800 Diaphragm|800_AMERICAN_800AC|800_5-DIAL|
#|Gas - 800 Diaphragm|800_SENSUS_SONX880|800_5-DIAL|
#|Gas - 800 Diaphragm|800_AMERICAN_800|800_G-CCFMV90|
#|Gas - 800 Diaphragm|800_AMERICAN_800AC|800_G-CCFMV90|
#|Gas - 800 Diaphragm|800_SENSUS_SONX880|800_G-CCFMV90|
#|Gas - 800 Diaphragm|800_AMERICAN_800|800_G-MCF|
#|Gas - 800 Diaphragm|800_AMERICAN_800AC|800_G-MCF|
#|Gas - 800 Diaphragm|800_SENSUS_SONX880|800_G-MCF|
#|Gas - Ultrasonic|880_DANIEL_ULTRA4|880_5-DIAL|
#|Gas - Ultrasonic|880_DANIEL_ULTRA8|880_5-DIAL|
#|Gas - Ultrasonic|880_SENSUS_SONX3000|880_5-DIAL|
#|Gas - Ultrasonic|880_SENSUS_SONX880|880_5-DIAL|
#|Gas - Ultrasonic|880_DANIEL_ULTRA4|880_G-CCFMV90|
#|Gas - Ultrasonic|880_DANIEL_ULTRA8|880_G-CCFMV90|
#|Gas - Ultrasonic|880_SENSUS_SONX3000|880_G-CCFMV90|
#|Gas - Ultrasonic|880_SENSUS_SONX880|880_G-CCFMV90|
#|Gas - Ultrasonic|880_DANIEL_ULTRA4|880_G-MCF|
#|Gas - Ultrasonic|880_DANIEL_ULTRA8|880_G-MCF|
#|Gas - Ultrasonic|880_SENSUS_SONX3000|880_G-MCF|
#|Gas - Ultrasonic|880_SENSUS_SONX880|880_G-MCF|
#|Electric AMI RF Module|ERF_LAN&GYR_ERF|Standard|
#|Electric AMI RF Module|1|Standard|
#|Electric AMI RF Module|11|Standard|
#|Electric AMI RF Module|ERF_LAN&GYR_ERF|Standard|
#|Electr