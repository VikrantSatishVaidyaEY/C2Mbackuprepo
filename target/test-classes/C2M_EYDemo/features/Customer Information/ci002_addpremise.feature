#####################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    		Reason:
# 2022-04-13	AThott		Initial Version.
#
#####################################################################################

Feature: Verify User can add Premise



  @CI002 @regression
  Scenario Outline: Verify User can add Premise

    #User is Logged In
    Given I navigate to C2M_HOME page
    When I enter credentials.user into input field c2m.username
    And I enter credentials.pass into input field c2m.password
    And I click on element c2m.sign_in

    #Add a Premise
    And I switch to frame frame.main_frame
    And I click on element main.main_menu
    And element main.customer_information should be present
    And I hover over element main.customer_information
   # And element submenu.premise_demo should be present
   # And I hover over element submenu.premise_demo
    And element submenu.premise should be present
    And I hover over element submenu.premise
    And I click element submenu.add

    #Switch to To Do Premise Page
    And element frame.tabpage_frame should be present
    And I switch to frame frame.tabpage_frame

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

    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabmenu_frame
    And I click on element premisepage.geo_data_tab
    And I wait for 3 sec
    And I switch to main content
    And I switch to frame frame.main_frame
   # And I switch to frame frame.tabmenu_frame
    And I switch to frame frame.tabpage_frame
    And I switch to frame frame.premise_geo_tab

    And I select "Parcel Number" option by text from dropdown premisepage.geo_data_dropdown
    And I press "TAB" key into input field premisepage.geo_data_dropdown
    And I enter "74839" into input field premisepage.parcelnumber

    #click on Save
    And I switch to main content
    And I switch to frame frame.main_frame
    Then I click element actionbuttons.save

    #Logout C2M
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click element c2mlogout.english_system
    And I click element c2mlogout.logout
    #And I close browser

#C2MDEMO
#    Examples:
#      | Premise Type                              | Premise_Zipcode | Cis Division | Premise_City | Premise_County | Premise_State |
#      | Apartment/Condo                           | 60601           | California   | Brooklyn     | ILLINOIS       | IL            |
#      | City Street                               | 60601           | California   | Brooklyn     | ILLINOIS       | IL            |
#      | Commercial                                | 60601           | California   | Brooklyn     | ILLINOIS       | IL            |
#      | Hospital, Urgent Care, Nursing Home, etc. | 60601           | California   | Brooklyn     | ILLINOIS       | IL            |
#      | Mobile Home                               | 60601           | California   | Brooklyn     | ILLINOIS       | IL            |
#      | Multi-family Housing                      | 60601           | California   | Brooklyn     | ILLINOIS       | IL            |
#      | Single-family Home                        | 60601           | California   | Brooklyn     | ILLINOIS       | IL            |
#      | Apartment/Condo                           | 60601           | Division 1   | Brooklyn     | ILLINOIS       | IL            |
#      | Apartment/Condo                           | 60601           | Division 2   | Brooklyn     | ILLINOIS       | IL            |
#      | City Street                               | 60601           | Division 1   | Brooklyn     | ILLINOIS       | IL            |
#      | City Street                               | 60601           | Division 2   | Brooklyn     | ILLINOIS       | IL            |
#      | Commercial                                | 60601           | Division 1   | Brooklyn     | ILLINOIS       | IL            |
#      | Commercial                                | 60601           | Division 2   | Brooklyn     | ILLINOIS       | IL            |
#      | Hospital, Urgent Care, Nursing Home, etc. | 60601           | Division 1   | Brooklyn     | ILLINOIS       | IL            |
#      | Hospital, Urgent Care, Nursing Home, etc. | 60601           | Division 2   | Brooklyn     | ILLINOIS       | IL            |
#      | Mobile Home                               | 60601           | Division 1   | Brooklyn     | ILLINOIS       | IL            |
#      | Mobile Home                               | 60601           | Division 2   | Brooklyn     | ILLINOIS       | IL            |
#      | Multi-family Housing                      | 60601           | Division 1   | Brooklyn     | ILLINOIS       | IL            |
#      | Multi-family Housing                      | 60601           | Division 2   | Brooklyn     | ILLINOIS       | IL            |
#      | Single-family Home                        | 60601           | Division 1   | Brooklyn     | ILLINOIS       | IL            |
#      | Single-family Home                        | 60601           | Division 2   | Brooklyn     | ILLINOIS       | IL            |

    #C2MDEV

    Examples:
      | Premise Type     | Premise_Zipcode | Cis Division                 | Premise_City | Premise_County | Premise_State |
      | Single Family    | 809151009       | Colorado Springs Utilities   | COLO SPGS     | EL PASO       | CO            |
