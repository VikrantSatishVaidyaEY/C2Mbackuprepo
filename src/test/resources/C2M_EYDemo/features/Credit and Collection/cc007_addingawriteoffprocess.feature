#####################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    		Reason:
# 2022-05-19	CTongo		Initial Version.
#2022-06-24	    VVaidya		Updated code
#####################################################################################

Feature: Adding A Write Off Process

  @CC007 @regression
  Scenario Outline: Adding A Write Off Process
    #User is Logged In
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


    #Add Write-off process page
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click element context.acctctx_woproc
    And I click element context.add

    #Populate Write Off required fields
    And I wait for 3 sec
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I enter "<woControl>" into input field writeoffprocesspage.wo_control
    And I select "<woTemplate>" option by text from dropdown writeoffprocesspage.wo_template
    And I enter "<comments>" into input field writeoffprocesspage.wo_comments
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabmenu_frame
    And I click element tabs.wo_sas_tab
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I enter "<sa>" into input field writeoffprocesspage.wo_sa
    And I press "TAB" key into input field writeoffprocesspage.wo_sa
    And I select "<saStatus>" option by text from dropdown writeoffprocesspage.wo_sa_status
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click element actionbuttons.save

    #Logout C2M
#    And I switch to main content
#    And I switch to frame frame.main_frame
#    And I click element c2mlogout.english_system
#    And I click element c2mlogout.logout
#    And I close browser

    Examples:
      |searchBy|accountId|cisDivision|woControl|woTemplate|comments|sa| saStatus |
      |Account ID|7805209020|Colorado Springs Utilities|RES ELIGIBLE|Eligible for Write Off|NextGen Test|7805209628| Active |