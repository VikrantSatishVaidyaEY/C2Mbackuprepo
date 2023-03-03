#####################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    		Reason:
# 2022-05-06	CTongo		Initial Version.
#
#####################################################################################

Feature: Load Test Data to specific Feature File

  @LoadTestDataToScenario
  Scenario Outline: Load Test Data to specific Feature File

    #Login C2M
    Given Load Test Data for Feature File <featureFileName>
    And I close browser

    Examples:
      | featureFileName    |
    #  | bil002_cancelabillsegment    |
 #     | dm001_adddevice    |
   #   | tds001_addmanualtodo |
 #     | tds002_completetodo |
  #    | tds003_assigningtodoentries |
      #| mu001_addmeterreadviameterreadpage|
    #  | bil004_settingamaximumbillthreshold    |
     #| bil005_servicecycleupdatesbillingcycle    |
     # | dm001_adddevice    |
#      | fin004_addpaymentevent |
#      | fin005_addapaymenttomultipleaccounts |
   # |fin001_addanadjustment|
    |fin002_cancelanadjustment|
   # |fin003_adddepositortendercontrol|
   # |fin004_addpaymentevent          |
   # |fin005_addapaymenttomultipleaccounts|
   # |fin006_cancellingapaymentevent      |
   # |fin007_searchingforapayment         |
   # |fin008_settingupautopay             |
   # |fin009_cancellingautopay            |
   # |fin010_transferringabalance         |
#      | cc001_addcollectionreferralagency |
#      | cc002_addpayplan |
#      | cc003_cancelingapayplan |
#  | cc004_addingapaymentarrangementrequest |
  #| cc005_addingcollectionprocess |
#  | cc006_addingsevereanceprocess |
#   | cc007_addingawriteoffprocess |
#  | cc008_cancellingcollectionprocess |
#  | cc009_cancellingseveranceprocess |
#  | cc010_cancellingwriteoffprocess |
#  | cc011_manuallyaddingcreditpoints |
#  | cc012_modifyingcollectioneventtriggerdate |
#  | cc013_modifyseveranceeventtriggerdate |
#  | cc014_modifyingwriteoffeventtriggerdate |
 # |  cm003_createcustomercontactforbudgetremoval                   |
  #  |cm361_discardpendingimd    |