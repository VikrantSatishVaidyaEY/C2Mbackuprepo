Feature: Add a new premise

  @CCBAddPremise @regression @ccb
  Scenario Outline: Add a new premise via traditional Premise +
    Given I navigate to CCB_HOME page
    And I wait for 3 sec
    When I enter credentials.user into input field c2m.username
    And I enter credentials.pass into input field c2m.password
    And I click element c2m.sign_in
    And I move to frame frame.main_frame
    And I enter "/add premise" into input field home.universal_search_bar
    And I click element home.first_search_result
    And I wait for 10 sec
    And I move to frame frame.tabpage_frame
    And I wait for 5 sec
    And I select "<residence>" option by text from dropdown premisepage.addpremise_search_by_list

    And I enter "<zipcode>" into input field premisepage.addpremise_zipcode_details

    And I click element premisepage.cis_division
    And I select "<state>" option by text from dropdown premisepage.cis_division
    And I click element premisepage.addpremise_address_details
    And I put random address into input field premisepage.addpremise_address_details
    And I click element premisepage.addpremise_city_name
    And I clear input field premisepage.addpremise_city_name
    And I enter "<city>" into input field premisepage.addpremise_city_name
    And I wait for 5 sec
    And I clear input field premisepage.addpremise_state_name
    And I enter "<state_code>" into input field premisepage.addpremise_state_name
    And I wait for 5 sec
    And I move to frame frame.tabmenu_frame
    And I wait 10 seconds for element premisepage.misc to display
    And I click on element premisepage.misc
    And I wait for 3 sec
    And I move to frame frame.tabpage_frame
    And I select "<trend_area>" option by text from dropdown premisepage.trend_area
    And I press "TAB" key into input field premisepage.trend_area
    And I wait for 5 sec
    And I move to frame frame.main_frame
    And I click element actionbuttons.save
    And I click element c2mlogout.english_system
    And I click element c2mlogout.logout


  @example
    Examples: 
      | residence       | zipcode | state      | city          | state_code | trend_area                |
      | Apartment/Condo | 98001   | California | San Francisco | CA         | San Francisco, California |