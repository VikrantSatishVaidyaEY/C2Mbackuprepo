#####################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    		Reason:
# 2022-05-13	CTongo		Initial Version.
#
#####################################################################################

Feature: Adding a Payment Arrangement Request

  @CC004 @regression
  Scenario Outline: Adding a Payment Arrangement Request
    #User is Logged In
    Given I navigate to C2M_HOME page
    When I enter credentials.user into input field c2m.username
    And I enter credentials.pass into input field c2m.password
    And I click on element c2m.sign_in

    #Click on Control Central Search
    And I wait for 5 sec
    And I switch to frame frame.main_frame
    And I wait 10 seconds for element main.main_menu to display
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

    #Go To Payment Arrangement Request
    And I switch to main content
    And I switch to frame frame.main_frame
    And I click on element context.acctctx_gotopar
    And I click element context.add

    #Populate required fields for Payment Arrangement
    And I switch to main content
    And I switch to frame frame.main_frame
    And I switch to frame frame.ui_frame
    And I select "<paymentArrangementRquestType>" option by text from dropdown paymentarrangementpage.pa_request_type
    And I click on element paymentarrangementpage.ok_btn
    And I wait for 5 sec
    And I switch to main content
    And I switch to frame c2m.main_frame
    And I wait 20 seconds for element frame.tabpage_frame to display
    And I switch to frame frame.tabpage_frame
    And I wait 10 seconds for element frame.tabpage_zonemapframe1 to display
    And I switch to frame frame.tabpage_zonemapframe1
    And I select "<paymentArrangementReason>" option by text from dropdown paymentarrangementpage.pa_reason
    And I click on element paymentarrangementpage.next_btn
    And I wait 10 seconds for element paymentarrangementpage.pa_sa_check_box to display
    And I check checkbox paymentarrangementpage.pa_sa_check_box using action
    And I click on element paymentarrangementpage.pa_selected_sa_change_btn
    And I wait 10 seconds for element paymentarrangementpage.pa_selected_sa_check_box to display
    And I check checkbox paymentarrangementpage.pa_selected_sa_check_box using action
    And I click on element paymentarrangementpage.pa_selected_sa_check_box_ok_btn
    And I clear input field paymentarrangementpage.pa_number_of_installments
    And I enter "<noOfInstallments>" into input field paymentarrangementpage.pa_number_of_installments
    And I click on element paymentarrangementpage.next_btn
    And I click on element paymentarrangementpage.pa_finish_btn
    And I wait for 3 sec

#    #Logout C2M
#    And I switch to main content
#    And I switch to frame frame.main_frame
#    And I click element c2mlogout.english_system
#    And I click element c2mlogout.logout
   # And I close browser

    Examples:
      | searchBy | accountId | cisDivision | paymentArrangementRquestType | paymentArrangementReason | noOfInstallments |
      #C2MDEV| Account ID | 4871423415 | Colorado Springs Utilities |PA - Select SAs / Down Payment Not Applicable / Always Eligible / No Approval|Delayed Billing| 3 |
      #C2MTEST| Account ID | 0039489227 | Colorado Springs Utilities |PA - Select SAs / Down Payment Not Applicable / Always Eligible / No Approval|Delayed Billing| 3 |
      #C2MTEST| Account ID | 0039489227 | Colorado Springs Utilities |PA - Select SAs / Down Payment Not Applicable / Always Eligible / No Approval|Delayed Billing| 3 |
      | Account ID | 0456531836 | Colorado Springs Utilities |PA - Select SAs / Down Payment Not Applicable / Always Eligible / No Approval|Delayed Billing| 3 |

#    Examples:
#      | searchBy | accountId | cisDivision | paymentArrangementRquestType | paymentArrangementReason | noOfInstallments |
#      | Account ID | 1456426301 | Colorado Springs Utilities |PA - Select SAs / Down Payment Not Applicable / Always Eligible / No Approval|Delayed Billing| 3 |