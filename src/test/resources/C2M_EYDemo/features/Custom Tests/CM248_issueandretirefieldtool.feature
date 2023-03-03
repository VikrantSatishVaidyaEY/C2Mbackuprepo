#####################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    		Reason:
# 2022-08-31	VVaidya		Initial Version.
#
#####################################################################################

Feature: Issue an asset and then Retire a field tool

  @CM24804 @regression
  Scenario Outline: Issue an asset and then Retire a field tool

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


    #Transition Added Asset to 'In Store' status
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

#    # Change Asset disposition to 'ISSUED'
#    And I switch to main content
#    And I wait for 5 sec
#    And I switch to frame frame.main_frame
#    And I wait for 5 sec
#    And I switch to frame frame.tabpage_frame
#    And I wait for 5 sec
#    And I switch to frame frame.tabpage_zonemapframe1
#    And I wait 4 seconds for element assetpage.asset_issued to display
#    And I click on element assetpage.asset_issued
#    And I wait for 5 sec
#    And I switch to main content
#    And I wait for 7 sec
#    And I switch to new window
#    And I wait 5 seconds for element assetpage.outofservicelocation to display
#    And I select "<outofservicelocation>" option by text from dropdown assetpage.outofservicelocation
#    And I wait 10 seconds for element assetpage.asset_store_save_btn to display
#    And I click element assetpage.asset_store_save_btn
#    And I switch to previous window
#
#    #Transition Asset Back to 'In Store' status
#    And I switch to main content
#    And I switch to frame frame.main_frame
#    And I switch to frame frame.tabpage_frame
#    And I wait for 5 sec
#    And I wait 10 seconds for element frame.tabpage_zonemapframe1 to display
#    And I switch to frame frame.tabpage_zonemapframe1
#    And I wait 10 seconds for element assetpage.asset_store to display
#    And I click element assetpage.asset_store
#    And I switch to main content
#    And I wait for 7 sec
#    And I switch to new window
#    And I wait 10 seconds for element assetpage.asset_store_save_btn to display
#    And I click element assetpage.asset_store_save_btn
#    And I switch to previous window

    #Change the Asset Disposition to 'Retire'
    And I switch to main content
    And I wait for 5 sec
    And I switch to frame frame.main_frame
    And I wait for 5 sec
    And I switch to frame frame.tabpage_frame
    And I wait for 5 sec
    And I switch to frame frame.tabpage_zonemapframe1
    And I wait 4 seconds for element assetpage.retire_asset to display
    And I click on element assetpage.retire_asset
    And I wait for 5 sec
    And I switch to main content
    And I switch to new window
    And I wait 5 seconds for element assetpage.failure_dropdown to display
    And I select "<failure>" option by text from dropdown assetpage.failure_dropdown
    And I wait 10 seconds for element assetpage.asset_store_save_btn to display
    And I click element assetpage.asset_store_save_btn
    And I switch to previous window

    #Logout C2M
#    And I switch to main content
#    And I switch to frame frame.main_frame
#    And I click element c2mlogout.english_system
#    And I click element c2mlogout.logout
 #   And I close browser

    Examples:
      |date	     |time	    |assetType	    |serviceLocation	                                |specification	        |outofservicelocation|failure|
      |08-06-2022|06:00:00	|Comms Adapter	|East Service Center Warehouse,2910 Willamette Pl	|COMADPT_LAN&GYR_26-1742|  EM04                |  Yes |
