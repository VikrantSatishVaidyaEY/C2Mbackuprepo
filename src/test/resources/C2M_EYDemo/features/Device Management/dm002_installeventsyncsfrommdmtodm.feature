#####################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    		Reason:
# 2022-05-23	JLonga		Initial Version.
#
#####################################################################################

Feature: Install Event Syncs From MDM To ODM

  @DM002 @regression
  Scenario Outline: Verify if the created install event will syncs from MDM to ODM

    #Login C2M
    Given I navigate to C2M_HOME page
    When I enter credentials.user into input field c2m.username
    And I enter credentials.pass into input field c2m.password
    And I click on element c2m.sign_in

    #Go To Device Installation > Install Event > Add
    And I wait for 5 sec
    And I switch to frame frame.main_frame
    And element main.main_menu should be present
    And I click on element main.main_menu
    And element main.device_installation should be present
    And I click on element main.device_installation
    And element submenu.install_event should be present
    And I click on element submenu.install_event
    And I click element submenu.add

    #Switch to Add Install Event Page
    And I wait 10 seconds for element frame.ui_frame to display
    And I switch to frame frame.ui_frame

    #Populate Device Config id and SP Id and Click Ok
    And element installevent.dvc_cfg_id should be present
    And I enter "<DEVICE CONFIG ID>" into input field installevent.dvc_cfg_id
    And element installevent.sp_id should be present
    And I enter "<SP ID>" into input field installevent.sp_id
    And element installevent.ok_btn should be present
    And I click element installevent.ok_btn

    #Populate Install Datetime and Installation Constant
    And I wait for 10 sec
    And element installevent.install_date should be present
    And I enter "<INSTALL DATE>" into input field installevent.install_date
    And element installevent.install_constant should be present
    And I enter "<CONSTANT>" into input field installevent.install_constant
    And element installevent.save_btn should be present
    And I click element installevent.save_btn

    #Click Turn On button
    And I wait for 10 sec
    And I switch to main content
    And I wait for 3 sec
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I switch to frame frame.tabpage_zonemapframe1
    And element installevent.turn_on_btn should be present
    And I click element installevent.turn_on_btn

    #Click Connect button
    And I wait for 20 sec
    And I switch to main content
    And I wait for 3 sec
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I switch to frame frame.tabpage_zonemapframe1
    And element installevent.connect_btn should be present
    And I click element installevent.connect_btn

    #Populate Turn On Date and click Save
    And I wait for 10 sec
    And I switch to new window
    And element installevent.turn_on_date should be present
    And I enter "<TURN ON DATE>" into input field installevent.turn_on_date
    And element installevent.pop_ok_btn should be present
    And I click element installevent.pop_ok_btn
    And I switch to previous window

    #Go To 360 Search > Search By Device
    And I switch to main content
    And I wait for 5 sec
    And I switch to frame frame.main_frame
    And element main.main_menu should be present
    And I click on element main.main_menu
    And element main.threesixty_search should be present
    And I click on element main.threesixty_search
    And element submenu.search_by_device should be present
    And I click on element submenu.search_by_device

    #Search for Device's Badge Number
    And I switch to frame frame.tabpage_frame
    And element 360searchbydevicepage.search_identifiertype should be present
    And I select "<IDENTIFIER TYPE>" option by text from dropdown 360searchbydevicepage.search_identifiertype
    And element 360searchbydevicepage.search_identifiervalue should be present
    And I enter "<IDENTIFIER VALUE>" into input field 360searchbydevicepage.search_identifiervalue
    And element 360searchbydevicepage.search_device should be present
    And I click element 360searchbydevicepage.search_device
    And element 360searchbydevicepage.device_search should be present
    And I click element 360searchbydevicepage.device_search

    #Go To 360 Search > Search By Asset
    And I switch to main content
    And I wait for 5 sec
    And I switch to frame frame.main_frame
    And I click on element main.main_menu
    And I click on element main.asset_management
    And I click on element submenu.asset
    And I click on element submenu.search

    #Search for Asset
    And I switch to frame frame.tabpage_frame
    And element assetquerypage.search_by should be present
    And I select "<SEARCH BY>" option by text from dropdown assetquerypage.search_by
    And element assetquerypage.asset_id should be present
    And I enter "<ASSET ID>" into input field assetquerypage.asset_id
    And element assetquerypage.search_btn should be present
    And I click element assetquerypage.search_btn
    And element assetquerypage.asset_link should be present
    And I click element assetquerypage.asset_link

    #Validate Asset Disposition Status
    And I switch to main content
    And I wait for 3 sec
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I switch to frame frame.tabpage_zonemapframe1
    And element assetpage.asset_bo_status should be present
    And element assetpage.asset_bo_status should have attribute "text" with value "<STATUS>"

    #Logout C2M
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click element c2mlogout.english_system
    And I click element c2mlogout.logout
    #And I close browser

    Examples:
      |DEVICE CONFIG ID |SP ID        |INSTALL DATE  |CONSTANT |TURN ON DATE|IDENTIFIER TYPE |IDENTIFIER VALUE | SEARCH BY        | ASSET ID     | STATUS |
      #|972467772733     |436663612403 |05-31-2022    |1.000000 |05-31-2022  |Badge Number    |ET1-Test-005     | Asset Identifier | 741656491146 | Installed |
      |513830680650     |761688061929 |01-27-2023    |1.000000 |01-27-2023  |Badge Number    |BN2005     | Asset Identifier | 757081784959 | Installed |