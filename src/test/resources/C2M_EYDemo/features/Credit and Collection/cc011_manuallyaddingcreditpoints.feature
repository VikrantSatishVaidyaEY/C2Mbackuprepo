#####################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    		Reason:
# 2022-05-12	CTongo		Initial Version.
# 2022-06-12	VVaidya		Updated code
#####################################################################################

Feature: Manually Adding Credit Points

  @CC011 @regression
  Scenario Outline: Verify User is able to Add Manually Credit Points

    #User is Logged In
    Given I navigate to C2M_HOME page
    When I enter credentials.user into input field c2m.username
    And I enter credentials.pass into input field c2m.password
    And I click on element c2m.sign_in

    #Click on Control Central Search
    And I wait for 5 sec
    And I switch to frame frame.main_frame
    And I click on element main.main_menu
    And I wait 10 seconds for element main.control_central to display
    And I click on element main.control_central

    #Search by Account ID and click Search
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I wait 10 seconds for element controlcentralsearch.search_by to display
    And I select "<searchBy>" option by text from dropdown controlcentralsearch.search_by
    And I wait 10 seconds for element controlcentralsearch.account_id to display
    And I enter "<accountId>" into input field controlcentralsearch.account_id
    And I select "<cisDivision>" option by text from dropdown controlcentralsearch.cis_division
    And I click element controlcentralsearch.search


     #Go to Account context Menu
    And I wait for 7 sec
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.dashboard
    And I click element controlcentral.account_context_menu

      #Go To Account page
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click element context.acctctx_gotoaccount

    #Switch to Credits and Collections tab
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabmenu_frame
    And I click on element tabs.creditsandcollections

    #Populate required fields for adding a credit rating
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I enter "<startDate>" into input field accountpage.credit_rating_start_date
    And I enter "<endDate>" into input field accountpage.credit_rating_end_date
    And I clear input field accountpage.credit_rating
    And I enter "<creditRating>" into input field accountpage.credit_rating
    And I clear input field accountpage.comments
    And I enter "<comments>" into input field accountpage.comments

    #Click Save
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click element actionbuttons.save

    #Logout C2M
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click element c2mlogout.english_system
    And I click element c2mlogout.logout
   # And I close browser

    Examples:
      | searchBy | accountId | cisDivision | startDate | endDate | creditRating | comments |
      | Account ID | 6806784169 | Colorado Springs Utilities | 04-08-2022 | 04-15-2022 |-30 | NGTP Testing |