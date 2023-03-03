#####################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    		Reason:
# 2022-05-24	SAhmad		Initial Version.
#2023-01-23	VVaidya		Changes
#####################################################################################

Feature: Add a pay plan

  @CC002 @regression
  Scenario Outline: Verify User is able to Add a pay plan

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

    #Add a pay plan
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click on element context.acctctx_gotopayplan
    And I click element context.add

   #switch to pay plan page
    And I wait for 3 sec
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame

  #Populate Required pay plan Page Values
    And I enter "<TYPE>" into input field payplanpage.type
    And I press "TAB" key into input field payplanpage.type
    And I select "<PAY METHOD>" option by text from dropdown payplanpage.pay_method
    And I enter "<COMMENTS>" into input field payplanpage.comment
    And I switch to frame frame.schedgrid_frame
    #And I enter todays date into input field payplanpage.sheduled_date
    And I enter "<SCHEDULED DATE>" into input field payplanpage.sheduled_date
    And I enter "<SCHEDULED AMOUNT>" into input field payplanpage.sheduled_amount
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click element actionbuttons.save
#    And I switch to main content
#    And I switch to frame frame.main_frame
#    And I switch to frame frame.dashboard
##    And I wait for 10 sec (DEMO STEP)
##    And I switch to frame frame.dashboard_zonemapframe201 (DEMO STEP)
#    Then element dashboard.active_plan_alert should have text as "1 Active pay plans in the last 12 months"


#  Logout C2M
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click element c2mlogout.english_system
    And I click element c2mlogout.logout
  #  And I close browser

#    Examples:
#      | SEARCH BY | ACCOUNT ID | CIS DIVISION | TYPE | PAY METHOD | COMMENTS | SCHEDULED DATE | SCHEDULED AMOUNT |
#      | Account ID | 0001703652 | Colorado Springs Utilities | RES | In Person | Adding a payplan test | 06-16-2022 | 100 |

    Examples:
      |SEARCH BY|ACCOUNT ID|CIS DIVISION|TYPE|PAY METHOD|COMMENTS|SCHEDULED DATE|SCHEDULED AMOUNT|
      #C2MDEV |Account ID|1456426301|Colorado Springs Utilities|RES|In Person|Adding a payplan test|06-24-2022|100|
     # |Account ID|0000784655|Colorado Springs Utilities|UTILITY|Office|Adding a payplan test|09-27-2022|5|
      #C2MTEST |Account ID|0003031253|Colorado Springs Utilities|UTILITY|Office|Adding a payplan test|10-08-2022|5|
      |Account ID|0000248117|Colorado Springs Utilities|UTILITY|Office|Adding a payplan test|10-24-2022|5|
