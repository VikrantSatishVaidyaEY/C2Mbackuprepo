#####################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    		Reason:
# 2022-06-07	CTongo		Initial Version.
#
#####################################################################################

Feature: Update Asset Location

  @MTR005 @regression
  Scenario Outline: Update Asset Location

    #Login C2M
    Given I navigate to C2M_HOME page
    When I enter credentials.user into input field c2m.username
    And I enter credentials.pass into input field c2m.password
    And I click on element c2m.sign_in

    #Go to Asset Management > Asset > Search
    And I wait for 5 sec
    And I switch to frame frame.main_frame
    And I click on element main.main_menu
    And I wait 10 seconds for element main.asset_management to display
    And I click on element main.asset_management
    And I wait 10 seconds for element submenu.asset to display
    And I click on element submenu.asset
    And I click on element submenu.search

    #Search for Asset
    And I wait for 5 sec
    And I switch to frame frame.tabpage_frame
    And element assetquerypage.search_by should be present
    And I select "<searchBy>" option by text from dropdown assetquerypage.search_by
   # And element assetquerypage.asset_id should be present
    And I enter "<assetId>" into input field assetquerypage.asset_id
    And element assetquerypage.search_btn should be present
    And I click element assetquerypage.search_btn
    And element assetquerypage.asset_link should be present
    And I click element assetquerypage.asset_link

    #Update Asset Location
    And I wait for 5 sec
    And I switch to frame frame.tabpage_zonemapframe1
    And element assetpage.asset_change_location_btn should be present
    And I click element assetpage.asset_change_location_btn
    And I wait for 10 sec
    And I switch to new window
    And I wait for 5 sec
    And I switch to main content
    And element assetpage.asset_store_new_location should be present
    And I select "<newServiceLocation>" option by text from dropdown assetpage.asset_store_new_location
    And element assetpage.asset_store_save_btn should be present
    And I click element assetpage.asset_store_save_btn
    And I wait for 3 sec
    And I switch to previous window
    And I wait for 5 sec

    #Logout C2M
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click element c2mlogout.english_system
    And I click element c2mlogout.logout
   # And I close browser

    Examples:
      | searchBy         | assetId | newServiceLocation                                 |
    #C2MDEV  | Asset Identifier | 319964972973 | For Testing Only - East Service Center Warehouse,For Testing Only - 2910 Willamette Pl |
    #  | Asset Identifier | 651211000000 | East Service Center Warehouse,2910 Willamette Pl |
    #C2MTEST  | Asset Identifier | 651211000000 | EM04 |
      | Asset Identifier | 651211000000 | EM04 |