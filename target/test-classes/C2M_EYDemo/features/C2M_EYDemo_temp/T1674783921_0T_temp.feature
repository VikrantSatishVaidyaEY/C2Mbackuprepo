Feature: T1674783921_0T_temp

  @FIN001_NGTPUI @regression_NGTPUI
  Scenario Outline: Verify User is able to Add an Adjustment
    Given I navigate to C2M_HOME page
    When I enter credentials.user into input field c2m.username
    And I enter credentials.pass into input field c2m.password
    And I click on element c2m.sign_in
    And I wait for 5 sec
    And I switch to frame frame.main_frame
    And I wait for 5 sec
    And I click on element main.main_menu
    And element main.control_central should be present
    And I click on element main.control_central
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
    And I wait for 3 sec
    And I wait for 7 sec
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.dashboard
    And I click element controlcentral.account_context_menu
    And I switch to main content
    And I switch to frame frame.main_frame
    And I hover over element context.acctctx_gotoadjustment
    And I click element context.add
    And I wait for 3 sec
    And I switch to frame frame.tabpage_frame
    And I enter "<ADJUSTMENT TYPE>" into input field adjustmentpage.adjustment_type_field
    And I press "TAB" key into input field adjustmentpage.adjustment_type_field
    And I clear input field adjustmentpage.amount
    And I enter "<AMOUNT>" into input field adjustmentpage.amount
    And I click element adjustmentpage.generate_btn
    And I switch to main content
    And I switch to new window
    And I click element adjustmentpage.calculate_btn
    And I switch to previous window
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I click on element adjustmentpage.submit_approval_btn
    And I wait for 4 sec
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabmenu_frame
    And I click element tabs.approval_tab
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And element frame.zonemapframe_2_frame should be present
    And I switch to frame frame.zonemapframe_2_frame
    And I click element adjustmentpage.approve_btn
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabmenu_frame
    And I click element tabs.main_tab
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.tabpage_frame
    And I click element adjustmentpage.freeze_btn
    And I wait for 3 sec
    And I switch to main content
    And I switch to new window
    And I click element adjustmentpage.save_btn
    And I switch to previous window

  @NGTPUI_NGTPUI
    Examples: 
      | SEARCH BY  | ACCOUNT ID | CIS DIVISION               | ADJUSTMENT TYPE | AMOUNT |
      | Account ID | 0707403459 | Colorado Springs Utilities | FEEREI          | 10     |