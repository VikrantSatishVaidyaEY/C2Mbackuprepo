Feature: Adding new Accounts and Create Manual Alerts in CSU C2M

  Background:User is Logged In
    Given I navigate to C2M_HOME page
    When I enter credentials.user into input field c2m.username
    And I enter credentials.pass into input field c2m.password
    And I click on element c2m.sign_in


  #@account
#  @account
  Scenario: Verify User is able to create new account

    And I switch to frame c2m.main_frame
    And I enter "Add Account" into input field c2m.menu
    And I click on element c2m.addaccount_label
    And I switch to frame c2m.menu_frame
    And I click element c2m.person
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.tab_page_frame
    And I enter "4155147511" into input field c2m.personname
    And I press "TAB" key into input field c2m.personname
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.menu_frame
    And I click element c2m.main
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.tab_page_frame
    And I select "2" option by index from dropdown c2m.cis_division
    And I wait for 2 sec
    And I accept alert
    And I enter "0602841600" into input field c2m.premise_id
    And I press "TAB" key into input field c2m.premise_id
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I click element c2m.save
   # Then element c2m.new_accountid should have attribute "" with value "false"
    #And I switch to frame c2m.tab_page_frame
    #Then element c2m.new_accountid should be present
    And I wait 5 seconds for element c2m.tab_page_frame to display
    And I switch to frame c2m.tab_page_frame
   # And I wait for 10 sec
    Then element c2m.addaccnt_validate should be present
    Then get me the text from c2m.addaccnt_validate element


  #@account
  Scenario: Verify User is able to add manual Alert

    When I switch to frame c2m.main_frame
    And I click element c2m.topmenu
    And I click element c2m.controlcentralsearch
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.tab_page_frame
    And I select "2" option by index from dropdown c2m.search_by_list
    And I enter credentials.accountid into input field c2m.accountid
    And I click element c2m.search
    And I wait 5 seconds for element c2m.custinfo_frame to display
    And I switch to frame c2m.custinfo_frame
    And I forcefully click on element c2m.main_customer
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.tab_page_frame
    And I select "2" option by index from dropdown c2m.lifesupportoption
    And I enter "Test Notes" into input field c2m.notes
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I click element c2m.save
    And I wait for 10 sec
    And I click on element c2m.addalert_history
    And I switch to frame c2m.tab_page_frame
    And I wait for 10 sec
    And I scroll to element c2m.addalert_scroll
    Then element c2m.addalert_text should have text as "Life Support/Sensitive Load on Person"


  @account
  Scenario: Verify user is able to create C2M Account by creating new Person

    When I switch to frame c2m.main_frame
    And I enter "Add Person" into input field c2m.menu
    And I click on element c2m.addperson_label
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.tab_page_frame
    And I select "2" option by index from dropdown c2m.lifesupportoption
    And I enter "Test Notes" into input field c2m.notes
    And I switch to frame c2m.addperson_name_frame
    And I enter credentials.add_person_name into input field c2m.addperson_name_details
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.tab_page_frame
    And I switch to frame c2m.addperson_contact_frame
    And I select "3" option by index from dropdown c2m.addperson_contact_type
    And I enter credentials.add_person_contactinfo into input field c2m.addperson_contactinfo
    And I press "TAB" key into input field c2m.addperson_checkbox
    And I check the checkbox c2m.addperson_checkbox
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.tab_page_frame
    And I switch to frame c2m.peridentifier_frame
    And I put random number into input field c2m.ssn
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I click element c2m.save

  #@account
  Scenario: Verify User is able to add a Case

    When I switch to frame c2m.main_frame
    And I click element c2m.topmenu
    And I click element c2m.controlcentralsearch
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.tab_page_frame
    And I select "2" option by index from dropdown c2m.search_by_list
    And I enter credentials.case_accntid into input field c2m.accountid
    And I click element c2m.search
    And I switch to frame c2m.case_cust_frame
    And I click on element c2m.case_contextmenu
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I hover over element c2m.goto_case
    And I click element c2m.add_case
    And I switch to frame c2m.ui_frame
    And I select "7" option by index from dropdown c2m.case_type
    And I click element c2m.case_button
    And I enter credentials.case_comment_enq into input field c2m.case_comment
    And I select "3" option by index from dropdown c2m.case_search_by_list
    And I press "TAB" key into input field c2m.case_contact
    And I press "TAB" key into input field c2m.case_contact
    And I press "ENTER" key into input field c2m.case_contact
    And I wait for 5 sec
    And I click element c2m.case_save

   # And I wait for 10 sec
    And I switch to main content
    And I switch to frame c2m.main_frame
    #And I wait for 5 sec
    #And I switch to frame c2m.menu_frame ---commented purposefully
    #And I wait for 5 sec
    And I forcefully click on element c2m.case_log
    #And I wait for 5 sec
    And I switch to main content
    And I switch to frame c2m.main_frame
    #And I wait 10 seconds for element c2m.tab_page_frame to display
    And I switch to frame c2m.tab_page_frame
    And I wait for 5 sec
    Then element c2m.case_text should have text as "Case created."



    #@account:
    Scenario: Verify user is able to Start Service Using an Order/Campaign RES




      #@account
  Scenario: Verify User is able to Create/log customer contact
    When I switch to frame c2m.main_frame
    And I wait 20 seconds for element c2m.controlcentralsearch_button to display
    And I click on element c2m.controlcentralsearch_button
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I wait 5 seconds for element c2m.tab_page_frame to display
    And I switch to frame c2m.tab_page_frame
    And I select "2" option by index from dropdown c2m.search_by_list
    And I wait 5 seconds for element c2m.accountid to display
    And I enter "0071496373" into input field c2m.accountid
    And I click element c2m.search
    And I wait for 5 sec
    And I wait 10 seconds for element c2m.zonemap_frame2 to display
    And I switch to frame c2m.zonemap_frame2
    And I click on element c2m.contextmenu_logcc
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I hover over element c2m.log_cc
    And I click element c2m.add_log_cc
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I wait 5 seconds for element c2m.tab_page_frame to display
    And I switch to frame c2m.tab_page_frame
    And I forcefully check the checkbox c2m.checkbox_logcc
    And I select "3" option by index from dropdown c2m.select_logcc
    And I press "TAB" key into input field c2m.contact_logcc
    And I press "TAB" key into input field c2m.contact_logcc
    And I press "ENTER" key into input field c2m.contact_logcc
    And I select "Billing-related contacts" option by text from dropdown c2m.contactclass_logcc
    And I enter "HIGHBILL" into input field c2m.contacttype_logcc
    And I press "TAB" key into input field c2m.contact_logcc
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.menu_frame
    And I click element c2m.log_logcc
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I wait 5 seconds for element c2m.tab_page_frame to display
    And I switch to frame c2m.tab_page_frame
    And I enter credentials.comment_logcc into input field c2m.logcc_comment
    And I select "3" option by index from dropdown c2m.remindertype_logcc
    And I enter "AGROBE" into input field c2m.sendto_logcc
    And I press "TAB" key into input field c2m.sendto_logcc
    And I enter "03-20-2022" into input field c2m.triggerdate_logcc
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I click element c2m.save

  #@account
  Scenario: Verify User is able to Start a Service Agreement via Start/Stop page
    When I switch to frame c2m.main_frame
    And I wait 20 seconds for element c2m.controlcentralsearch_button to display
    And I click on element c2m.controlcentralsearch_button
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I wait 15 seconds for element c2m.tab_page_frame to display
    And I switch to frame c2m.tab_page_frame
    And I wait for 10 sec
    And I select "2" option by index from dropdown c2m.search_by_list
    And I wait for 10 sec
    And I wait 10 seconds for element c2m.accountid to display
    And I enter "0976826662" into input field c2m.accountid
    And I select "2" option by index from dropdown c2m.cisdiv_cntrl
    And I click element c2m.search
    And I wait for 10 sec
    And I wait 10 seconds for element c2m.case_cust_frame to display
    And I switch to frame c2m.case_cust_frame
    And I wait for 10 sec
    And I click on element c2m.case_contextmenu
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I wait for 10 sec
    And I click element c2m.start/stop
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I wait 15 seconds for element c2m.tab_page_frame to display
    And I switch to frame c2m.tab_page_frame
    And I wait for 10 sec
    And I enter "03-24-2022" into input field c2m.startdate_service
    And I select "Start a Premise" option by text from dropdown c2m.startmethod_service
    And I enter "Testing,Address Tue2901" into input field c2m.address_service
    And I press "TAB" key into input field c2m.address_service
    And I wait for 10 sec
    And I enter "CHICAGO" into input field c2m.city_service
    And I wait for 15 sec
    And I press "TAB" key into input field c2m.city_service
    And I wait for 10 sec
    And I click element c2m.start_service
    And I wait for 15 sec
    And I switch to new window
    And I wait for 10 sec
    #And I select "3" option by index from dropdown c2m.cis_service
    #And I enter "ONETIME" into input field c2m.satype_service
    #And I wait for 15 sec
    #And I press "TAB" key into input field c2m.satype_service
   # And I wait for 10 sec
    #And I enter "100" into input field c2m.amt_service
    #And I wait for 5 sec
    And I clear input field c2m.startopt_service
    And I enter "ER-BASIC" into input field c2m.startopt_service
    And I wait for 15 sec
    And I press "TAB" key into input field c2m.startopt_service
    And I wait for 10 sec
    And I click element c2m.sastart_service
    And I wait for 10 sec
    And I switch to previous window
    And I wait for 10 sec
    #And I switch to main content
    #And I switch to frame c2m.main_frame
    #And I wait for 10 sec
    #And I click on element c2m.addalert_history
    #And I switch to frame c2m.tab_page_frame
    #And I wait for 10 sec
    #And I scroll to element c2m.addalert_scroll
    #And I wait for 10 sec
    #And I click element c2m.alert_service
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I wait 15 seconds for element c2m.dashboard_frame to display
    And I switch to frame c2m.dashboard_frame
    And I wait 15 seconds for element c2m.dashboard_zonemap_frame to display
    And I switch to frame c2m.dashboard_zonemap_frame
    And I wait for 10 sec
    And I click element c2m.alert_service
    And I wait for 10 sec
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I wait for 5 sec
    And I switch to frame c2m.menu_frame
    And I wait for 5 sec
    And I click on element c2m.main
    And I wait for 5 sec
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I wait 15 seconds for element c2m.tab_page_frame to display
    And I switch to frame c2m.tab_page_frame
    And I wait for 10 sec
    And I switch to frame c2m.service_frame
    And I wait for 10 sec
    And I click on element c2m.service_complete
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I wait 15 seconds for element c2m.dashboard_frame to display
    And I switch to frame c2m.dashboard_frame
    And I wait 15 seconds for element c2m.servicezonemap_frame to display
    And I switch to frame c2m.servicezonemap_frame
    And I wait for 10 sec
    And I click on element c2m.service_img
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I wait for 10 sec
    And I hover over element c2m.goto_serviceagreement
    And I wait for 10 sec
    And I click element c2m.goto_searchservice
    And I wait for 10 sec
    And I switch to new window
    And I wait for 10 sec
    And I switch to main content
    And I switch to frame c2m.servicestop_frame
    And I wait for 10 sec
    And I click element c2m.start_pending
    And I switch to previous window
    And I wait for 10 sec
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I wait 15 seconds for element c2m.tab_page_frame to display
    And I switch to frame c2m.tab_page_frame
    And I wait for 10 sec
    #And I select "2" option by index from dropdown c2m.cis_division
    #And I wait for 10 sec
    #And I enter "E-RES" into input field c2m.satype_agreement
    #And I wait for 10 sec
    #And I press "TAB" key into input field c2m.satype_agreement
    #And I wait for 10 sec
    #And I enter "9975815335" into input field c2m.premise_agreement
    #And I wait for 10 sec
    #And I press "TAB" key into input field c2m.premise_agreement
    #And I wait for 10 sec
    And I click element c2m.activate_sa


  #@account
  Scenario: Verify User is able to Stop a Service Agreement via Start/Stop page
    When I switch to frame c2m.main_frame
    And I wait 20 seconds for element c2m.controlcentralsearch_button to display
    And I click on element c2m.controlcentralsearch_button
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I wait 15 seconds for element c2m.tab_page_frame to display
    And I switch to frame c2m.tab_page_frame
    And I wait for 10 sec
    And I select "2" option by index from dropdown c2m.search_by_list
    And I wait for 10 sec
    And I wait 10 seconds for element c2m.accountid to display
    And I enter "0976826662" into input field c2m.accountid
    And I select "2" option by index from dropdown c2m.cisdiv_cntrl
    And I click element c2m.search
    And I wait for 10 sec
    And I wait 10 seconds for element c2m.case_cust_frame to display
    And I switch to frame c2m.case_cust_frame
    And I wait for 10 sec
    And I click on element c2m.case_contextmenu
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I wait for 10 sec
    And I click element c2m.start/stop
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I wait 15 seconds for element c2m.tab_page_frame to display
    And I switch to frame c2m.tab_page_frame
    And I wait for 10 sec
    And I enter "03-26-2022" into input field c2m.stopdate_service
    And I select "Stop a Premise" option by text from dropdown c2m.stopmethod_service
    And I enter "8181389232" into input field c2m.addressstop_service
    And I wait for 10 sec
    And I press "TAB" key into input field c2m.address_service
    And I wait for 10 sec
    And I click element c2m.stop_service
    And I wait for 10 sec
    #And I switch to main content
    #And I switch to frame c2m.main_frame
    #And I wait for 10 sec
    #And I click on element c2m.addalert_history
    #And I switch to frame c2m.tab_page_frame
    #And I wait for 10 sec
    #And I scroll to element c2m.addalert_scroll
    #And I wait for 10 sec
    #And I click element c2m.alert_service
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I wait 15 seconds for element c2m.dashboard_frame to display
    And I switch to frame c2m.dashboard_frame
    And I wait 15 seconds for element c2m.dashboard_zonemap_frame to display
    And I switch to frame c2m.dashboard_zonemap_frame
    And I wait for 10 sec
    And I click element c2m.alert_service
    And I wait for 10 sec
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I wait for 5 sec
    And I switch to frame c2m.menu_frame
    And I wait for 5 sec
    And I click on element c2m.main
    And I wait for 5 sec
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I wait 15 seconds for element c2m.tab_page_frame to display
    And I switch to frame c2m.tab_page_frame
    And I wait for 10 sec
    And I switch to frame c2m.service_frame
    And I wait for 10 sec
    And I click on element c2m.service_complete
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I wait 15 seconds for element c2m.dashboard_frame to display
    And I switch to frame c2m.dashboard_frame
    And I wait 15 seconds for element c2m.servicezonemap_frame to display
    And I switch to frame c2m.servicezonemap_frame
    And I wait for 10 sec
    And I click on element c2m.service_img
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I wait for 10 sec
    And I hover over element c2m.goto_serviceagreement
    And I wait for 10 sec
    And I click element c2m.goto_searchservice
    And I wait for 10 sec
    And I switch to new window
    And I wait for 10 sec
    And I switch to main content
    And I switch to frame c2m.servicestop_frame
    And I wait for 10 sec
    And I click element c2m.stop_pending
    And I switch to previous window
    And I wait for 10 sec
    #And I switch to main content
    #And I switch to frame c2m.main_frame
    #And I wait for 10 sec
    #And I wait 15 seconds for element c2m.tab_page_frame to display
    #And I switch to frame c2m.tab_page_frame
    #And I wait for 10 sec
    #And I click element c2m.initiatestop_service
    #And I wait for 10 sec
    #And I switch to new window
    #And I wait for 10 sec
    #And I enter "03-11-2022" into input field c2m.end_date_stopservice
    #And I wait for 5 sec
    #And I click element c2m.initiatestop_service
    #And I wait for 10 sec
    #And I accept alert
    #And I wait for 10 sec
    #And I switch to previous window
    #And I wait for 10 sec
    And I switch to main content
    And I switch to frame c2m.main_frame
    #And I wait for 10 sec
    And I wait 15 seconds for element c2m.tab_page_frame to display
    And I switch to frame c2m.tab_page_frame
    And I wait for 10 sec
    And I click element c2m.stop

  #@account
  Scenario: Verify User is able to Add a meter read via Meter Read page(MU.001)
    And I switch to frame c2m.main_frame
    And I wait for 10 sec
    And I click element c2m.topmenu
    And I wait for 5 sec
    And I hover over element c2m.360_search
    And I wait for 10 sec
    And I click element c2m.search_by_device
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I wait 15 seconds for element c2m.tab_page_frame to display
    And I switch to frame c2m.tab_page_frame
    And I wait for 10 sec
    And I select "Badge Number" option by text from dropdown c2m.search_identifiertype
    And I wait for 10 sec
    And I enter "Sample_EAM_01" into input field c2m.search_identifiervalue
    And I wait for 10 sec
    And I click element c2m.search_device
    And I wait for 10 sec
    And I click element c2m.measuring_comp
    And I wait for 10 sec
    And I click element c2m.reading_link
    And I wait for 10 sec
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I wait for 10 sec
    And I wait 10 seconds for element c2m.ui_frame to display
    And I switch to frame c2m.ui_frame
    And I wait for 5 sec
    And I enter "0" into input field c2m.reading
    And I wait for 5 sec
    And I select "Regular" option by text from dropdown c2m.measure_condition
    And I wait for 5 sec
    And I click element c2m.reading_save

 # @account
  Scenario: Verify User is able to Add a meter read (MU.002)
    And I switch to frame c2m.main_frame
    And I wait for 10 sec
    And I click element c2m.topmenu
    And I wait for 5 sec
    And I click element c2m.360_search
    And I wait for 10 sec
    And I click element c2m.search_by_device
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I wait 15 seconds for element c2m.tab_page_frame to display
    And I switch to frame c2m.tab_page_frame
    And I wait for 10 sec
    And I select "Badge Number" option by text from dropdown c2m.search_identifiertype
    And I wait for 10 sec
    And I enter "Sample_ESM_02" into input field c2m.search_identifiervalue
    And I wait for 10 sec
    And I click element c2m.search_device
    And I wait for 10 sec
    And I click element c2m.measuring_interval
    And I wait for 10 sec
    And I wait 15 seconds for element c2m.custinfo_frame to display
    And I switch to frame c2m.custinfo_frame
    And I wait for 10 sec
    And I click element c2m.finalvalues_img
    And I wait for 5 sec
    And I click element c2m.create_override
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I wait for 10 sec
    And I wait 10 seconds for element c2m.ui_frame to display
    And I switch to frame c2m.ui_frame
    And I wait for 5 sec
    And I enter "04-25-2020" into input field c2m.create_override_startdate
    And I wait for 10 sec
    And I clear input field c2m.create_override_enddate
    And I wait for 5 sec
    And I enter "05-25-2022" into input field c2m.create_override_enddate
    And I wait for 10 sec
    #And I press "TAB" key into input field c2m.addperson_checkbox
    And I uncheck the checkbox c2m.uncheck_measurement
    And I wait for 10 sec
    And I enter "500" into input field c2m.total_consumption
    And I wait for 10 sec
    And I select "Regular" option by text from dropdown c2m.consumption_condition
    And I wait for 5 sec
    And I select "Use Straight Line" option by text from dropdown c2m.conversion_method
    And I wait for 5 sec
    And I click element c2m.meter_ok
    And I wait for 10 sec
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I wait 15 seconds for element c2m.tab_page_frame to display
    And I switch to frame c2m.tab_page_frame
    And I wait for 10 sec
    And I switch to frame c2m.zoneframe5
    And I wait for 10 sec
    And I click element c2m.perform_vee


 # @account
  Scenario: Create an Customer Contact for Outage (MTR.004)
    And I switch to frame c2m.main_frame
    And I wait for 10 sec
    And I click element c2m.topmenu
    And I wait for 5 sec
    And I click element c2m.controlcentralsearch
    And I wait for 10 sec
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I wait 15 seconds for element c2m.tab_page_frame to display
    And I switch to frame c2m.tab_page_frame
    And I wait for 10 sec
    And I select "2" option by index from dropdown c2m.search_by_list
    And I wait for 10 sec
    And I wait 10 seconds for element c2m.accountid to display
    And I enter "6916139061" into input field c2m.accountid
    And I select "Division 1" option by text from dropdown c2m.cisdiv_cntrl
    And I click element c2m.search
    And I wait for 10 sec
    And I wait 10 seconds for element c2m.case_cust_frame to display
    And I switch to frame c2m.case_cust_frame
    And I wait for 10 sec
    And I click element c2m.outage_personmenu
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I hover over element c2m.log_cc
    And I wait for 10 sec
    And I click element c2m.add_log_cc
    And I wait for 10 sec
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I wait 15 seconds for element c2m.tab_page_frame to display
    And I switch to frame c2m.tab_page_frame
    And I wait for 10 sec
    And I select "Postal" option by text from dropdown c2m.pre_contact_method
    And I wait for 5 sec
    And I select "Outage" option by text from dropdown c2m.contactclass_logcc
    And I wait for 5 sec
    And I enter "PLANOUT" into input field c2m.contacttype_logcc
    And I wait for 5 sec
    And I press "TAB" key into input field c2m.contacttype_logcc
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I click element c2m.save

  #@account
  Scenario: Verify User can Adding a Service Point(CI_71)

    When I switch to frame c2m.main_frame
    And I wait 20 seconds for element c2m.controlcentralsearch_button to display
    And I click on element c2m.controlcentralsearch_button
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I wait 15 seconds for element c2m.tab_page_frame to display
    And I switch to frame c2m.tab_page_frame
    And I select "2" option by index from dropdown c2m.search_by_list
    And I wait 10 seconds for element c2m.accountid1 to display
    And I enter credentials.accountid1 into input field c2m.accountid1
    And I click element c2m.search
    And I wait 10 seconds for element c2m.case_cust_frame to display
    And I switch to frame c2m.case_cust_frame
    And I click on element c2m.premise_context_menu
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I hover over element c2m.goto_servicepoint
    And I click element c2m.add_servicepoint
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.ui_frame
    And I select "3" option by index from dropdown c2m.servicepoint_type
    And I click on element c2m.ok_button
    And I select "9" option by index from dropdown c2m.timezone_dropdown
    And I enter credentials.premise_box into input field c2m.premise_box
    And I press "TAB" key into input field c2m.premise_box
    Then I click on element c2m.save_button

  @account
  Scenario Outline: Verify User is able to Validate Address and Create Premise/SP(CI_46)

    When I switch to frame c2m.main_frame
    And I wait 20 seconds for element c2m.topmenu to display
    And I click element c2m.topmenu
    And I hover over element c2m.customerinfo
    And I hover over element c2m.premise
    And I click element c2m.add_premise
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.tab_page_frame
    And I select "<Premise Type>" option by text from dropdown c2m.premisetype_dropdown
    And I enter credentials.addpremise_address_details1 into input field c2m.addpremise_address_details
    And I press "TAB" key into input field c2m.addpremise_address_details
    And I enter credentials.addpremise_city1 into input field c2m.addpremise_city_name
    And I enter credentials.addpremise_state1 into input field c2m.addpremise_state_name
    And I press "TAB" key into input field c2m.addpremise_state_name
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I click on element c2m.save
    And I accept alert
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.tab_page_frame
    And I click on element c2m.premise_context_menu1
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I hover over element c2m.goto_servicepoint
    And I click element c2m.add_servicepoint
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.ui_frame
    And I select "<Service Point Type>" option by text from dropdown c2m.servicepoint_type
    And I click on element c2m.ok_button
    And I select "9" option by index from dropdown c2m.timezone_dropdown
    Then I click on element c2m.save_button

    Examples:
      |Premise Type   |Service Point Type|
      |Single-family Home|Electric Commercial|

#  @account
  Scenario: Verify User is able to Install Meter Field Activity(Selenium MTR.001)
    When I switch to frame c2m.main_frame
    And I wait 20 seconds for element c2m.topmenu to display
    And I click element c2m.topmenu
    And I hover over element c2m.communication
    And I hover over element c2m.activity
    And I click element c2m.add_activity
    #And I wait for 10 sec
    And I switch to main content
    And I switch to frame c2m.main_frame
    #And I wait for 10 sec
    And I switch to frame c2m.ui_frame
    And I select "Field Activity" option by text from dropdown c2m.activity_dropdown
    And I click on element c2m.ok_button
    And I wait for 10 sec
    And I enter credentials.servicedate_box into input field c2m.servicedate_box
    And I press "TAB" key into input field c2m.servicedate_box
    And I enter credentials.servicepoint_box into input field c2m.servicepoint_box
    And I select "Install Meter" option by text from dropdown c2m.fieldtask_dropdown
    And I click on element c2m.save_button
    Then I should see page title as "Activity"
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I wait 15 seconds for element c2m.tab_page_frame to display
    And I switch to frame c2m.tab_page_frame
    #And I wait for 10 sec
    #And I switch to frame c2m.tab_page_frame
    And I wait 15 seconds for element c2m.zonemapframe_4 to display
    And I switch to frame c2m.zonemapframe_4
    And I wait 15 seconds for element c2m.activity_hierarchy to display
    Then element c2m.activity_hierarchy should be present

  #@account
#  @account
  Scenario: Verify User is able to Remove Meter Field Activity(Selenium MTR.003)
    When I switch to frame c2m.main_frame
    And I wait 20 seconds for element c2m.topmenu to display
    And I click element c2m.topmenu
    And I hover over element c2m.communication
    And I hover over element c2m.activity
    And I click element c2m.add_activity
    #And I wait for 10 sec
    And I switch to main content
    And I switch to frame c2m.main_frame
    #And I wait for 10 sec
    And I switch to frame c2m.ui_frame
    And I select "Field Activity" option by text from dropdown c2m.activity_dropdown
    And I click on element c2m.ok_button
    And I wait for 10 sec
    And I enter credentials.servicedate_remove into input field c2m.servicedate_box
    And I press "TAB" key into input field c2m.servicedate_box
    And I enter credentials.servicepoint_box into input field c2m.servicepoint_box
    And I select "Remove Meter" option by text from dropdown c2m.fieldtask_dropdown
    And I click on element c2m.save_button
    Then I should see page title as "Activity"


  #@account
#  @account
  Scenario: Verify User can Manually Generate a Bill(BIL.001)

    When I switch to frame c2m.main_frame
    And I wait 20 seconds for element c2m.controlcentralsearch_button to display
    And I click on element c2m.controlcentralsearch_button
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I wait 15 seconds for element c2m.tab_page_frame to display
    And I switch to frame c2m.tab_page_frame
    And I select "2" option by index from dropdown c2m.search_by_list
    And I wait 10 seconds for element c2m.accountid1 to display
    And I enter "7697669556" into input field c2m.accountid1
    And I click element c2m.search
    And I wait for 10 sec
    #And I switch to frame c2m.zonemapframe7
    #And I click element c2m.premise_info
    #And I switch to main content
    #And I switch to frame c2m.main_frame
    #And I wait 15 seconds for element c2m.tab_page_frame to display
    #And I switch to frame c2m.tab_page_frame
    #And I click element c2m.device_config_link
    #And I wait for 10 sec
    #And I click element c2m.new_read
    #And I switch to main content
    #And I switch to frame c2m.main_frame
    #And I wait 5 seconds for element c2m.ui_frame to display
    #And I switch to frame c2m.ui_frame
    #And I wait for 5 sec
    #And I clear input field c2m.new_read_date
    #And I enter "06-03-2022" into input field c2m.new_read_date
    #And I enter "2500" into input field c2m.reading
    #And I select "Regular" option by text from dropdown c2m.measure_condition
    #And I wait for 5 sec
    #And I click element c2m.reading_save
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I wait 15 seconds for element c2m.dashboard_frame to display
    And I switch to frame c2m.dashboard_frame
    And I wait 15 seconds for element c2m.servicezonemap_frame to display
    And I switch to frame c2m.servicezonemap_frame
    And I wait for 10 sec
    And I click on element c2m.service_img
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I wait for 10 sec
    And I hover over element c2m.goto_bill
    And I click element c2m.bill_add
    And I wait for 10 sec
    And I switch to frame c2m.tab_page_frame
    And I click element c2m.generate_bill
    And I wait for 10 sec
    And I switch to new window
    And I wait for 10 sec
    And I enter "06-03-2022" into input field c2m.cutoff_date
    And I click element c2m.generate_bill
    And I switch to previous window
    And I wait for 10 sec
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.tab_page_frame
    And I click element c2m.freeze
    And I wait for 10 sec
    And I click element c2m.service_complete
    And I wait for 10 sec
    And I switch to new window
    And I wait for 10 sec
    And I enter "06-03-2022" into input field c2m.complete_date
    And I click element c2m.service_complete
    And I switch to previous window
    And I wait for 10 sec
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.tab_page_frame
    And I click element c2m.service_complete


  #@account
#  @account
  Scenario: Verify User is able to cancel a Bill Segment(BIL.002)
    #When I switch to frame c2m.main_frame
    #And I wait 20 seconds for element c2m.topmenu to display
    #And I click element c2m.topmenu
    #And I click element c2m.menu_financial
    #And I hover over element c2m.goto_bill
    #And I click element c2m.bill_search
    When I switch to frame c2m.main_frame
    And I wait 20 seconds for element c2m.controlcentralsearch_button to display
    And I click on element c2m.controlcentralsearch_button
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I wait 5 seconds for element c2m.tab_page_frame to display
    And I switch to frame c2m.tab_page_frame
    And I select "2" option by index from dropdown c2m.search_by_list
    And I wait 10 seconds for element c2m.accountid1 to display
    And I enter "7697669556" into input field c2m.accountid1
    And I click element c2m.search
    And I wait for 10 sec
    #And I wait 10 seconds for element c2m.case_cust_frame to display
    #And I switch to frame c2m.case_cust_frame
    #And I click on element c2m.case_contextmenu
    #And I switch to main content
    #And I switch to frame c2m.main_frame
    #And I wait for 10 sec
    #And I hover over element c2m.goto_bill
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I wait 15 seconds for element c2m.dashboard_frame to display
    And I switch to frame c2m.dashboard_frame
    And I wait 15 seconds for element c2m.servicezonemap_frame to display
    And I switch to frame c2m.servicezonemap_frame
    And I wait for 10 sec
    And I click on element c2m.service_img
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I wait for 10 sec
    And I hover over element c2m.goto_bill
    And I click element c2m.bill_search
    And I wait for 10 sec
    And I switch to new window
    And I wait for 10 sec
    And I switch to main content
    And I wait 20 seconds for element c2m.servicestop_frame to display
    And I switch to frame c2m.servicestop_frame
    And I click element c2m.bill_id
    And I switch to previous window
    And I wait for 10 sec
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I wait 5 seconds for element c2m.tab_page_frame to display
    And I switch to frame c2m.tab_page_frame
    And I switch to frame c2m.grid_frame
    And I click element c2m.bill_link
    And I wait for 10 sec
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I wait 5 seconds for element c2m.tab_page_frame to display
    And I switch to frame c2m.tab_page_frame
    And I click element c2m.init_billcancel
    And I switch to new window
    And I wait for 10 sec
    And I select "Wrong rate" option by text from dropdown c2m.cancel_reason
    And I click element c2m.init_billcancel
    And I switch to previous window
    And I wait for 10 sec
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I wait 5 seconds for element c2m.tab_page_frame to display
    And I switch to frame c2m.tab_page_frame
    And I click element c2m.cancel_bill


  #@account
#  @account
  Scenario: Verify User is able to cancel/Rebill a Bill Segment(BIL.003)
    #When I switch to frame c2m.main_frame
    #And I wait 20 seconds for element c2m.topmenu to display
    #And I click element c2m.topmenu
    #And I click element c2m.menu_financial
    #And I hover over element c2m.goto_bill
    #And I click element c2m.bill_search
    When I switch to frame c2m.main_frame
    And I wait 20 seconds for element c2m.controlcentralsearch_button to display
    And I click on element c2m.controlcentralsearch_button
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I wait 5 seconds for element c2m.tab_page_frame to display
    And I switch to frame c2m.tab_page_frame
    And I select "2" option by index from dropdown c2m.search_by_list
    And I wait 10 seconds for element c2m.accountid1 to display
    And I enter "7697669556" into input field c2m.accountid1
    And I click element c2m.search
    And I wait for 10 sec
    And I wait 10 seconds for element c2m.case_cust_frame to display
    And I switch to frame c2m.case_cust_frame
    And I click on element c2m.case_contextmenu
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I wait for 10 sec
    And I hover over element c2m.goto_bill
    And I click element c2m.bill_search
    And I wait for 10 sec
    And I switch to new window
    And I wait for 10 sec
    And I switch to main content
    And I wait 20 seconds for element c2m.servicestop_frame to display
    And I switch to frame c2m.servicestop_frame
    And I click element c2m.bill_id
    And I switch to previous window
    And I wait for 10 sec
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I wait 5 seconds for element c2m.tab_page_frame to display
    And I switch to frame c2m.tab_page_frame
    And I switch to frame c2m.grid_frame
    And I click element c2m.bill_link
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I wait 5 seconds for element c2m.tab_page_frame to display
    And I switch to frame c2m.tab_page_frame
    And I click element c2m.rebill
    And I switch to new window
    And I wait for 10 sec
    And I select "Wrong read" option by text from dropdown c2m.cancel_reason
    And I click element c2m.rebill
    And I switch to previous window
    And I wait for 10 sec
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.tab_page_frame
    And I click element c2m.freeze
    And I wait for 10 sec
    And I click element c2m.bill_img
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I click element c2m.img_gotobill

 # @account
#  @account
  Scenario: Verify User is able to Setup a Maximum Bill Threshold(BIL.004)
    When I switch to frame c2m.main_frame
    And I wait 20 seconds for element c2m.controlcentralsearch_button to display
    And I click on element c2m.controlcentralsearch_button
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I wait 5 seconds for element c2m.tab_page_frame to display
    And I switch to frame c2m.tab_page_frame
    And I select "2" option by index from dropdown c2m.search_by_list
    And I wait 10 seconds for element c2m.accountid1 to display
    And I enter "7697669556" into input field c2m.accountid1
    And I click element c2m.search
    And I wait for 10 sec
    And I click element c2m.sa_premiselist
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I click element c2m.premiselist_gotosa
    And I wait 5 seconds for element c2m.tab_page_frame to display
    And I switch to frame c2m.tab_page_frame
    And I clear input field c2m.max_bill_threshold
    And I enter "2500" into input field c2m.max_bill_threshold
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I click element c2m.save

 # @account
#  @account
  Scenario: Verify User is able to update Service Cycle which Updates Billing Cycle(BIL.005)
    When I switch to frame c2m.main_frame
    And I wait 20 seconds for element c2m.controlcentralsearch_button to display
    And I click on element c2m.controlcentralsearch_button
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I wait 5 seconds for element c2m.tab_page_frame to display
    And I switch to frame c2m.tab_page_frame
    And I select "2" option by index from dropdown c2m.search_by_list
    And I wait 10 seconds for element c2m.accountid1 to display
    And I enter "7697669556" into input field c2m.accountid1
    And I click element c2m.search
    And I wait for 10 sec
    #And I switch to frame c2m.zonemap_frame12
    #And I scroll to element c2m.premise_img
    #And I click element c2m.premise_img
    #And I switch to main content
    #And I switch to frame c2m.main_frame
    #And I click element c2m.premise_page
    #And I wait 5 seconds for element c2m.tab_page_frame to display
    #And I switch to frame c2m.tab_page_frame
    #And I switch to frame c2m.prem_tree_frame
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I wait 5 seconds for element c2m.dashboard_frame to display
    And I switch to frame c2m.dashboard_frame
    #And I wait 15 seconds for element c2m.dashboard_zonemap_frame to display
    And I switch to frame c2m.servicezonemap_frame
    And I wait for 10 sec
    And I click element c2m.sp_link
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I wait 5 seconds for element c2m.tab_page_frame to display
    And I switch to frame c2m.tab_page_frame
    And I wait for 10 sec
    And I switch to frame c2m.case_cust_frame
    And I wait for 10 sec
    And I click element c2m.edit
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.ui_frame
    And I select "Read Cycle 02" option by text from dropdown c2m.billing_cycle
    And I click element c2m.case_save
    And I wait for 10 sec
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I click on element c2m.addalert_history
    And I wait 5 seconds for element c2m.tab_page_frame to display
    And I switch to frame c2m.tab_page_frame
    And I switch to frame c2m.zonemap_frame2
    And I click on element c2m.account_link

  #@account
#  @account
  Scenario Outline: Validate Rate Change properly syncs Rate History(BIL.007)
    When I switch to frame c2m.main_frame
    And I wait 20 seconds for element c2m.controlcentralsearch_button to display
    And I click on element c2m.controlcentralsearch_button
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I wait 5 seconds for element c2m.tab_page_frame to display
    And I switch to frame c2m.tab_page_frame
    And I select "2" option by index from dropdown c2m.search_by_list
    And I wait 10 seconds for element c2m.accountid1 to display
    And I enter "<accountId>" into input field c2m.accountid1
    And I click element c2m.search
    And I wait for 10 sec
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I wait 15 seconds for element c2m.dashboard_frame to display
    And I switch to frame c2m.dashboard_frame
    And I wait 15 seconds for element c2m.servicezonemap_frame to display
    And I switch to frame c2m.servicezonemap_frame
    And I click on element c2m.service_img
    And I wait for 10 sec
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I hover over element c2m.goto_serviceagreement
    And I click element c2m.goto_searchservice
    And I wait for 10 sec
    And I switch to new window
    And I wait for 10 sec
    And I switch to main content
    And I switch to frame c2m.servicestop_frame
    And I click element c2m.stop_activeservice
    And I wait for 10 sec
    And I switch to previous window
    And I wait for 10 sec
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.menu_frame
    And I click element c2m.rateinfo_tab
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I wait 5 seconds for element c2m.tab_page_frame to display
    And I switch to frame c2m.tab_page_frame
    And I switch to frame c2m.rate_frame
    And I click element c2m.rateinfo_plusicon
    And I clear input field c2m.rateinfo_date
    And I enter "<date>" into input field c2m.rateinfo_date
    And I wait for 5 sec
    And I enter "<rate>" into input field c2m.rateinfo_rate
    And I wait for 5 sec
    And I press "TAB" key into input field c2m.rateinfo_rate
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I click element c2m.save
    And I wait 5 seconds for element c2m.tab_page_frame to display
    And I switch to frame c2m.tab_page_frame
    And I switch to frame c2m.sar_tree_frame
    And I click element c2m.ratesa_context
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I click element c2m.rate_usage

    Examples:
      |accountId |date      |rate |
      |7697669556|01-06-2022|E-TOU|

# @account
  Scenario Outline: Validate the Service Agreement syncs from C2M to MDM(CI.009)
    And I switch to frame c2m.main_frame
    And I wait for 10 sec
    And I click element c2m.topmenu
    And I wait for 5 sec
    And I hover over element c2m.360_search
    And I wait for 10 sec
    And I click element c2m.search_by_name
    And I wait 5 seconds for element c2m.tab_page_frame to display
    And I switch to frame c2m.tab_page_frame
    And I enter "<name>" into input field c2m.360_name
    And I click element c2m.name_search
    And I click element c2m.usage_subscription


    Examples:
      |name           |
      |Testing,Mon0401|

# @account
   # @account
  Scenario Outline: Verify User is able to Add a Device(DM.001)
    And I switch to frame c2m.main_frame
    And I wait for 10 sec
    And I click element c2m.topmenu
    And I wait for 5 sec
    And I hover over element c2m.asset_management
    And I hover over element c2m.asset
    And I click element c2m.asset_add
    And I switch to frame c2m.ui_frame
    And I wait for 10 sec
    And I clear input field c2m.asset_date
    And I wait for 10 sec
    And I enter "<date>" into input field c2m.asset_date
    And I press "TAB" key into input field c2m.asset_date
    And I press "TAB" key into input field c2m.cal_img
    And I enter "<time>" into input field c2m.asset_time
    And I select "<assetType>" option by text from dropdown c2m.asset_type
    And I select "<serviceLocation>" option by text from dropdown c2m.asset_service_location
    And I click element c2m.asset_ok
    And I clear input field c2m.asset_creation_date
    And I enter "<date>" into input field c2m.asset_creation_date
    And I wait for 10 sec
    And I press "TAB" key into input field c2m.asset_creation_date
    And I press "TAB" key into input field c2m.cal_img
    And I enter "<time>" into input field c2m.asset_creation_time
    And I select "<specification>" option by text from dropdown c2m.asset_spec
    And I wait for 10 sec
    And I enter "<badgeNo>" into input field c2m.asset_badgeno
    And I enter "<serialNo>" into input field c2m.asset_serialno
    And I select "<firmwareVersion>" option by text from dropdown c2m.asset_firmware_version
    And I select "<nicFirmwareVersion>" option by text from dropdown c2m.nic_firmware_version
    And I select "<measurementConfig>" option by text from dropdown c2m.measurement_config
    And I click element c2m.case_save
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I wait 30 seconds for element c2m.tab_page_frame to display
    And I switch to frame c2m.tab_page_frame
    And element c2m.zone_map_frame should be present
    And I switch to frame c2m.zone_map_frame
    And I click element c2m.asset_store
    And I switch to main content
    And I wait for 10 sec
    And I switch to new window
    And I wait for 5 sec
    And I wait 10 seconds for element c2m.store_date to display
    And I clear input field c2m.store_date
    And I enter "<date>" into input field c2m.store_date
    And I wait for 5 sec
    And I press "TAB" key into input field c2m.store_time
    And I press "TAB" key into input field c2m.cal_img
    And I enter "<storeTime>" into input field c2m.store_time
    And I click element c2m.store_save
    And I wait for 10 sec
    And I switch to previous window
    And I wait for 10 sec
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I click element c2m.topmenu
    And I wait for 5 sec
    And I hover over element c2m.360_search
    And I wait for 10 sec
    And I click element c2m.search_by_device
    And I wait 10 seconds for element c2m.tab_page_frame to display
    And I switch to frame c2m.tab_page_frame
    And I wait for 10 sec
    And I select "Badge Number" option by text from dropdown c2m.search_identifiertype
    And I wait for 10 sec
    And I enter "<badgeNo>" into input field c2m.search_identifiervalue
    And I wait for 10 sec
    And I click element c2m.search_device
    And I wait for 10 sec
    And I click element c2m.device_search
    And I switch to frame c2m.zone_map_frame
    And I click element c2m.device_link

#C2MDEMO
   # Examples:
      #|date       |time    |assetType            |serviceLocation                        |specification                  |badgeNo        |serialNo       |firmwareVersion|nicFirmwareVersion|measurementConfig                  |storeTime|storeLocation                                  |
      #|01-01-2020 |0:00:00 |Electric Analog Meter|Pleasanton Lost Location,5805 Owens Dr.|Accumeter Electric Analog Meter|Sample_EAM_0518|Sample_EAM_0518|1.2.0          |1.0.5             |Electric Manual Read - kWh - Scalar|1:00:00  |Pleasanton Satellite Storeroom,5815 Owens Drive|
#C2MDEV
      Examples:
        |date       |time    |assetType       |serviceLocation                                |specification         |badgeNo        |serialNo       |firmwareVersion|nicFirmwareVersion|measurementConfig                |storeTime|storeLocation                                  |
        |01-01-2020 |0:00:00 |Electric Type 5E|Pleasanton Satellite Storeroom,5815 Owens Drive|5E L+G E331/ER51 FOCUS|Sample_EAM_0522|Sample_EAM_0522|2.2.0          |2.2.0             |Electric Auto Read - kWh - Scalar|1:00:00  |Pleasanton Satellite Storeroom,5815 Owens Drive|

# @account
 # @account
  Scenario Outline: Validate Install Event syncs from MDM to ODM(DM.002)
    And I switch to frame c2m.main_frame
    And I wait for 10 sec
    And I click element c2m.topmenu
    And I wait for 5 sec
    And I hover over element c2m.device_installation
    And I wait for 5 sec
    And I hover over element c2m.install_event
    And I click element c2m.event_add
    And I switch to frame c2m.ui_frame
    And I enter "<deviceConfig ID>" into input field c2m.device_configid
    And I press "TAB" key into input field c2m.device_configid
    And I enter "<SPID>" into input field c2m.spid
    And I press "TAB" key into input field c2m.spid
    And I click element c2m.event_ok
    And I enter "<installationDate>" into input field c2m.install_date
    And I press "TAB" key into input field c2m.install_date
    And I press "TAB" key into input field c2m.cal_img
    And I enter "<installationTime>" into input field c2m.install_time
    And I enter "<installationConstant>" into input field c2m.install_constant
    And I click element c2m.install_save
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I wait 30 seconds for element c2m.tab_page_frame to display
    And I switch to frame c2m.tab_page_frame
    And I switch to frame c2m.zone_map_frame
    And I click element c2m.turn_on
    And I wait for 10 sec
    And I switch to new window
    And I wait for 10 sec
    And I click element c2m.event_ok
    And I wait for 10 sec
    And I switch to previous window
    And I wait for 10 sec
    And I switch to main content
    And I switch to frame c2m.main_frame
    #And I click element c2m.save
    And I click element c2m.topmenu
    And I wait for 5 sec
    And I hover over element c2m.360_search
    And I wait for 10 sec
    And I click element c2m.search_by_device
    And I wait 10 seconds for element c2m.tab_page_frame to display
    And I switch to frame c2m.tab_page_frame
    And I wait for 10 sec
    And I select "Badge Number" option by text from dropdown c2m.search_identifiertype
    And I wait for 10 sec
    And I enter "<badgeNo>" into input field c2m.search_identifiervalue
    And I wait for 10 sec
    And I click element c2m.search_device
    And I wait for 10 sec
    And I click element c2m.device_search
    And I switch to frame c2m.zone_map_frame
    And I click element c2m.device_link
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I wait for 10 sec
    And I click element c2m.topmenu
    And I wait for 5 sec
    And I hover over element c2m.asset_management
    And I hover over element c2m.asset
    And I click element c2m.asset_search
    #And I switch to main content
    #And I switch to frame c2m.main_frame
    And I wait 30 seconds for element c2m.tab_page_frame to display
    And I switch to frame c2m.tab_page_frame
    And I select "<assetIdentifier>" option by text from dropdown c2m.asset_identifier
    And I enter "<assetID>" into input field c2m.assetid
    And I click element c2m.search
    And I click element c2m.asset_link

    Examples:
      |deviceConfig ID|installationDate|installationTime|installationConstant|SPID        |badgeNo        |assetIdentifier |assetID     |
      |389961528282   |01-02-2020      |0:00:00         |1                   |613906386027|Sample_EAM_0507|Asset Identifier|369412857890|

# @account
  Scenario Outline: Verify user is able to Update Measuring Component(DM.003)
    And I switch to frame c2m.main_frame
    And I wait for 10 sec
    And I click element c2m.topmenu
    And I wait for 5 sec
    And I hover over element c2m.device
    And I wait for 5 sec
    And I hover over element c2m.measuring_component
    And I click element c2m.component_search
    And I wait 30 seconds for element c2m.tab_page_frame to display
    And I switch to frame c2m.tab_page_frame
    And I select "<deviceIdentifier>" option by text from dropdown c2m.asset_identifier
    And I select "<identifierType>" option by text from dropdown c2m.identifier_type
    And I enter "<identifierValue>" into input field c2m.identifier_value
    And I click element c2m.search
    And I click element c2m.measuring_component_img
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I click element c2m.goto_measuring_component
    And I wait 30 seconds for element c2m.tab_page_frame to display
    And I switch to frame c2m.tab_page_frame
    And I switch to frame c2m.zone_map_frame
    And I click element c2m.measuring_component_edit
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I wait for 10 sec
    And I wait 10 seconds for element c2m.ui_frame to display
    And I switch to frame c2m.ui_frame
    And I wait for 5 sec
    And I clear input field c2m.register_multiplier
    And I enter "<registerMultiplier>" into input field c2m.register_multiplier
    And I click element c2m.save_button

    Examples:
      |deviceIdentifier     |identifierType    |identifierValue|registerMultiplier |
      |Device Identifier    |Badge Number      |Sample_EAM_0507|4.000000           |

#  @account
  Scenario Outline: Verify user is able to Adding a Manual To Do(TDS.001)
    And I switch to frame c2m.main_frame
    And I wait for 10 sec
    And I click element c2m.topmenu
    And I wait for 5 sec
    And I hover over element c2m.todo
    And I wait for 5 sec
    And I hover over element c2m.todo_entry
    And I wait for 5 sec
    And I click element c2m.todo_add
    And I switch to frame c2m.ui_frame
    And I enter "<Subject>" into input field c2m.todo_subject
    And I enter "<Comment>" into input field c2m.todo_comments
    And I select "<Override Priority>" option by text from dropdown c2m.override_priority
    And I click element c2m.characteristic_value
    And I wait for 10 sec
    And I switch to new window
    And I wait for 10 sec
    And I select "<search_by_list>" option by text from dropdown c2m.search_by_list
    And I enter "<Account_ID>" into input field c2m.account_id
    And I click element c2m.search
    And I wait for 10 sec
    And I switch to previous window
    And I wait for 10 sec
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.ui_frame
    And I click element c2m.save_button

    Examples:
      |Subject     |Override Priority     |Comment  |Account_ID|search_by_list|
      |NGTP Testing|Priority 10 -- Highest|NGTP Test|3815827032|Account ID    |

# @account
  Scenario Outline: Verify user is able to complete a To Do(TDS.002)
    And I switch to frame c2m.main_frame
    And I wait for 10 sec
    And I click element c2m.topmenu
    And I wait for 5 sec
    And I hover over element c2m.todo
    And I wait for 5 sec
    And I hover over element c2m.todo_entry
    And I wait for 5 sec
    And I click element c2m.todo_search
    And I wait 10 seconds for element c2m.tab_page_frame to display
    And I switch to frame c2m.tab_page_frame
    And I select "<search_by_list>" option by text from dropdown c2m.search_by_list
    And I enter "<TODO_ID>" into input field c2m.account_id
    And I click element c2m.search
    And I click element c2m.todo_id_link
    And I switch to frame c2m.zone_map_frame
    And I click element c2m.todo_complete
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.ui_frame
    And I enter "<TODO_Log_Entry>" into input field c2m.todo_logentry
    Then I click on element c2m.save_button


    Examples:
      |TODO_ID        |search_by_list          |TODO_Log_Entry|
      |92213687041553 |To Do Entry Identifier  |Complete      |

#   _____________________________________________SHANAWAZ FEATURE FILE CODE_________________________________________

  #  @account
  Scenario: Verify User can add Premise

    When I switch to frame c2m.main_frame
    And I wait 20 seconds for element c2m.menu to display
    And I enter "Add Premise" into input field c2m.menu
    And I click on element c2m.addpremise_label
    And I wait 30 seconds for element c2m.tab_page_frame to display
    And I switch to frame c2m.tab_page_frame
    And I select "2" option by index from dropdown c2m.addpremise_search_by_list
    And I enter credentials.addpremise_zipcode into input field c2m.addpremise_zipcode_details
    And I press "TAB" key into input field c2m.cis_division
    And I select "3" option by index from dropdown c2m.cis_division
    And I enter credentials.addpremise_address into input field c2m.addpremise_address_details
    And I enter credentials.addpremise_city into input field c2m.addpremise_city_name
    And I enter credentials.addpremise_county into input field c2m.addpremise_county_name
    And I enter credentials.addpremise_state into input field c2m.addpremise_state_name
    And I press "TAB" key into input field c2m.addpremise_state_name
    Then I switch to main content
    And I switch to frame c2m.main_frame
    Then I click element c2m.save

#  @account
  Scenario: Verify User can Add a Service Point(CI_71)

    When I switch to frame c2m.main_frame
    And I wait 20 seconds for element c2m.controlcentralsearch_button to display
    And I click on element c2m.controlcentralsearch_button
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I wait 15 seconds for element c2m.tab_page_frame to display
    And I switch to frame c2m.tab_page_frame
    And I select "2" option by index from dropdown c2m.search_by_list
    And I wait 10 seconds for element c2m.deposit_sa_accountid to display
    And I enter credentials.deposit_sa_accountid into input field c2m.deposit_sa_accountid
    And I click element c2m.search
    And I wait 10 seconds for element c2m.zone_map_frame to display
    And I switch to frame c2m.zone_map_frame
    And I click on element c2m.premise_context_menu
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I hover over element c2m.goto_servicepoint
    And I click element c2m.add_servicepoint
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.ui_frame
    And I select "3" option by index from dropdown c2m.servicepoint_type
    And I click on element c2m.ok_button
    And I select "9" option by index from dropdown c2m.timezone_dropdown
    And I enter credentials.premise_box into input field c2m.premise_box
    And I press "TAB" key into input field c2m.premise_box
    Then I click on element c2m.save_button

#  @account
  Scenario Outline: Verify user is able to create C2M Account by creating new Person with different name type

    And I switch to frame c2m.main_frame
    When I wait 20 seconds for element c2m.menu to display
    And I enter "Add Person" into input field c2m.menu
    And I click on element c2m.addperson_label
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I wait 15 seconds for element c2m.tab_page_frame to display
    And I switch to frame c2m.tab_page_frame
    And I select "2" option by index from dropdown c2m.lifesupportoption
    And I enter "Test Description" into input field c2m.notes
    And I wait 10 seconds for element c2m.addperson_name_frame to display
    And I switch to frame c2m.addperson_name_frame
    And I select "<NameType>" option by index from dropdown c2m.nametype_dropdown
    And I enter credentials.add_person_name into input field c2m.addperson_name_details
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I wait 15 seconds for element c2m.tab_page_frame to display
    And I switch to frame c2m.tab_page_frame
    And I wait 10 seconds for element c2m.addperson_contact_frame to display
    And I switch to frame c2m.addperson_contact_frame
    And I select "3" option by index from dropdown c2m.addperson_contact_type
    And I enter credentials.add_person_contactinfo into input field c2m.addperson_contactinfo
    And I press "TAB" key into input field c2m.addperson_checkbox
    And I check the checkbox c2m.addperson_checkbox
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I wait 15 seconds for element c2m.tab_page_frame to display
    And I switch to frame c2m.tab_page_frame
    And I wait 15 seconds for element c2m.peridentifier_frame to display
    And I switch to frame c2m.peridentifier_frame
    And I put random number into input field c2m.ssn
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I click element c2m.save
    And I wait for 10 sec
    Then I should see page title as "Start/Stop"
    And I switch to frame c2m.tab_page_frame
    And I wait 15 seconds for element c2m.account_info to display
    Then element c2m.account_info should be present
    Then get me the text from c2m.account_info element

    Examples:
      |NameType|
      | 6 |

#  @account
  Scenario Outline: Verify User is able to create new account with different customer class

    When I switch to frame c2m.main_frame
    And I wait 20 seconds for element c2m.menu to display
    And I enter "Add Account" into input field c2m.menu
    And I click on element c2m.addaccount_label
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I wait 15 seconds for element c2m.tab_page_frame to display
    And I switch to frame c2m.tab_page_frame
    And I select "<CustomerClass>" option by index from dropdown c2m.customerclass_dropdown
    And I wait for 5 sec
    And I accept alert
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.menu_frame
    And I click element c2m.person
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.tab_page_frame
    And I enter "0548721201" into input field c2m.personname
    And I press "TAB" key into input field c2m.personname
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.menu_frame
    And I click element c2m.main_tab
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I wait 30 seconds for element c2m.tab_page_frame to display
    And I switch to frame c2m.tab_page_frame
    And I select "2" option by index from dropdown c2m.cis_division
    And I wait for 5 sec
    And I accept alert
    And I enter "1913092348" into input field c2m.premise_id
    And I press "TAB" key into input field c2m.premise_id
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I click element c2m.save

    Examples:
      |CustomerClass|
      |      2      |
      |      3      |
      |      4      |
      |      5      |
      |      6      |

#  @account
  Scenario Outline: Verify User is able to Validate Address and Create Premise/SP(CI_46)

    When I switch to frame c2m.main_frame
    And I wait 20 seconds for element c2m.topmenu to display
    And I click element c2m.topmenu
    And I hover over element c2m.customerinfo
    And I hover over element c2m.premise
    And I click element c2m.add_premise
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.tab_page_frame
    And I select "<Premise Type>" option by text from dropdown c2m.premisetype_dropdown
    And I enter credentials.addpremise_address_details1 into input field c2m.addpremise_address_details
    And I press "TAB" key into input field c2m.addpremise_address_details
    And I enter credentials.addpremise_city1 into input field c2m.addpremise_city_name
    And I enter credentials.addpremise_state1 into input field c2m.addpremise_state_name
    And I press "TAB" key into input field c2m.addpremise_state_name
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I click on element c2m.save
    And I accept alert
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.tab_page_frame
    And I click on element c2m.premise_context_menu1
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I hover over element c2m.goto_servicepoint
    And I click element c2m.add_servicepoint
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.ui_frame
    And I select "<Service Point Type>" option by text from dropdown c2m.servicepoint_type
    And I click on element c2m.ok_button
    And I select "9" option by index from dropdown c2m.timezone_dropdown
    Then I click on element c2m.save_button

    Examples:
      |Premise Type   |Service Point Type|
      |Single-family Home  |Electric Commercial|

#  @account
  Scenario Outline: Verify User is able to Create a Deposit SA(CI.008)

    When I switch to frame c2m.main_frame
    And element c2m.controlcentralsearch_button should be present
    And I click on element c2m.controlcentralsearch_button
    And I switch to main content
    And I switch to frame c2m.main_frame
    And element c2m.tab_page_frame should be present
    And I switch to frame c2m.tab_page_frame
    And I select "<SEARCH BY>" option by text from dropdown c2m.search_by_list
    And element c2m.accountid should be present
    And I enter "<ACCOUNT ID>" into input field c2m.accountid
    And I select "<CIS DIVISION>" option by text from dropdown c2m.cis_division
    And I click element c2m.search
    And element c2m.zone_map_frame should be present
    And I switch to frame c2m.zone_map_frame
    And I click on element c2m.account_context_menu
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I hover over element c2m.goto_serviceagreement
    And I click element c2m.add_serviceagreement
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.tab_page_frame
    And I select "<DIVISION>" option by text from dropdown c2m.division
    And I enter "<SA TYPE>" into input field c2m.satype_box
    And I press "TAB" key into input field c2m.satype_box
    And I enter "<CHAR PREMISE ID>" into input field c2m.charpremiseid_box
    And I press "TAB" key into input field c2m.charpremiseid_box
    And I clear input field c2m.depositamount_box
    And I enter "<DEPOSIT AMOUNT>" into input field c2m.depositamount_box
    And I press "TAB" key into input field c2m.depositamount_box
    And I switch to main content
    And I switch to frame c2m.main_frame
    Then I click element c2m.save

    Examples:
      | SEARCH BY | ACCOUNT ID | CIS DIVISION | DIVISION | SA TYPE | CHAR PREMISE ID | DEPOSIT AMOUNT |
      | Account ID | 6131518727 | California  | California | DEP-RES | 6320288652    | 100            |

#  @account
  Scenario: Verify User is able to Install Meter Field Activity(MTR.001)
    When I switch to frame c2m.main_frame
    And I wait 20 seconds for element c2m.topmenu to display
    And I click element c2m.topmenu
    And I hover over element c2m.communication
    And I hover over element c2m.activity
    And I click element c2m.add_activity
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.ui_frame
    And I select "Field Activity" option by text from dropdown c2m.activity_dropdown
    And I click on element c2m.ok_button
    And I enter credentials.servicedate_box into input field c2m.servicedate_box
    And I press "TAB" key into input field c2m.servicedate_box
    And I enter credentials.servicepoint_box into input field c2m.servicepoint_box
    And I select "Install Meter" option by text from dropdown c2m.fieldtask_dropdown
    Then I click on element c2m.save_button
    And I wait for 10 sec
    Then I should see page title as "Activity"
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.tab_page_frame
    And I switch to frame c2m.zone_map_frame
    And I click on element c2m.recordinfo_exp
    Then element c2m.activity_id_text should have text as "ACTIVITY ID"

#  @account
  Scenario Outline: Verify User is able to Add a Collection Referral Agency(CC.001)
    When I switch to frame c2m.main_frame
    And I wait 20 seconds for element c2m.controlcentralsearch_button to display
    And I click on element c2m.controlcentralsearch_button
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I wait 15 seconds for element c2m.tab_page_frame to display
    And I switch to frame c2m.tab_page_frame
    And I select "<SEARCH BY>" option by text from dropdown c2m.search_by_list
    And I wait 10 seconds for element c2m.deposit_sa_accountid to display
    And I enter credentials.deposit_sa_accountid into input field c2m.deposit_sa_accountid
    And I click element c2m.search
    And I wait 10 seconds for element c2m.zone_map_frame to display
    And I switch to frame c2m.zone_map_frame
    And I click on element c2m.account_context_menu
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I hover over element c2m.goto_collectionagency
    And I click element c2m.add_collectionagency
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.tab_page_frame
    And I enter credentials.collectionagency_box into input field c2m.collectionagency_box
    And I press "TAB" key into input field c2m.collectionagency_box
    And I enter credentials.startdate_box into input field c2m.startdate_box
    And I select "Active" option by text from dropdown c2m.referralstatus_dropdown
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.tab_page_frame
    And I switch to frame c2m.collrefhis_datagrid_frame
    And I enter credentials.creationdate_box into input field c2m.creationdate_box
    And I clear input field c2m.referralamount_box
    And I enter credentials.referralamount_box into input field c2m.referralamount_box
    And I select "Initial Referral" option by text from dropdown c2m.referralhistory_dropdown
    And I switch to main content
    And I switch to frame c2m.main_frame
    Then I click element c2m.save

    Examples:
      |SEARCH BY|
      |Account ID|

#  @account
  Scenario Outline: Verify User is able to Add a pay plan(CC.002)
    When I switch to frame c2m.main_frame
    And I wait 20 seconds for element c2m.controlcentralsearch_button to display
    And I click on element c2m.controlcentralsearch_button
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.tab_page_frame
    And I select "2" option by index from dropdown c2m.search_by_list
    And I wait 10 seconds for element c2m.deposit_sa_accountid to display
    And I enter credentials.deposit_sa_accountid into input field c2m.deposit_sa_accountid
    And I click element c2m.search
    And I wait 10 seconds for element c2m.zone_map_frame to display
    And I switch to frame c2m.zone_map_frame
    And I click on element c2m.account_context_menu
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I hover over element c2m.goto_payplan
    And I click element c2m.add_payplan
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.tab_page_frame
    And I enter credentials.type_box into input field c2m.type_box
    And I press "TAB" key into input field c2m.type_box
    And I select "<Pay Method>" option by text from dropdown c2m.paymethod_dropdown
    And I enter credentials.comment_box into input field c2m.comment_box
    And I switch to frame c2m.schedgrid_frame
    And I enter credentials.sheduleddate_box into input field c2m.sheduleddate_box
    And I enter credentials.sheduledamount_box into input field c2m.sheduledamount_box
    And I switch to main content
    And I switch to frame c2m.main_frame
    Then I click element c2m.save
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.dashboard_frame
    And I wait for 10 sec
    And I switch to frame c2m.zonemapframe_201_frame
    Then element c2m.active_plan_alert should have text as "1 Active pay plans in the last 12 months"


    Examples:
      |Pay Method|
#    |MAIBy Mail|
#    |Electronic Funds Transfer|
      |In Person |

# @account
  Scenario: Verify User is able to Cancel a Pay plan(CC.003)
    When I switch to frame c2m.main_frame
    And I wait 20 seconds for element c2m.controlcentralsearch_button to display
    And I click on element c2m.controlcentralsearch_button
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.tab_page_frame
    And I select "2" option by index from dropdown c2m.search_by_list
    And I wait 10 seconds for element c2m.deposit_sa_accountid to display
    And I enter credentials.deposit_sa_accountid into input field c2m.deposit_sa_accountid
    And I click element c2m.search
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.dashboard_frame
    And I wait for 10 sec
    And I switch to frame c2m.zonemapframe_201_frame
    And I click element c2m.active_plan_alert
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.tab_page_frame
    And I click element c2m.cancel_button
    Then option "Canceled" by text from dropdown c2m.status_dropdown should be selected

#  @account
  Scenario Outline: Verify User is able to Add a Payment Arrangement Request(CC.004)
    When I switch to frame c2m.main_frame
    And I wait 20 seconds for element c2m.controlcentralsearch_button to display
    And I click on element c2m.controlcentralsearch_button
    And I wait for 5 sec
    Then I should see page title as "Control Central Search"
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.tab_page_frame
    And I select "2" option by index from dropdown c2m.search_by_list
    And I wait 10 seconds for element c2m.utility_sa_accountid1 to display
    And I enter credentials.utility_sa_accountid1 into input field c2m.utility_sa_accountid1
    And I click element c2m.search
    And I wait for 5 sec
    Then I should see page title as "Control Central"
    And I wait 10 seconds for element c2m.zone_map_frame to display
    And I switch to frame c2m.zone_map_frame
    And I click on element c2m.account_context_menu
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I hover over element c2m.goto_payment_arrangementreq
    And I click element c2m.add_payment_arrangementreq
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.ui_frame
    And I select "<PAYMENT ARRANGEMENT REQUEST TYPE>" option by text from dropdown c2m.pymnt_arrangementreq_type
    And I click on element c2m.ok_button
    And I wait for 5 sec
    Then I should see page title as "Process Flow"
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I wait 20 seconds for element c2m.tab_page_frame to display
    And I switch to frame c2m.tab_page_frame
    And I wait 20 seconds for element c2m.zone_map_frame to display
    And I wait for 10 sec
    And I switch to frame c2m.zone_map_frame
    Then element c2m.pymnt_arrangement should have text as "Payment Arrangement Eligibility"
    And I select "<PAYMENT ARRANGEMENT REASON>" option by text from dropdown c2m.pymnt_arrangementreason_dropdown
    And I click on element c2m.next_button
    And I check checkbox c2m.service_agreement_checkbox using action
    And I click on element c2m.change_button
    And I check checkbox c2m.amount_toinclude_checkbox using action
    And I click on element c2m.amount_toinclude_okbutton
    And I clear input field c2m.no_of_installments
    And I enter credentials.no_of_installments into input field c2m.no_of_installments
    And I press "TAB" key into input field c2m.no_of_installments
    And I click on element c2m.next_button
    And I click on element c2m.finish_button

    Examples:
      |PAYMENT ARRANGEMENT REQUEST TYPE|PAYMENT ARRANGEMENT REASON|
      |PA - Select SAs / Down Payment Not Applicable / Always Eligible / No Approval|Delayed Billing|

#  @account
  Scenario Outline: Verify User is able to Add a Collection Process(CC.005)
    When I switch to frame c2m.main_frame
    And element c2m.controlcentralsearch_button should be present
    And I click on element c2m.controlcentralsearch_button
    And I wait for 5 sec
    Then I should see page title as "Control Central Search"
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.tab_page_frame
    And I select "<SEARCH BY>" option by text from dropdown c2m.search_by_list
    And element c2m.accountid should be present
    And I enter "<ACCOUNT ID>" into input field c2m.accountid
    And I select "<CIS DIVISION>" option by text from dropdown c2m.cis_division
    And I click element c2m.search
    And I wait for 5 sec
    Then I should see page title as "Control Central"
    And element c2m.zone_map_frame should be present
    And I switch to frame c2m.zone_map_frame
    And I click on element c2m.account_context_menu
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I hover over element c2m.goto_collection_process
    And I click element c2m.add_collection_process
    And I wait for 5 sec
    Then I should see page title as "Collection Process"
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.tab_page_frame
    And I enter "<COLLECTION CLASS CONTROL>" into input field c2m.collection_control_box
    And I select "<COLLECTION PROCESS TEMPLATE>" option by text from dropdown c2m.collection_temp_dropdown
    And I enter "<DAYS IN ARREARS>" into input field c2m.days_in_arrear
    And I enter "<COMMENTS>" into input field c2m.comments_box
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.menu_frame
    And I click element c2m.sas_tab
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.tab_page_frame
    And I enter "<SERVICE AGREEMENT>" into input field c2m.sa_box
    And I select "<STATUS>" option by text from dropdown c2m.collection_status_dropdown
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.menu_frame
    And I click element c2m.event_tab
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.tab_page_frame
    And I select "<COLLECTION EVENT TYPE>" option by text from dropdown c2m.collection_event_dropdown
    And I switch to main content
    And I switch to frame c2m.main_frame
    Then I click element c2m.save
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.dashboard_frame
    And I wait for 5 sec
    And I switch to frame c2m.zonemapframe_201_frame
    Then element c2m.collection_active_alert should have text as "Collection Process Active"

    Examples:
      |SEARCH BY|ACCOUNT ID|CIS DIVISION|COLLECTION CLASS CONTROL|COLLECTION PROCESS TEMPLATE|DAYS IN ARREARS|COMMENTS|SERVICE AGREEMENT|STATUS|COLLECTION EVENT TYPE|
      |Account ID|7697669556|Division 1 |DIV1-RES-STD            |Normal deposit             |40             |NGTP Testing|7694662711   |Active|Cancel payment plan  |

#  @account
  Scenario Outline: Verify User is able to Add a Severance Process(CC.006)
    When I switch to frame c2m.main_frame
    And element c2m.controlcentralsearch_button should be present
    And I click on element c2m.controlcentralsearch_button
    And I wait for 5 sec
    Then I should see page title as "Control Central Search"
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.tab_page_frame
    And I select "<SEARCH BY>" option by text from dropdown c2m.search_by_list
    And element c2m.accountid should be present
    And I enter "<ACCOUNT ID>" into input field c2m.accountid
    And I select "<CIS DIVISION>" option by text from dropdown c2m.cis_division
    And I click element c2m.search
    And I wait for 5 sec
    Then I should see page title as "Control Central"
    And element c2m.zone_map_frame should be present
    And I switch to frame c2m.zone_map_frame
    And I click on element c2m.account_context_menu
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I hover over element c2m.goto_severance_process
    And I click element c2m.add_severance_process
    And I switch to main content
    And I wait for 10 sec
    And I switch to new window
    And I enter "<SERVICE AGREEMENT>" into input field c2m.utility_sa_id_box
    And I click element c2m.sasearch_button
    And I switch to previous window
    Then I should see page title as "Severance Process"
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.tab_page_frame
    And I select "<SEVERANCE PROCESS TEMPLATE>" option by text from dropdown c2m.severance_template_dropdown
    And I enter "<COMMENTS>" into input field c2m.comments_box
    And I enter "<SEVERANCE AMOUNT BASE DATE>" into input field c2m.severance_amount_date
    Then option "Active" by text from dropdown c2m.severance_status should be selected
    And I switch to main content
    And I switch to frame c2m.main_frame
    Then I click element c2m.save
    And I wait for 5 sec
    And I accept alert
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.dashboard_frame
    And I wait for 10 sec
    And I switch to frame c2m.zonemapframe_201_frame
    Then element c2m.severance_active_alert should have text as "Severance Process Active"

    Examples:
      |SEARCH BY|ACCOUNT ID|CIS DIVISION|SERVICE AGREEMENT|SEVERANCE PROCESS TEMPLATE|COMMENTS|SEVERANCE AMOUNT BASE DATE|
      |Account ID|7697669556|Division 1 |7694662711       |Standard utility severance|NGTP Test Severance Process|03-31-2022|

#  @account
  Scenario Outline: Verify User is able to Add a Write Off Process(CC.007)
    When I switch to frame c2m.main_frame
    And I wait 20 seconds for element c2m.controlcentralsearch_button to display
    And I click on element c2m.controlcentralsearch_button
    And I wait for 5 sec
    Then I should see page title as "Control Central Search"
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.tab_page_frame
    And I select "<SEARCH BY>" option by text from dropdown c2m.search_by_list
    And I wait 10 seconds for element c2m.accountid to display
    And I enter "<ACCOUNT ID>" into input field c2m.accountid
    And I select "<CIS DIVISION>" option by text from dropdown c2m.cis_division
    And I click element c2m.search
    And I wait for 5 sec
    Then I should see page title as "Control Central"
    And I wait 10 seconds for element c2m.zone_map_frame to display
    And I switch to frame c2m.zone_map_frame
    And I click on element c2m.account_context_menu
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I hover over element c2m.goto_writeoff_process
    And I click element c2m.add_writeoff_process
    And I wait for 5 sec
    Then I should see page title as "Write Off Process"
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.tab_page_frame
    And I enter "<WRITE OFF CONTROL>" into input field c2m.writeoff_control_box
    And I select "<WRITE OFF PROCESS TEMPLATE>" option by text from dropdown c2m.writeoff_temp_dropdown
    And I enter "<COMMENTS>" into input field c2m.comment_box
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.menu_frame
    And I click element c2m.sas_tab
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.tab_page_frame
    And I enter "<SERVICE AGREEMENT>" into input field c2m.sa_box
    And I press "TAB" key into input field c2m.sa_box
    Then option "Active" by text from dropdown c2m.sa_status_dropdown should be selected
    And I switch to main content
    And I switch to frame c2m.main_frame
    Then I click element c2m.save
    And I wait for 5 sec
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.dashboard_frame
    And I wait for 10 sec
    And I switch to frame c2m.zonemapframe_201_frame
    Then element c2m.writeoff_active_alert should have text as "Active Write Off Process"

    Examples:
      |SEARCH BY|ACCOUNT ID|CIS DIVISION|WRITE OFF CONTROL|WRITE OFF PROCESS TEMPLATE|COMMENTS|SERVICE AGREEMENT|
      |Account ID|7697669556|Division 1 |RES-STD          |Normal utility debt       |NextGen Test|7694662711  |

#  @account
  Scenario Outline: Verify User is able to cancel a Collection Process(CC.008)
    When I switch to frame c2m.main_frame
    And I wait 20 seconds for element c2m.controlcentralsearch_button to display
    And I click on element c2m.controlcentralsearch_button
    And I wait for 5 sec
    Then I should see page title as "Control Central Search"
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.tab_page_frame
    And I select "<SEARCH BY>" option by text from dropdown c2m.search_by_list
    And I wait 10 seconds for element c2m.accountid to display
    And I enter "<ACCOUNT ID>" into input field c2m.accountid
    And I select "<CIS DIVISION>" option by text from dropdown c2m.cis_division
    And I click element c2m.search
    And I wait for 5 sec
    Then I should see page title as "Control Central"
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.dashboard_frame
    And I wait for 5 sec
    And I switch to frame c2m.zonemapframe_201_frame
    Then element c2m.collection_active_alert should have text as "Collection Process Active"
    And I click element c2m.collection_active_alert
    And I wait for 5 sec
    Then I should see page title as "Collection Process"
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.tab_page_frame
    And I click element c2m.cancel_button
    And I wait for 5 sec
    And I accept alert
    Then element c2m.cancel_button should be disabled

    Examples:
      | SEARCH BY  | ACCOUNT ID | CIS DIVISION |
      | Account ID | 7697669556 | Division 1   |

#  @account
  Scenario Outline: Verify User is able to cancel a Severance Process(CC.009)
    When I switch to frame c2m.main_frame
    And I wait 20 seconds for element c2m.controlcentralsearch_button to display
    And I click on element c2m.controlcentralsearch_button
    And I wait for 5 sec
    Then I should see page title as "Control Central Search"
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.tab_page_frame
    And I select "<SEARCH BY>" option by text from dropdown c2m.search_by_list
    And I wait 10 seconds for element c2m.accountid to display
    And I enter "<ACCOUNT ID>" into input field c2m.accountid
    And I select "<CIS DIVISION>" option by text from dropdown c2m.cis_division
    And I click element c2m.search
    And I wait for 5 sec
    Then I should see page title as "Control Central"
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.dashboard_frame
    And I wait for 5 sec
    And I switch to frame c2m.zonemapframe_201_frame
    Then element c2m.severance_active_alert should have text as "Severance Process Active"
    And I click element c2m.severance_active_alert
    And I wait for 5 sec
    Then I should see page title as "Severance Process"
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.tab_page_frame
    And I click element c2m.cancel_button
    And I wait for 5 sec
    And I accept alert
    Then element c2m.cancel_button should be disabled

    Examples:
      | SEARCH BY  | ACCOUNT ID | CIS DIVISION |
      | Account ID | 7697669556 | Division 1   |

#  @account
  Scenario Outline: Verify User is able to cancel a Write Off Process(CC.010)
    When I switch to frame c2m.main_frame
    And I wait 20 seconds for element c2m.controlcentralsearch_button to display
    And I click on element c2m.controlcentralsearch_button
    And I wait for 5 sec
    Then I should see page title as "Control Central Search"
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.tab_page_frame
    And I select "<SEARCH BY>" option by text from dropdown c2m.search_by_list
    And I wait 10 seconds for element c2m.accountid to display
    And I enter "<ACCOUNT ID>" into input field c2m.accountid
    And I select "<CIS DIVISION>" option by text from dropdown c2m.cis_division
    And I click element c2m.search
    And I wait for 5 sec
    Then I should see page title as "Control Central"
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.dashboard_frame
    And I wait for 10 sec
    And I switch to frame c2m.zonemapframe_201_frame
    Then element c2m.writeoff_active_alert should have text as "Active Write Off Process"
    And I click element c2m.writeoff_active_alert
    And I wait for 5 sec
    Then I should see page title as "Write Off Process"
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.tab_page_frame
    And I click element c2m.cancel_button
    And I wait for 5 sec
    And I accept alert
    Then element c2m.cancel_button should be disabled

    Examples:
      | SEARCH BY  | ACCOUNT ID | CIS DIVISION |
      | Account ID | 7697669556 | Division 1   |

#  @account
  Scenario Outline: Verify User is able to Add a Manually Credit Points(CC.011)
    When I switch to frame c2m.main_frame
    And I wait 20 seconds for element c2m.controlcentralsearch_button to display
    And I click on element c2m.controlcentralsearch_button
    And I wait for 5 sec
    Then I should see page title as "Control Central Search"
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.tab_page_frame
    And I select "<SEARCH BY>" option by text from dropdown c2m.search_by_list
    And I wait 10 seconds for element c2m.accountid to display
    And I enter "<ACCOUNT ID>" into input field c2m.accountid
    And I select "<CIS DIVISION>" option by text from dropdown c2m.cis_division
    And I click element c2m.search
    And I wait for 5 sec
    Then I should see page title as "Control Central"
    And I wait 10 seconds for element c2m.zone_map_frame to display
    And I switch to frame c2m.zone_map_frame
    And I click on element c2m.account_context_menu
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I click element c2m.goto_account
    And I wait for 5 sec
    Then I should see page title as "Account"
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.menu_frame
    And I click element c2m.c$c_tab
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.tab_page_frame
    And I enter "<START DATE>" into input field c2m.start_date_box
    And I enter "<END DATE>" into input field c2m.end_date_box
    And I clear input field c2m.credit_rate_box
    And I enter "<AFFECT CREDIT RATING BY>" into input field c2m.credit_rate_box
    And I clear input field c2m.account_comments
    And I enter "<COMMENTS>" into input field c2m.account_comments
    And I switch to main content
    And I switch to frame c2m.main_frame
    Then I click element c2m.save
#    Then the element c2m.credit_rating_historyid is displayed


    Examples:
      |SEARCH BY|ACCOUNT ID|CIS DIVISION|START DATE|END DATE|AFFECT CREDIT RATING BY|COMMENTS|
      |Account ID|7697669556|Division 1 |04-08-2022|04-15-2022|-30                  |NGTP Testing|

#  @account
  Scenario Outline: Verify User is able to Add an Adjustment(FIN.001)
    When I switch to frame c2m.main_frame
    And I wait 20 seconds for element c2m.controlcentralsearch_button to display
    And I click on element c2m.controlcentralsearch_button
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.tab_page_frame
    And I select "<SEARCH BY>" option by text from dropdown c2m.search_by_list
    And I wait 10 seconds for element c2m.accountid to display
    And I enter "<ACCOUNT ID>" into input field c2m.accountid
    And I select "<CIS DIVISION>" option by text from dropdown c2m.cis_division
    And I click element c2m.search
    And I wait 10 seconds for element c2m.zone_map_frame to display
    And I switch to frame c2m.zone_map_frame
    And I click on element c2m.account_context_menu
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I hover over element c2m.goto_adjustment
    And I click element c2m.add_adjustment
    And I switch to main content
    And I wait for 10 sec
    And I switch to new window
    And I enter "<SA ID>" into input field c2m.sa_id_box
    And I click element c2m.sasearch_button
    And I switch to previous window
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.tab_page_frame
    And I enter "<ADJUSTMENT TYPE>" into input field c2m.adjustmenttype_box
    And I press "TAB" key into input field c2m.adjustmenttype_box
    And I clear input field c2m.amount_box
    And I enter "<AMOUNT>" into input field c2m.amount_box
    And I click element c2m.generate_button
    And I switch to main content
    And I switch to new window
    And I click element c2m.calculate_button
    And I switch to previous window
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.tab_page_frame
    And I click element c2m.submit_approval_button
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.menu_frame
    And I click element c2m.approval_tab
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.tab_page_frame
    And I wait 10 seconds for element c2m.zonemapframe_2_frame to display
    And I switch to frame c2m.zonemapframe_2_frame
    And I click element c2m.approve_button
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.menu_frame
    And I click element c2m.main_tab
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.tab_page_frame
    And I wait for 3 sec
    Then element c2m.adjustment_status should have text as "Frozen"

    Examples:
      |SEARCH BY|ACCOUNT ID|CIS DIVISION|SA ID|ADJUSTMENT TYPE|AMOUNT|
      |Account ID|7697669556|Division 1 |7694662711|ADDCHARG  |100   |

#  @account
  Scenario: Verify User is able to cancel an Adjustment(FIN.002)
    When I switch to frame c2m.main_frame
    And I wait 20 seconds for element c2m.topmenu to display
    And I click element c2m.topmenu
    And I hover over element c2m.financial
    And I hover over element c2m.adjustment
    And I click element c2m.search_adjustment
    And I switch to main content
    And I wait for 10 sec
    And I switch to new window
    And I enter credentials.adjustment_id_box into input field c2m.adjustment_id_box
    And I click element c2m.adjustmentid_search_button
    And I switch to previous window
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.tab_page_frame
    And I click element c2m.cancel_button
    And I switch to main content
    And I switch to new window
    And I select "Incorrect adjustment" option by text from dropdown c2m.cancel_reason_dropdown
    And I click element c2m.cancelreason_ok_button
    And I switch to previous window
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.tab_page_frame
    Then element c2m.adjustment_status should have text as "Canceled"

#  @account
  Scenario: Verify User is able to Add a Deposit/Tender Control(FIN.003)
    When I switch to frame c2m.main_frame
    And I wait 20 seconds for element c2m.topmenu to display
    And I click element c2m.topmenu
    And I hover over element c2m.financial
    And I hover over element c2m.deposit_control
    And I click element c2m.add_deposit_control
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I click element c2m.save
    And I wait for 10 sec
    Then I should see page title as "Deposit Control"
    And I switch to frame c2m.tab_page_frame
    And I click element c2m.deposit_control_context
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I hover over element c2m.goto_tender_control
    And I click element c2m.add_tender_control
    And I wait for 5 sec
    Then I should see page title as "Tender Control"
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I switch to frame c2m.tab_page_frame
    And I enter credentials.tender_source_box into input field c2m.tender_source_box
    And I press "TAB" key into input field c2m.tender_source_box
    And I clear input field c2m.starting_bal_box
    And I enter credentials.starting_bal_box into input field c2m.starting_bal_box
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I click element c2m.save
    And I switch to frame c2m.tab_page_frame
    Then get me the text from c2m.tender_control_id element

