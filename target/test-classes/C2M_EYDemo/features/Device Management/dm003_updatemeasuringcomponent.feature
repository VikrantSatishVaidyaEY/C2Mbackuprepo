#####################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    		Reason:
# 2022-05-23	CTongo		Initial Version.
#
#####################################################################################

Feature: Update Measuring Component

  @DM003 @regression
  Scenario Outline: Update Measuring Component

    #Login C2M
    Given I navigate to C2M_HOME page
    When I enter credentials.user into input field c2m.username
    And I enter credentials.pass into input field c2m.password
    And I click on element c2m.sign_in

    #Go to Asset Management > Asset > Add
    And I wait for 5 sec
    And I switch to frame frame.main_frame
    And I click on element main.main_menu
    And I wait 10 seconds for element main.device to display
    And I click on element main.device
    And I wait 10 seconds for element submenu.measuring_component to display
    And I click on element submenu.measuring_component
    And I click on element submenu.search

    #Search for Measuring Component
    And I switch to frame frame.tabpage_frame
    And I wait 10 seconds for element measuringcomponentquerypage.asset_identifier to display
    And I select "<deviceIdentifier>" option by text from dropdown measuringcomponentquerypage.asset_identifier
    And I wait 10 seconds for element measuringcomponentquerypage.identifier_type to display
    And I select "<identifierType>" option by text from dropdown measuringcomponentquerypage.identifier_type
    And I wait 10 seconds for element measuringcomponentquerypage.identifier_value to display
    And I enter "<identifierValue>" into input field measuringcomponentquerypage.identifier_value
    And I click element measuringcomponentquerypage.mc_search_btn

    #Go to Measuring Component Page
    And I wait 10 seconds for element measuringcomponentquerypage.mc_context_menu to display
    And I click element measuringcomponentquerypage.mc_context_menu
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click element context.mcctx_gotomeasrcomp

    #Edit MC Register Multiplier
    And I wait for 5 sec
    And I wait 30 seconds for element frame.tabpage_frame to display
    And I switch to frame frame.tabpage_frame
    And I switch to frame frame.tabpage_zonemapframe1
    And I click element measuringcomponentpage.measuring_component_edit_btn
    And I wait for 5 sec
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.ui_frame
    And I clear input field measuringcomponentpage.channel_multiplier
    And I enter "<channelMultiplier>" into input field measuringcomponentpage.channel_multiplier
    And I click element measuringcomponentpage.edit_mc_save_btn
      #Alert Handler for C2MDev
    And I wait for 5 sec
    #And I accept alert
    #And I wait for 10 sec

    #Logout C2M
#    And I switch to main content
#    And I switch to frame frame.main_frame
#    And I click element c2mlogout.english_system
#    And I click element c2mlogout.logout
   # And I close browser

    Examples:
      |deviceIdentifier     |identifierType    |identifierValue |channelMultiplier |
      |Device Identifier    |Badge Number      |BN777          |1.000000           |