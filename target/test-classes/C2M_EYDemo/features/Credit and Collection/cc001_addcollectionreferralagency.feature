#####################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    		Reason:
# 2022-05-11	SAhmad		Initial Version.
#
#####################################################################################

Feature: Add a Collection Referral Agency

  @CC001 @regression
  Scenario Outline: Verify User is able to Add a Collection Referral Agency

#   Login C2M
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
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I select "<SEARCH BY>" option by text from dropdown controlcentralsearch.search_by
    And element controlcentralsearch.account_id should be present
    And I enter "<ACCOUNT ID>" into input field controlcentralsearch.account_id
    And I select "<CIS DIVISION>" option by text from dropdown controlcentralsearch.cis_division
    And I click element controlcentralsearch.search

    #Go to Account context Menu
    And I wait for 7 sec
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.dashboard
    And I click element controlcentral.account_context_menu

    #Add Collection Referral Agency
    And I switch to main content
    And I switch to frame frame.main_frame
    And element context.acctctx_gotocollagcyref should be present
    And I click element context.acctctx_gotocollagcyref
    And I hover over element context.acctctx_gotocollagcyref
    And I click element context.add

     # Switch to Collection Agency Referral Page
    And I wait for 3 sec
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I enter "<COLLECTION AGENCY>" into input field collectionagency.collectionagency_field
    And I press "TAB" key into input field collectionagency.collectionagency_field
    And I enter "<START DATE>" into input field collectionagency.startdate_field
    And I select "Active" option by text from dropdown collectionagency.referralstatus_dropdown
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I switch to frame frame.collrefhis_datagrid_frame
    And I enter "<CREATION DATE>" into input field collectionagency.creationdate_field
    And I clear input field collectionagency.referralamount_field
    And I enter "<REFERRAL AMOUNT>" into input field collectionagency.referralamount_field
    And I select "Initial Referral" option by text from dropdown collectionagency.referralhistory_dropdown
   #Click on Save
    And I switch to main content
    And I switch to frame c2m.main_frame
    Then I click element c2m.save

#    Logout C2M
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click element c2mlogout.english_system
    And I click element c2mlogout.logout
    #And I close browser


    Examples:
      | SEARCH BY |ACCOUNT ID | CIS DIVISION | COLLECTION AGENCY | START DATE | CREATION DATE | REFERRAL AMOUNT |
    #C2MDEV  | Account ID | 0335021087 | Colorado Springs Utilities | CBCS | 06-20-2022 | 06-24-2022 | 100             |
     #C2MTEST | Account ID | 3761518542 | Colorado Springs Utilities | CMA | 06-20-2022 | 06-24-2022 | 10             |
     #C2MTEST | Account ID | 7556765983 | Colorado Springs Utilities | CMA | 06-20-2022 | 06-24-2022 | 10             |
      | Account ID | 0029727439 | Colorado Springs Utilities | CMA | 06-20-2022 | 06-24-2022 | 10             |
