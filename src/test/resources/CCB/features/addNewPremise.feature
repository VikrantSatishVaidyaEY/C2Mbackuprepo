Feature: Add a new premise

  @CCBAddPremise @regression @ccbpremise
  Scenario Outline: Add a new premise via traditional Premise +

    #User is Logged In
    Given I navigate to CCB_HOME page
    And I wait for 3 sec
    When I enter credentials.user into input field c2m.username
    And I enter credentials.pass into input field c2m.password
    And I click element c2m.sign_in

    #Click on Person + to load Person details page
    And I move to frame frame.main_frame
    And I enter "/add premise" into input field home.universal_search_bar
    And I click element home.first_search_result
    And I wait for 10 sec

    #Populate details on premise page
    And I move to frame frame.tabpage_frame

    #Populate Required Premise Page Values
    And I select "Apartment/Condo" option by text from dropdown premisepage.addpremise_search_by_list
    And I enter "78001" into input field premisepage.addpremise_zipcode_details
    And I press "TAB" key into input field premisepage.addpremise_zipcode_details
    And I select "California" option by text from dropdown premisepage.cis_division
    And I press "TAB" key into input field premisepage.cis_division
    And I put random address into input field premisepage.addpremise_address_details
    And I clear input field premisepage.addpremise_city_name
    And I enter "San Francisco" into input field premisepage.addpremise_city_name
    And I clear input field premisepage.addpremise_state_name
    And I enter "CA" into input field premisepage.addpremise_state_name


    And I move to frame frame.tabmenu_frame
    And I wait 10 seconds for element premisepage.misc to display
    And I click on element premisepage.misc
    And I wait for 3 sec
    And I move to frame frame.tabpage_frame
    And I select "San Francisco, California" option by text from dropdown premisepage.trend_area
    And I wait for 5 sec

    And I move to frame frame.main_frame
    And I click element actionbuttons.save

    # Logout C2M
    And I click element c2mlogout.english_system
    And I click element c2mlogout.logout

    Examples:
      | PersonName    | ContactType | ContactValue | IdType                 | IdValue     |
      | Robinson,Matt | Home Phone  | 342-453-5435 | Social Security Number | 234-12-3249 |