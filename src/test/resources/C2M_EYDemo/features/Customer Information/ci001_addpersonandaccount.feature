#####################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    		Reason:
# 2022-05-19	JLonga		Initial Version.
# 2022-06-09	AThott		Added code for generating random number for ssn
#####################################################################################

Feature: Verify User can add Person and Account



  @CI001 @regression
  Scenario Outline: Verify User can add Person and Account

    #User is Logged In
#    Then I enter todays date into input field c2m.username
    Given I navigate to C2M_HOME page
    And I wait for 10 sec
    When I enter credentials.user into input field c2m.username
    And I enter credentials.pass into input field c2m.password
    And I click on element c2m.sign_in

    And I wait for 10 sec
  # And I get the text from element credentials.c2meydemouser and store it in memory as "vikrant" data
 # And I retrieve text from element credentials.oracle and store it in memory as credentials.vikrant data
  #  And I retrieve credentials.vikrant data from memory and enter retrieved text into input field c2m.password
#    #Click Add Person Submenu
    And I wait for 5 sec
    And I switch to frame frame.main_frame
    And I wait for 3 sec
    And I click on element main.main_menu
    And element main.customer_information should be present
    And I click on element main.customer_information
    And element submenu.person should be present
    And I click on element submenu.person
    #Mapping for demo
#    And I click on element submenu.person_demo
    And I click element submenu.add

    #Fill in Person Name
    And I switch to main content
    And I switch to frame frame.main_frame
    And I wait for 3 sec
    And I switch to frame frame.tabpage_frame
    And I switch to frame frame.pername_frame
    And element personpage.per_name should be present
    And I enter "<PersonName>" into input field personpage.per_name

    #Fill in Person Contact Details
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

    #Fill in Person Id Details
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I switch to frame frame.perid_frame
    And element personpage.per_id_type should be present
    And I select "<IdType>" option by text from dropdown personpage.per_id_type
    And element personpage.per_id_value should be present
    And I put random number into input field personpage.per_id_value
    #And I enter "<IdValue>" into input field personpage.per_id_value

#    #Save the Person Records
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click element actionbuttons.save
#
#    # Logout C2M
#    And I switch to main content
#    And I switch to frame frame.main_frame
#    And I click element c2mlogout.english_system
#    And I click element c2mlogout.logout
#    #And I close browser
#    And I quit browser

    Examples:
      | PersonName      | ContactType | ContactValue   | IdType               | IdValue     |
      | Robinson,Matt | Home Phone  | 342-453-5435 | Social Security Number | 234-12-3249 |