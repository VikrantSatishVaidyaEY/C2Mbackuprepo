#####################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    		Reason:
# 2022-08-11	SAhmad	  Initial Version.

#####################################################################################

Feature: Validate Alert is created when Account Characteristics Updated

  @CM345 @regression
  Scenario Outline: Verify User is able to create alert when Account Characteristics Updated

#Login C2M
    Given I navigate to C2M_HOME page
    When I enter credentials.user into input field c2m.username
    And I enter credentials.pass into input field c2m.password
    And I click on element c2m.sign_in

    #Click on Control Central Search
    And I switch to frame frame.main_frame
    And I wait for 5 sec
    And I click on element main.main_menu
    And element main.control_central should be present
    And I click on element main.control_central

    #Control Central Search Page
    And I wait for 3 sec
    Then I should see page title as "Control Central Search"
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I select "<SEARCH BY>" option by text from dropdown controlcentralsearch.search_by
    And element controlcentralsearch.account_id should be present
    And I enter "<ACCOUNT ID>" into input field controlcentralsearch.account_id
    And I select "<CIS DIVISION>" option by text from dropdown controlcentralsearch.cis_division
    And I click element controlcentralsearch.search

    #Go to Person Context Menu>> Go to Person
#    And I switch to frame frame.tabpage_zonemapframe1
#    And I wait for 7 sec
#    And I click on element controlcentral.account_context_menu
#    And I switch to main content
#    And element frame.main_frame should be present
#    And I switch to frame frame.main_frame
#    And element context.acctctx_gotoaccount should be present
#    And I forcefully click on element context.acctctx_gotoaccount
    #And I switch to main content
And I wait for 65 sec


#    #Go To Account
#    And I wait for 3 sec
#    Then I should see page title as "Control Central"
#    And I switch to main content
#    And I switch to frame frame.main_frame
#    And I switch to frame frame.dashboard
#    And I switch to frame frame.dashboard_zonemapframe202
#  #  And element dashboard.account_cntx_menu should be present
#    And I click element dashboard.account_cntx_menu
#    And I switch to main content
#    And I switch to frame frame.main_frame
#    And I click element context.acctctx_gotoaccount

  #Switch to Account Page and Characteristics Tab
    #Then I should see page title as "Account"
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabmenu_frame
    And I click on element tabs.characteristics
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I switch to frame frame.chargrid_character_frame
    And I wait for 10 sec
    And I select "<CHARACTERISTIC TYPE>" option by text from dropdown accountpage.account_char_type
    And I enter "<CHARACTERISTIC VALUE>" into input field accountpage.account_char_value
    And I press "TAB" key into input field accountpage.account_char_value
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click element actionbuttons.save

    # Logout C2M
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click element c2mlogout.english_system
    And I click element c2mlogout.logout
    #Then I close browser


    Examples:
      | SEARCH BY | ACCOUNT ID | CIS DIVISION   | CHARACTERISTIC TYPE | CHARACTERISTIC VALUE |
      #C2MDEV| Account ID| 6260382829 | Colorado Springs Utilities | Taxing City | COLO SPGS |
      #| Account ID| 7311218000 | Colorado Springs Utilities | Taxing City | COLO SPGS |
      #C2MTEST| Account ID| 0849672795 | Colorado Springs Utilities | Contract Managed By | 91995040 |
      | Account ID| 3970960888 | Colorado Springs Utilities | Contract Managed By | 91995040 |
