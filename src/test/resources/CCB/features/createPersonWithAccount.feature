Feature: Create Person with Account and Start Service Enabled

  @CCBAddPerson @regression @ccbperson
  Scenario Outline: Create Person with Account and Start Service Enabled

    #User is Logged In
    Given I navigate to CCB_HOME page
    And I wait for 3 sec
    When I enter credentials.user into input field c2m.username
    And I enter credentials.pass into input field c2m.password
    And I click element c2m.sign_in

    #Click on Person + to load Person details page
    And I wait for 10 sec
    And I move to frame frame.dashboard
    And I wait for 3 sec
    And I click element home.add_person
    And I wait for 3 sec
    #Populate details on person page
    And I move to frame frame.tabpage_frame
    And I select "Person" option by text from dropdown personpage.per_business_flg
    And I move to frame frame.pername_frame
    And I select "Primary" option by text from dropdown personpage.nametype_dropdown
    And I enter "Hayden,Matthew" into input field personpage.per_name
    And I move to frame frame.percontact_frame
    And I select "Cell Phone" option by text from dropdown personpage.per_contact_type
    And I enter "353-264-7834" into input field personpage.per_contact_value
    And I move to frame frame.per_contact_detl
    And I click element personpage.per_primary_sw
    And I move to frame frame.perid_frame
    And I select "Social security number" option by text from dropdown personpage.per_id_type
    And I put random number into input field personpage.per_id_value
    And I move to frame frame.tabpage_frame
    And checkbox home.start_service_checkbox should be checked
    And I move to frame frame.main_frame
    And I click element actionbuttons.save

    And I wait for 6 sec
    # Logout C2M
    And I click element c2mlogout.english_system
    And I click element c2mlogout.logout

    Examples:
      | PersonName    | ContactType | ContactValue | IdType                 | IdValue     |
      | Robinson,Matt | Home Phone  | 342-453-5435 | Social Security Number | 234-12-3249 |