######################################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    		Reason:
# 2022-12-05	PNaidu		Initial Version.
# 2022-03-06	VVaidya		Updated Script for AssetPage elements.


#  Please add a valid and existing Address, Date and Badge Number at the time of Script execution
#######################################################################################################


Feature: Activating a device and Starting Service
  @DemoTest
  Scenario Outline: Installing and activating the device

 #User is Logged In
    Given I navigate to C2M_HOME page
    When I enter credentials.c2meydemouser into input field c2m.username
    And I enter credentials.c2meydemopass into input field c2m.password
    And I click on element c2m.sign_in

 #Search for a device
    And I wait for 3 sec
    And I switch to frame frame.main_frame
    And I wait for 3 sec
    And I click on element main.main_menu
    And I wait 3 seconds for element main.asset_management to display
    And I click on element main.asset_management
    And element submenu.asset should be present
    And I click on element submenu.asset
    And I click element submenu.search

  #search asset by badge number
    And I wait for 3 sec
    #And I wait for 5 sec
    And I switch to frame frame.tabpage_frame
    And I wait 10 seconds for element assetquerypage.search_by to display
    And I select "<SearchBy>" option by text from dropdown assetquerypage.search_by
    And I enter "<badge_number>" into input field assetquerypage.badge_number
    And I click on element assetquerypage.search_btn
    And I wait for 5 sec
     #Go to the Asset
    And I click on element assetquerypage.asset_link
    And I wait for 6 sec
    #Make Asset 'In Store'
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I switch to frame frame.tabpage_zonemapframe1
    And element assetpage.asset_store should be present
    And I click on element assetpage.asset_store
    And I wait for 6 sec
    And I switch to main content
    And I wait for 6 sec
    And I switch to new window
    And I select "<serviceLocation>" option by text from dropdown assetpage.c2meydemoasset_service_location
    And I click on element assetpage.asset_store_save_btn
    And I switch to previous window

    #Search for the Asset
    And I wait for 4 sec
    And I switch to frame frame.main_frame
    And I wait for 3 sec
    And I click on element main.main_menu
    And I wait 3 seconds for element main.asset_management to display
    And I click on element main.asset_management
    And element submenu.asset should be present
    And I click on element submenu.asset
    And I click element submenu.search
    And I wait for 5 sec
    And I switch to frame frame.tabpage_frame
    And I wait 10 seconds for element assetquerypage.search_by to display
    And I select "<SearchBy>" option by text from dropdown assetquerypage.search_by
    And I enter "<badge_number>" into input field assetquerypage.badge_number
    And I click on element assetquerypage.search_btn
    And I wait for 5 sec
    And I click on element assetquerypage.asset_link
    And I wait for 5 sec
      #Go to Device tab
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabmenu_frame
    And I click on element devicepage.device_tab
    And I wait for 5 sec


    #Click on Device Configuration
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I wait for 10 sec
    And element devicepage.device_configuration should be present
    And I click element devicepage.device_configuration
    And I wait for 5 sec
    #Expand Record Information
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I wait for 5 sec
    And I wait 10 seconds for element frame.tabpage_zonemapframe1 to display
    And I switch to frame frame.tabpage_zonemapframe1
    And I click element assetpage.expand_record_information
    And I save the device configuration id
    And I wait for 3 sec
    #Click on Enter new Read and enter read details
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I wait for 5 sec
    And I click element deviceconfigurationpage.enter_new_read
    And I wait for 5 sec
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.ui_frame
    And I enter "0" into input field addmeterreaduipage.reading
    And I press "TAB" key into input field addmeterreaduipage.reading
    And I select "Regular" option by text from dropdown addmeterreaduipage.measurement_condition
    And I press "TAB" key into input field addmeterreaduipage.measurement_condition
    And I click element addmeterreaduipage.save_btn

    And I wait for 10 sec
    And I switch to main content
    And I switch to frame frame.main_frame
    And I wait for 3 sec
    And I click on element main.main_menu
    And element main.customer_information should be present
    And I click on element main.customer_information
    And element submenu.premise should be present
    And I click on element submenu.premise



    And I click element submenu.search
    And I wait for 5 sec
    And I switch to main content
    And I wait for 5 sec
    And I switch to new window
    And I enter "<address>" into input field premisepage.addpremise_address_details
    And I click on element premisepage.address_search

    And I switch to previous window
     #Go to Device Installation
    And I switch to main content
    And I wait for 5 sec
    And I switch to frame frame.main_frame
    And I wait for 3 sec
    And I click on element main.main_menu
    And element main.device_installation should be present
    And I click on element main.device_installation
     #Add install event
    And element submenu.go_to_install_event should be present
    And I click on element submenu.go_to_install_event
    And I click element submenu.add
    And I switch to main content
    And I wait for 3 sec
    And I switch to frame frame.main_frame
    And I switch to frame frame.ui_frame
    And I get the text from element <any> and store it in memory as <any> data
    And element installevent.dvc_cfg_id should be present
    And I enter saved configuration id into input element installevent.dvc_cfg_id
    #And I wait <number> seconds for element <string> to display
    #element installevent.ok_btn should be present
    And element installevent.ok_btn should be present
    And I wait for 3 sec
    And I click element installevent.ok_btn
    And I press "ENTER" key into input field installevent.ok_btn
    And I wait for 3 sec
    And I switch to main content
    And I wait for 3 sec
    And I switch to frame frame.main_frame
    And I switch to frame frame.ui_frame
#Enter Date as the Install date
    And element installevent.install_date should be present
    And I enter "<date>" into input field installevent.install_date
    And element installevent.install_constant should be present
    And I enter "1" into input field installevent.install_constant
    And element installevent.save_btn should be present
    And I click element installevent.save_btn
    And I wait for 10 sec
    And I switch to main content
    And I wait for 3 sec
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I switch to frame frame.tabpage_zonemapframe1
     #Turn on the install event and click OK
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I switch to frame frame.tabpage_zonemapframe1
    And element installevent.turn_on_btn should be present

    And I click element installevent.turn_on_btn
    And I wait for 3 sec
    And I switch to main content
    And I wait for 5 sec
    And I switch to new window
    And I wait for 5 sec
    And I click on element installevent.ok_btn
    And I switch to previous window
    #Go to Person from Main Menu and add a new person
    And I wait for 5 sec
    And I switch to frame frame.main_frame
    And I wait for 3 sec
    And I click on element main.main_menu
    And element main.customer_information should be present
    And I click on element main.customer_information
    And element submenu.person should be present
    And I click on element submenu.person
    And I click element submenu.add
    And I switch to main content
    And I switch to frame frame.main_frame
    And I wait for 3 sec
    And I switch to frame frame.tabpage_frame
    And I switch to frame frame.pername_frame
    And element personpage.per_name should be present
    And I enter "<PersonName>" into input field personpage.per_name

    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I switch to frame frame.percontact_frame
    And element personpage.per_contact_type should be present
    And I select "<ContactType>" option by text from dropdown personpage.per_contact_type
    And element personpage.per_contact_value should be present
    And I enter "<ContactValue>" into input field personpage.per_contact_value
    And I press "TAB" key into input field personpage.per_primary_sw
    And I check the checkbox personpage.per_primary_sw


    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I switch to frame frame.perid_frame
    And element personpage.per_id_type should be present
    And I select "<IdType>" option by text from dropdown personpage.per_id_type
    And element personpage.per_id_value should be present
    And I put random number into input field personpage.per_id_value


    And I switch to main content
    And I switch to frame frame.main_frame
    And I click element actionbuttons.save
    And I switch to frame frame.tabpage_frame

    And I enter "<date>" into input field startstoppage.startdate_service
    And I enter "<address>" into input field startstoppage.address_service
    And I press "TAB" key into input field startstoppage.address_service
    And I wait 10 seconds for element startstoppage.city_service to display
    And I enter "San Francisco" into input field startstoppage.city_service
    And I press "TAB" key into input field startstoppage.city_service
    And I click element startstoppage.start_service
    And I switch to main content
    And I wait for 3 sec
    And I switch to new window
    And I wait for 3 sec
    And I enter "ER-BASIC" into input field startstoppage.startopt_service

    And I click on element startstoppage.popup_start
    And I wait for 10 sec
    And I switch to previous window
    And I switch to main content

    And I wait for 10 sec
    And I switch to main content
    And I switch to frame frame.main_frame
    And I wait for 3 sec
    And I click on element main.main_menu
    And element main.customer_information should be present
    And I click on element main.customer_information
    And element submenu.premise should be present
    And I click on element submenu.premise

    And I click element submenu.search
    And I wait for 5 sec
    And I switch to main content
    And I wait for 5 sec
    And I switch to new window
    And I enter "<address>" into input field premisepage.addpremise_address_details

    And I click on element premisepage.address_search
    And I switch to previous window
    And I switch to main content

    And I switch to frame frame.main_frame
    And I wait for 5 sec
    And I switch to frame frame.dashboard
    And element frame.dashboard_zonemapframe202 should be present
    And I switch to frame frame.dashboard_zonemapframe202
    And I wait for 5 sec
    And the element premisepage.premise_tree_sa_link is displayed
    And I click element premisepage.premise_tree_sa_link
    And I wait for 10 sec
    And I switch to main content
    And I switch to frame frame.main_frame
    And I wait for 5 sec
    And I switch to frame frame.tabpage_frame
    And I wait for 5 sec
    And I click on element startstoppage.activate_sa

    And I wait for 10 sec

    And I switch to main content
    And I switch to frame frame.main_frame
    And I click element c2mlogout.english_system
    And I click element c2mlogout.logout
    #And I close browser
    And I quit browser
    


    Examples:
      | PersonName      | ContactType | ContactValue   | IdType               | badge_number     | SearchBy | serviceLocation |address| date|
      | Tester, Person | Home Phone  | 342-453-5435 | Social security number | NGTP116 | Asset Identifier | Pleasanton Satellite Storeroom,5815 Owens Drive |1 Crescent Way #1115 316|03-16-2023|