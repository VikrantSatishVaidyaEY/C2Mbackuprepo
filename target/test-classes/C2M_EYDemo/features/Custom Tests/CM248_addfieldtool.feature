#####################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    		Reason:
# 2022-08-19	AThott		Initial Version.
#
#####################################################################################

Feature: Add a field tool

  @CM24801 @regression
  Scenario Outline: Add a field tool

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
    #And I select "<specification>" option by text from dropdown assetpage.asset_spec

     #Populate Required Add Asset Page and click OK
   And I wait 10 seconds for element assetpage.asset_spec to display
    And I select "<specification>" option by text from dropdown assetpage.asset_spec

    And I put badge number assetpage.asset_type_badge_number into the input field
    And I put serial number assetpage.asset_type_serial_number into the input field
    #And I put Serial Number assetpage.asset_type_serial_number into the input field
   # And I select "1.0" option by text from dropdown assetpage.asset_type_metrology_firmware_version
    #And I select "1.0" option by text from dropdown assetpage.asset_type_nic_firmware_version
    #And I select "<measurementConfiguration>" option by text from dropdown assetpage.asset_type_measurement_configuration
    And I click element assetpage.asset_type_save_btn


    #Logout C2M
#    And I switch to main content
#    And I switch to frame frame.main_frame
#    And I click element c2mlogout.english_system
#    And I click element c2mlogout.logout
#    And I close browser

    Examples:
      |date	     |time	    |assetType	    |serviceLocation	                                |specification	        |measurementConfiguration|
      |08-06-2022|06:00:00	|Comms Adapter	|East Service Center Warehouse,2910 Willamette Pl	|COMADPT_LAN&GYR_26-1742|                      |
