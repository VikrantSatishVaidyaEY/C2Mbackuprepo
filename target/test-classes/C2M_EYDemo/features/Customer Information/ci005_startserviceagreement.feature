#####################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    	   Reason:
# 2022-05-27	AThott	   Initial Version.
#
#####################################################################################

Feature: Verify User is able to Start a Service Agreement via process flow page



  @CI005 @regression
  Scenario Outline: Verify User is able to Start a Service Agreement via process flow page

    #User is Logged In
    Given I navigate to C2M_HOME page
    When I enter credentials.user into input field c2m.username
    And I enter credentials.pass into input field c2m.password
    And I click on element c2m.sign_in


     #Switch to Control Central Search Page
    And I switch to frame frame.main_frame
    And I click on element main.main_menu
    And element main.control_central should be present
    And I click element main.control_central
    And element frame.tabpage_frame should be present
    And I switch to frame frame.tabpage_frame

     #Populate Required Control Central Search Page Values
    And I select "<SEARCH BY>" option by text from dropdown controlcentralsearch.search_by
    And element controlcentralsearch.account_id should be present
    And I enter "<ACCOUNT ID>" into input field controlcentralsearch.account_id
    And I select "<CIS DIVISION>" option by text from dropdown controlcentralsearch.cis_division
    And I click element controlcentralsearch.search

    #Switch to Control Central Page
    And element frame.tabpage_zonemapframe1 should be present
    And I switch to frame frame.tabpage_zonemapframe1
    And I click element controlcentral.moving_service
    And I click element controlcentral.start_service

    #Switch to process Page
    And I enter "<PREMISE ID>" into input field processpage.premise_id
    And I click element processpage.premiseid_search
    And I select radio button processpage.enable_address
    And I click element processpage.next
    And I click element processpage.continue
    And I click element processpage.check_deposit_requirement
    And I click element processpage.next
    And I enter "<START DATE>" into input field processpage.start_date
    And I enter "<REQUESTED BY>" into input field processpage.requested_by
    And I enter "<PREMISE FIELD NOTED>" into input field processpage.premise_field_notes
    And I click element processpage.next
    And I select "<PERSON CONTACT TYPE>" option by text from dropdown processpage.person_contact_type
    And I enter "<CONTACT INFORMATION>" into input field processpage.contact_information
    And I enter "<COMMENT>" into input field processpage.comment
    And I click element processpage.next
    And I click element processpage.finish

    #Logout C2M
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click element c2mlogout.english_system
    And I click element c2mlogout.logout
    And I close browser

    Examples:
      | SEARCH BY  | ACCOUNT ID | CIS DIVISION | PREMISE ID |START DATE |REQUESTED BY |PREMISE FIELD NOTED|PERSON CONTACT TYPE|CONTACT INFORMATION|COMMENT       |
      | Account ID | 9047867132 | California   | 4475676167 |06-06-2021 | Krish       |Started Service    |Primary Email      |krish@gmail.com    |Start Service |