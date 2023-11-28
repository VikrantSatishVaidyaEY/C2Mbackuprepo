Feature: Create Person with Account and Start Service Enabled

  @CCB001 @regression
  Scenario Outline: Create Person with Account and Start Service Enabled

    #User is Logged In
#    Then I enter todays date into input field c2m.username
    Given I navigate to CCB_HOME page
    And I wait for 10 sec
    When I enter credentials.user into input field c2m.username
    And I enter credentials.pass into input field c2m.password
    And I click on element c2m.sign_in

    And I wait for 10 sec
#    #Click Add Person Submenu
    And I move to frame frame.dashboard
    And I wait for 3 sec
    And I click on element home.add_person

    #Populate details on person page
    And I select "Person" option by text from dropdown personpage.per_business_flg
    And I move to frame frame.pername_frame
    And I select "Primary" option by text from dropdown personpage.nametype_dropdown
    And I enter "CCB_John" into input field personpage.per_name
    And I move to frame frame.percontact_frame
    And I select "Cell Phone" option by text from dropdown personpage.per_contact_type
    And I enter "738-264-4725" into input field personpage.per_contact_value
    And I check the checkbox personpage.per_primary_sw
    And I move to frame frame.perid_frame
    And I select "Social security number" option by text from dropdown personpage.per_id_type
    #And I enter "163-43-4562" into input field personpage.per_id_value
   And I put random number into input field personpage.per_id_value

    And checkbox home.start_service_checkbox should be checked
#    And I switch to main content
#    And I switch to frame frame.main_frame
#    And I switch to frame frame.tabpage_frame
#    And I select "<Customer_Class>" option by text from dropdown personpage.per_customer_class

#    #Fill in Person Name
#    And I switch to main content
#    And I switch to frame frame.main_frame
#    And I wait for 3 sec
#    And I switch to frame frame.tabpage_frame
#    And I switch to frame frame.pername_frame
#    And element personpage.per_name should be present
#    And I enter "<PersonName>" into input field personpage.per_name
#
#    #Fill in Person Contact Details
#    And I switch to main content
#    And I switch to frame frame.main_frame
#    And I switch to frame frame.tabpage_frame
#    And I switch to frame frame.percontact_frame
#    And element personpage.per_contact_type should be present
#    And I select "<ContactType>" option by text from dropdown personpage.per_contact_type
#    And element personpage.per_contact_value should be present
#    And I enter "<ContactValue>" into input field personpage.per_contact_value
#    And I press "TAB" key into input field personpage.per_primary_sw
#    And I check the checkbox personpage.per_primary_sw
#
#    #Fill in Person Id Details
#    And I switch to main content
#    And I switch to frame frame.main_frame
#    And I switch to frame frame.tabpage_frame
#    And I switch to frame frame.perid_frame
#    And element personpage.per_id_type should be present
#    And I select "<IdType>" option by text from dropdown personpage.per_id_type
#    And element personpage.per_id_value should be present
#    And I put random number into input field personpage.per_id_value
#    #And I enter "<IdValue>" into input field personpage.per_id_value

##    #Save the Person Records
#    And I switch to main content
#    And I switch to frame frame.main_frame
#    And I click element actionbuttons.save
##
#    # Logout C2M
#    And I switch to main content
#    And I switch to frame frame.main_frame
#    And I click element c2mlogout.english_system
#    And I click element c2mlogout.logout
#    #And I close browser
#    And I quit browser

    Examples:
      | PersonName    | ContactType | ContactValue | IdType                 | IdValue     |
      | Robinson,Matt | Home Phone  | 342-453-5435 | Social Security Number | 234-12-3249 |