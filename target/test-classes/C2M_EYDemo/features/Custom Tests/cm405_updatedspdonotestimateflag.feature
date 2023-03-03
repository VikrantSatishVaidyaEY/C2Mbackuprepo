#####################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    		Reason:
# 2022-08-24	VVaidya		Initial Version.
#####################################################################################

Feature: Verify User can update the Do Not Estimate flag for Service Point

  @CM405 @regression
  Scenario Outline: Verify User can update the Do Not Estimate flag for Service Point

    #User is Logged In
    Given I navigate to C2M_HOME page
    When I enter credentials.user into input field c2m.username
    And I enter credentials.pass into input field c2m.password
    And I click on element c2m.sign_in

    #Add a Premise
    And I switch to frame frame.main_frame
    And I click on element main.main_menu
    And I wait 10 seconds for element main.customer_information to display
#    And element main.customer_information should be present
    And I hover over element main.customer_information
    And element submenu.premise should be present
    And I hover over element submenu.premise
    And I click element submenu.search

    #Switch to new Window
    And I wait for 3 sec
    And I switch to new window
#    And I wait for 10 sec

    And element premisepage.premise_id_search should be present
    And I enter "<Premise_Id>" into input field premisepage.premise_id_search
    And I click element premisepage.premise_id_search_btn

    #Switch to Previous Window
    And I wait for 3 sec
    And I switch to previous window
    And I wait for 10 sec

    #Premise Context Menu
    And I switch to main content
    And I switch to frame frame.main_frame
    And I wait 10 seconds for element frame.tabpage_frame to display
    And I switch to frame frame.tabpage_frame
    And I click element premisepage.premise_context_menu
    And I switch to main content
    And I switch to frame frame.main_frame
    And element context.premctx_gotosp should be present
    And I click element context.premctx_gotosp
    And I click element premisepage.add

    #Add Service point
    And I switch to main content
    And I switch to frame frame.main_frame
    And element frame.ui_frame should be present
    And I switch to frame frame.ui_frame
    And element servicepointpage.select_type should be present
    And I select "<Service Point Type>" option by text from dropdown servicepointpage.select_type
    And I click element servicepointpage.ok
    And element servicepointpage.estimationeligibility should be present
    And I select "<Estimate Eligibility>" option by text from dropdown servicepointpage.estimationeligibility
    And I select "<Measurement Cycle>" option by text from dropdown servicepointpage.measurement_cycle
    #And I select "<Route>" option by text from dropdown servicepointpage.route
    
   And I click element servicepointpage.save
    And I wait for 5 sec

    #Click on Edit button
    And I switch to main content
    And I switch to frame frame.main_frame
    And I wait for 5 sec
    And I switch to frame frame.tabpage_frame
    And I wait for 5 sec
    And I switch to frame frame.tabpage_zonemapframe1
    And I click on element servicepointpage.edit_sp

    #Change Estimate Eligibility from Not Eligible to Eligible
    And I switch to main content
    And I switch to frame frame.main_frame
    And element frame.ui_frame should be present
    And I switch to frame frame.ui_frame
    And element servicepointpage.estimationeligibility should be present
    And I select "<Estimate Eligibility Updated>" option by text from dropdown servicepointpage.estimationeligibility

    #Click on Save
    And I click element servicepointpage.save
    And I wait for 5 sec

    #Logout C2M
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click element c2mlogout.english_system
    And I click element c2mlogout.logout
    #And I close browser



    Examples:
      | Premise_Id   | Service Point Type   | Measurement Cycle           | Estimate Eligibility | Estimate Eligibility Updated |Route | Premise_County | Premise_State |
     #C2MDEV | 0956557194   | Electric Residential | Meter Read Cycle Number 01  | Not Eligible                     |Eligible |Brooklyn     | ILLINOIS       | IL            |
      | 2564159714   | Electric Residential | Meter Read Cycle Number 01  | Not Eligible                     |Eligible |Brooklyn     | ILLINOIS       | IL            |
