Feature: Create Person with Account and Start Service Enabled

  @CCBAddPerson @regression @ccb
  Scenario Outline: Create Person with Account and Start Service Enabled
    Given I navigate to CCB_HOME page
    And I wait for 3 sec
    When I enter credentials.user into input field c2m.username
    And I enter credentials.pass into input field c2m.password
    And I click element c2m.sign_in
    And I wait for 10 sec
    And I move to frame frame.dashboard
    And I wait for 3 sec
    And I click element home.add_person
    And I wait for 3 sec
    And I move to frame frame.tabpage_frame
    And I select "<person_or_business>" option by text from dropdown personpage.per_business_flg
    And I move to frame frame.pername_frame
    And I select "<name_type>" option by text from dropdown personpage.nametype_dropdown
    And I enter "<name>" into input field personpage.per_name
    And I move to frame frame.percontact_frame
    And I select "<contact_type>" option by text from dropdown personpage.per_contact_type
    And I enter "<phone_number>" into input field personpage.per_contact_value
    And I check checkbox "personpage.per_primary_sw" using javascript or action builder
    And I move to frame frame.per_contact_detl
    And I move to frame frame.perid_frame
    And I select "<id_type>" option by text from dropdown personpage.per_id_type
    And I put random number into input field personpage.per_id_value
    And I press "TAB" key into input field personpage.per_id_value
    And I move to frame frame.tabpage_frame
    And checkbox home.start_service_checkbox should be checked
    And I move to frame frame.main_frame
    And I click element actionbuttons.save
    And I wait for 6 sec
    And I click element c2mlogout.english_system
    And I click element c2mlogout.logout

  @example
    Examples: 
      | person_or_business | name_type | name           | contact_type | phone_number   | id_type                |
      | Person             | Primary   | Harris, Calvin | Cell Phone   | (541) 168-4679 | Social security number |