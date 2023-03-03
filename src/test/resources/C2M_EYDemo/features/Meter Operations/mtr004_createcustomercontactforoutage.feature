#####################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    		 Reason:
# 2022-04-26	AThott		 Initial Version.
#
#####################################################################################

Feature: Verify User is able to Create an Customer Contact for Outage



  @MTR004 @regression
  Scenario Outline: Verify User is able to Create an Customer Contact for Outage

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
#    And element frame.tabpage_zonemapframe1 should be present
#    And I switch to frame frame.tabpage_zonemapframe1
#    And element controlcentral.person_context_menu should be present
#    And I click element controlcentral.person_context_menu

    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I wait for 5 sec
    #And element context.perctx_gotocustcont should be present
    #And I hover over element context.perctx_gotocustcont
    And element context.percntxmnu should be present
    And I click on element context.percntxmnu
    And I switch to main content
    And I switch to frame frame.main_frame
    And element context.perctx_gotocustcont should be present
    And I click on element context.perctx_gotocustcont
    And I click element context.add

    #Switch to Customer Contact Page
    And I switch to main content
    And I switch to frame frame.main_frame
    And element frame.tabpage_frame should be present
    And I switch to frame frame.tabpage_frame


    #Populate Required Customer Contact Page Values
    And I select "<PREFERRED CONTACT METHOD>" option by text from dropdown customercontact.pre_contact_method
    And I select "<CONTACT CLASS>" option by text from dropdown customercontact.contact_class
    And I enter "<CONTACT TYPE>" into input field customercontact.contact_type
    And I press "TAB" key into input field customercontact.contact_type

    #switch to characteristic tab
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabmenu_frame
    And I click element customercontact.characteristic_tab
    And I switch to main content
    And I switch to frame frame.main_frame
    And element frame.tabpage_frame should be present
    And I switch to frame frame.tabpage_frame
    And element frame.char_grid_frame should be present
    And I switch to frame frame.char_grid_frame
    And element customercontact.characteristic_type_textbox should be present
    And I enter "ACCT ID" into input field customercontact.characteristic_type_textbox
    And I press "TAB" key into input field customercontact.characteristic_type_textbox
    And I enter "<CHARACTERISTIC VALUE AccountId>" into input field customercontact.accntid_characteristic_value

    And element customercontact.addcharicon should be present
    And I click on element customercontact.addcharicon
    And element customercontact.characteristic_type_textbox_prem should be present
    And I enter "PREM ID" into input field customercontact.characteristic_type_textbox_prem
    And I press "TAB" key into input field customercontact.characteristic_type_textbox_prem
    And I enter "<CHARACTERISTIC VALUE PremiseId>" into input field customercontact.premid_characteristic_value
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click element actionbuttons.save



    #Logout C2M
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click element c2mlogout.english_system
    And I close browser


    #Examples:
      #| SEARCH BY  | ACCOUNT ID | CIS DIVISION | PREFERRED CONTACT METHOD | CONTACT CLASS | CONTACT TYPE |
      #| Account ID | 6916139061 | Division 1   | Not Applicable           | Outage        | PLANOUT      |
     # | Account ID | 6916139061 | Division 1   | Person Contact           | Outage        | PLANOUT      |
     # | Account ID | 6916139061 | Division 1   | Postal                   | Outage        | PLANOUT      |

    #C2MDEV
    Examples:
      | SEARCH BY  | ACCOUNT ID | CIS DIVISION              | PREFERRED CONTACT METHOD | CONTACT CLASS      | CONTACT TYPE |CHARACTERISTIC VALUE AccountId|CHARACTERISTIC VALUE PremiseId|
    #C2MDEV  | Account ID | 6062871421 | Colorado Springs Utilities|Not Applicable            | Application Status | LS           |6062871421                    |6488612876                    |
     #C2MTEST | Account ID | 8804170136 | Colorado Springs Utilities|Not Applicable            | Application Status | LS           |8792485588                    |4116553540                    |

     #C2MTEST | Account ID | 8776777591 | Colorado Springs Utilities|Not Applicable            | Application Status | LS           |8776777591                    |4116467112                    |
      | Account ID | 0440821912 | Colorado Springs Utilities|Not Applicable            | Application Status | LS           |0440821912                    |8015856987                    |
