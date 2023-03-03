#####################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    		Reason:
# 2022-05-30	CTongo		Initial Version.
#
#####################################################################################

Feature: Create Asset Water Device Type XXX Equipment

  @DM009 @regression
  Scenario Outline: Create Asset Water Device Type XXX Equipment

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
    And I wait 20 seconds for element assetpage.asset_spec to display
    And I select "<specification>" option by text from dropdown assetpage.asset_spec
    And I put Badge Number assetpage.asset_type_badge_number into the input field
    And I put Serial Number assetpage.asset_type_serial_number into the input field
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
    And I wait 10 seconds for element assetpage.asset_store_save_btn to display
    And I click element assetpage.asset_store_save_btn
    And I switch to previous window

#    #Go to Device
#    And I wait for 3 sec
#    And I switch to main content
#    And I switch to frame frame.main_frame
#    And I switch to frame frame.tabpage_frame
#    And I wait 10 seconds for element frame.tabpage_zonemapframe1 to display
#    And I switch to frame frame.tabpage_zonemapframe1
#    And I wait 10 seconds for element assetpage.asset_device to display
#    And I click element assetpage.asset_device

    #Logout C2M
    #Logout C2M
#    And I switch to main content
#    And I switch to frame frame.main_frame
#    And I wait 4 seconds for element c2mlogout.english_system to display
#    And I click element c2mlogout.english_system
#    And I wait 4 seconds for element c2mlogout.logout to display
#    And I click element c2mlogout.logout
#    And I close browser

    Examples:
      | assetType       | serviceLocation                   | specification       |
      | Water AMR Battery | East Service Center Warehouse,2910 Willamette Pl  | WBAT_UNKNOWN     |
      | Water - 1 Inch | East Service Center Warehouse,2910 Willamette Pl  | 1 IN_SENSUS_EMPIRE 6     |
      #| Water - 1 Inch | East Service Center Warehouse,2910 Willamette Pl  | 1 IN_SENSUS_W5500     |