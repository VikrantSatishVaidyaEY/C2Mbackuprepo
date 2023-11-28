######################################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    		Reason:
# 2022-12-05	PNaidu		Initial Version.
# 2022-03-06	VVaidya		Updated Script for AssetPage elements.

#  Prerequisite- Please add a valid and existing Address and
#  Badge Number at the time of Script execution

#######################################################################################################


Feature: Creating End-to-End "V" Model including Starting and Stopping Service
  @DemoTest23
  Scenario Outline: Creating End-to-End "V" Model including Starting and Stopping Service

    #User is Logged In
    Given I navigate to C2M_HOME page
    When I enter credentials.user into input field c2m.username
    And I enter credentials.pass into input field c2m.password
    And I click on element c2m.sign_in

  #Go to Asset Management > Asset > Add
    And I wait for 5 sec
   # And I switch to frame frame.main_frame
    And I move to frame frame.main_frame
    And I wait 5 seconds for element main.main_menu to display
    And I click on element main.main_menu
    And I wait 10 seconds for element main.asset_management to display
    And I forcefully click on element main.asset_management
    And I wait 10 seconds for element submenu.asset to display
    And I click on element submenu.asset
    And I click on element submenu.add

    #Populate Asset Type and Location and click OK
   # And I switch to frame frame.ui_frame
    And I move to frame frame.ui_frame
    And I wait for 2 sec
    And I clear input field assetpage.asset_time
    And I wait for 2 sec
   # And I enter "12" into input field assetpage.asset_time
    And I wait for 2 sec
    And I press "TAB" key into input field assetpage.asset_time
    And I wait 10 seconds for element assetpage.asset_type to display
    And I select "<assetType>" option by text from dropdown assetpage.asset_type
    And I wait 10 seconds for element assetpage.asset_service_location to display
    And I select "Pleasanton Receiving,5805 Owens Dr." option by text from dropdown assetpage.asset_service_location
    And I click element assetpage.asset_ok_btn

    #Populate Required Add Asset Page and click OK
    And I wait 10 seconds for element assetpage.asset_spec to display
    And I select "Reliant Electric Digital" option by text from dropdown assetpage.asset_spec
    And I put badge number assetpage.asset_type_badge_number into the input field
    And I put serial number assetpage.asset_type_serial_number into the input field
    And I wait for 5 sec
#    And I select "1.0" option by text from dropdown assetpage.asset_type_metrology_firmware_version
#    And I select "1.0" option by text from dropdown assetpage.asset_type_nic_firmware_version
    And I select "Electric Manual Read - kWh - Scalar" option by text from dropdown assetpage.asset_type_measurement_configuration
    And I click element assetpage.asset_type_save_btn

    #Search for a device
    And I wait for 3 sec
    And I switch to main content
    And I move to frame frame.main_frame
    And I wait for 3 sec
    And I click on element main.main_menu
    And I wait 3 seconds for element main.asset_management to display
    And I click on element main.asset_management
    And element submenu.asset should be present
    And I click on element submenu.asset
    And I click element submenu.search

    #search asset by badge number
    And I wait for 3 sec
    And I move to frame frame.tabpage_frame
    And I wait 10 seconds for element assetquerypage.search_by to display
    And I select "<SearchBy>" option by text from dropdown assetquerypage.search_by

    #Enter Saved Badge Number here
    And I get "badgeNumber" text from saved results and enter to "assetquerypage.badge_number" input field
    And I click on element assetquerypage.search_btn
    And I wait for 5 sec

    #Go to the Asset
    And I click on element assetquerypage.asset_link
    And I wait for 6 sec

#
#    And I move to frame frame.tabpage_frame
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
#
#    #new code for asset attributes for gear ratio
#
#    And I move to frame frame.tabpage_frame
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
#
#    #new code for asset attributes for register ratio
#
#    And I move to frame frame.tabpage_frame
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

    #Make Asset 'In Store'

    And I move to frame frame.tabpage_zonemapframe1
    And element assetpage.asset_store should be present
    And I click on element assetpage.asset_store
    And I wait for 6 sec
    And I switch to main content
    And I wait for 6 sec
    And I switch to new window
    And I click on element assetpage.asset_store_save_btn
    And I switch to previous window

    #Search for the Asset
    And I wait for 4 sec
    And I move to frame frame.main_frame
    And I wait for 3 sec
    And I click on element main.main_menu
    And I wait 3 seconds for element main.asset_management to display
    And I click on element main.asset_management
    And element submenu.asset should be present
    And I click on element submenu.asset
    And I click element submenu.search
    And I wait for 5 sec
    And I move to frame frame.tabpage_frame
    And I wait 10 seconds for element assetquerypage.search_by to display
    And I select "<SearchBy>" option by text from dropdown assetquerypage.search_by
    And I get "badgeNumber" text from saved results and enter to "assetquerypage.badge_number" input field
    And I click on element assetquerypage.search_btn
    And I wait for 5 sec
    And I click on element assetquerypage.asset_link
    And I wait for 5 sec

    #Go to Device tab
    And I move to frame frame.tabmenu_frame
    And I click on element devicepage.device_tab
    And I wait for 5 sec

    #Click on Device Configuration

    And I move to frame frame.tabpage_frame
    And I wait for 10 sec

    And I click element devicepage.device_configuration
    And I wait for 5 sec

    #Expand Record Information

    And I move to frame frame.tabpage_frame
    And I wait for 5 sec
    And I wait 10 seconds for element frame.tabpage_zonemapframe1 to display
    And I move to frame frame.tabpage_zonemapframe1
    And I click element assetpage.expand_record_information
    And I save the device configuration id
    And I wait for 3 sec

    #Click on Enter new Read and enter read details

    And I move to frame frame.tabpage_frame
    And I wait for 5 sec
    And I click element deviceconfigurationpage.enter_new_read
    And I wait for 5 sec

    And I move to frame frame.ui_frame
    And I enter "1" into input field addmeterreaduipage.reading
    And I press "TAB" key into input field addmeterreaduipage.reading
    And I select "Regular" option by text from dropdown addmeterreaduipage.measurement_condition
    And I press "TAB" key into input field addmeterreaduipage.measurement_condition
    And I click element addmeterreaduipage.save_btn

    And I wait for 10 sec


    #Add a New Premise

    And I move to frame frame.main_frame
    And I click on element main.main_menu
    And element main.customer_information should be present
    And I hover over element main.customer_information
    And element submenu.premise should be present
    And I hover over element submenu.premise
    And I click element submenu.add

    #Switch to To Do Premise Page
    And element frame.tabpage_frame should be present


    And I move to frame frame.tabpage_frame
    #Populate Required Premise Page Values
    And I select "<Premise Type>" option by text from dropdown premisepage.addpremise_search_by_list
    And I enter "<Premise_Zipcode>" into input field premisepage.addpremise_zipcode_details
    And I press "TAB" key into input field premisepage.addpremise_zipcode_details
    And I select "<Cis Division>" option by text from dropdown premisepage.cis_division
    And I press "TAB" key into input field premisepage.cis_division
    And I put random address into input field premisepage.addpremise_address_details
    And I clear input field premisepage.addpremise_city_name
    And I enter "<Premise_City>" into input field premisepage.addpremise_city_name
    And I clear input field premisepage.addpremise_county_name
    And I enter "<Premise_County>" into input field premisepage.addpremise_county_name
    And I clear input field premisepage.addpremise_state_name
    And I enter "<Premise_State>" into input field premisepage.addpremise_state_name
    And I press "TAB" key into input field premisepage.addpremise_state_name
    And I wait for 20 sec

    And I move to frame frame.tabmenu_frame
    And I click on element premisepage.geo_data_tab
    And I wait for 3 sec

    And I move to frame frame.premise_geo_tab
    And I select "Parcel Number" option by text from dropdown premisepage.geo_data_dropdown
    And I press "TAB" key into input field premisepage.geo_data_dropdown
    And I enter "74839" into input field premisepage.parcelnumber

    #click on Save

    And I move to frame frame.main_frame
    Then I click element actionbuttons.save
    And I wait for 4 sec
    And I move to frame frame.tabpage_frame
    And I save premisepage.premise_id_search detail in variable "newPremise"

    And I switch to main content
     #Search a Premise
    And I move to frame frame.main_frame
    And I click on element main.main_menu
    And I wait 10 seconds for element main.customer_information to display
    And I hover over element main.customer_information
    And element submenu.premise should be present
    And I hover over element submenu.premise
    And I click element submenu.search

    #Switch to new Window
    And I wait for 3 sec
    And I switch to new window
    And I wait for 10 sec

    And element premisepage.premise_id_search should be present
    And I enter "newPremise" from test data in input field premisepage.premise_id_search
    And I click element premisepage.premise_id_search_btn

    #Switch to Previous Window
    And I wait for 3 sec
    And I switch to previous window
    And I wait for 10 sec

    #Premise Context Menu

    And I move to frame frame.tabpage_frame
    And I click element premisepage.premise_context_menu

    And I move to frame frame.main_frame
    And element context.premctx_gotosp should be present
    And I click element context.premctx_gotosp
    And I click element premisepage.add

    #Add Service point
    And I move to frame frame.ui_frame
    And element servicepointpage.select_type should be present
    And I select "<Service Point Type>" option by text from dropdown servicepointpage.select_type
    And I click element servicepointpage.ok
    And I select "<Measurement Cycle>" option by text from dropdown servicepointpage.measurement_cycle
    And I click element servicepointpage.save
    And I wait for 5 sec

     #Go to Device Installation
    And I wait for 3 sec
    And I move to frame frame.main_frame
    And I wait for 3 sec
    And I click on element main.main_menu
    And element main.device_installation should be present
    And I click on element main.device_installation
     #Add install event
    And element submenu.go_to_install_event should be present
    And I click on element submenu.go_to_install_event
    And I click element submenu.add

    And I wait for 3 sec
    And I move to frame frame.ui_frame
    And element installevent.dvc_cfg_id should be present
    And I enter saved configuration id into input element installevent.dvc_cfg_id

    And element installevent.ok_btn should be present
    And I wait for 3 sec
    And I click element installevent.ok_btn
    And I press "ENTER" key into input field installevent.ok_btn
    And I wait for 3 sec

    And I move to frame frame.ui_frame
#Enter Date as the Install date
    And I wait for 10 sec

    And I enter current time into the input field installevent.install_time
    And I wait for 3 sec
    And I press "TAB" key into input field installevent.install_time
    And I wait for 3 sec
    And element installevent.install_constant should be present
    And I enter "1" into input field installevent.install_constant
    And element installevent.save_btn should be present
    And I click element installevent.save_btn
    And I wait for 10 sec


#    And I move to frame frame.main_frame
#    And I wait for 3 sec
#    And I click on element main.main_menu
#    And element main.customer_information should be present
#    And I click on element main.customer_information
#    And element submenu.person should be present
#    And I click on element submenu.person
#    And I click element submenu.add
#
#
#    And I wait for 3 sec
#
#    And I move to frame frame.pername_frame
#    And element personpage.per_name should be present
#    And I enter "<PersonName>" into input field personpage.per_name
#
#    And I move to frame frame.percontact_frame
#    And element personpage.per_contact_type should be present
#    And I select "<ContactType>" option by text from dropdown personpage.per_contact_type
#    And element personpage.per_contact_value should be present
#    And I enter "<ContactValue>" into input field personpage.per_contact_value
#    And I press "TAB" key into input field personpage.per_primary_sw
#    And I check the checkbox personpage.per_primary_sw
#
#
#    And I move to frame frame.perid_frame
#    And element personpage.per_id_type should be present
#    And I select "<IdType>" option by text from dropdown personpage.per_id_type
#    And element personpage.per_id_value should be present
#    And I put random number into input field personpage.per_id_value
#
#
#    And I move to frame frame.main_frame
#    And I click element actionbuttons.save
#    And I move to frame frame.tabpage_frame
#
#
#    And I enter todays date into the input field startstoppage.startdate_service
#    And I get "createdPremise" text from saved results and enter to "startstoppage.address_service" input field
#    And I press "TAB" key into input field startstoppage.address_service
#    And I wait 10 seconds for element startstoppage.city_service to display
#    And I enter "COLO SPGS" into input field startstoppage.city_service
#    And I press "TAB" key into input field startstoppage.city_service
#    And I click element startstoppage.start_service
#    And I switch to main content
#    And I wait for 3 sec
#    And I switch to new window
#    And I wait for 3 sec
#
#    And I click on element startstoppage.popup_start
#    And I wait for 15 sec
#    And I switch to previous window
#
#    And I wait for 5 sec
#    And I move to frame frame.dashboard
#    And I click element controlcentral.account_context_menu
#    And I wait for 10 sec
#
#
#    And I move to frame frame.main_frame
#    And I click on element context.acctctx_gotosa
#    And I click element context.search
#    And I wait for 5 sec
#
#    And I move to frame frame.dashboard_zonemapframe201
#    And I click element dashboard.field_activity_alert
#    And I wait for 15 sec
#
#    #Switch to Main Tab
#    And I wait for 5 sec
#    And I move to frame frame.tabmenu_frame
#    And I click element tabs.main
#
#    And I move to frame frame.fa_action_panel_frame
#    And I click element fieldactivitypage.complete
#
#
##    #Go To Pending Start SA
#
#    And I wait for 5 sec
#    And I move to frame frame.dashboard_zonemapframe201
#    And I click element dashboard.pending_sa_alert
#
#    #Go to Pending Service Agreement Page
#
#    And I wait for 5 sec
#    And I move to frame frame.startstop_gridframe
#    And I click element startstoppage.sa_context_menu
#
#    And I move to frame frame.main_frame
#    And I click element context.sactx_gotosa
#
#    #Activate Service Agreement
#    And I wait for 3 sec
#
#    And I move to frame frame.tabpage_frame
#    And I click element serviceagreementpage.activate_sa
#
#    #Code to Stop SA
#
#    And I wait for 10 sec
#    And I click on element startstoppage.initiate_stop
#    And I wait for 3 sec
#    And I switch to new window
#    And I enter todays date into the input field startstoppage.end_date
#    And I click on element startstoppage.end_date_ok
#    And I wait for 3 sec
#    And I accept alert if it is displayed
#
#    And I switch to previous window
#
#    And I move to frame frame.tabpage_frame
#    And I click element startstoppage.stop_service_agreement
#
#    #Click on Refresh button
#
#    And I move to frame frame.main_frame
#    And I click on element dashboard.refresh_btn
#    And I wait for 5 sec
#
#     #Go to Pending Field Activity
#
#    And I move to frame frame.dashboard_zonemapframe201
#    And I click element dashboard.field_activity_alert
#    And I wait for 15 sec
#
#    #Switch to Main Tab
#
#    And I move to frame frame.tabmenu_frame
#    And I click element tabs.main
#
#    #Complete Field Activity
#
#    And I move to frame frame.fa_action_panel_frame
#    And I click element fieldactivitypage.complete
#
##    #Go To Pending Stop SA
#    And I wait for 3 sec
#    And I move to frame frame.dashboard_zonemapframe201
#    And I click element dashboard.pending_stop_alert
#
#    #Go to Pending Service Agreement Page
#    And I wait for 3 sec
#    And I move to frame frame.startstop_gridframe
#    And I click element startstoppage.sa_context_menu
#
#    And I wait for 3 sec
#    And I move to frame frame.main_frame
#    And I click element context.sactx_gotosa
#
#    #Stop Service Agreement
#    And I wait for 3 sec
#    And I move to frame frame.tabpage_frame
#    And I click element startstoppage.stop_service_agreement
#
#    #Logout from C2M
###    And I switch to main content
###    And I switch to frame frame.main_frame
###    And I click element c2mlogout.english_system
###    And I click element c2mlogout.logout
##    #And I quit browser
#
#

    Examples:
      | PersonName      | ContactType | ContactValue   | IdType               | badge_number     | SearchBy | serviceLocation |address| date|assetType|| Premise Type     | Premise_Zipcode | Cis Division                 | Premise_City | Premise_County | Premise_State | Service Point Type   | Measurement Cycle           |
      | Test, Vikrant | Home Phone  | 342-453-5435 | Social Security Number | NGTPTESTV1 | Asset Identifier | Pleasanton Satellite Storeroom,5815 Owens Drive |1 Crescent Way #1115 1731|05-03-2023|Electric Manual Read Meter - Digital|| Single Family    | 809151009       | Colorado Springs Utilities   | COLO SPGS     | EL PASO       | CO            |Electric Residential | Meter Read Cycle Number 01  |