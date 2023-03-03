#####################################################################################
# CHANGE HISTORY:
#
# Date:       	by:    		Reason:
# 2022-05-06	CTongo		Initial Version.
#
#####################################################################################

Feature: Load Test Data to All Feature File

  @LoadTestDataToAllFeatureFile
  Scenario Outline: Load Test Data to All Feature File

    #Login C2M
    Given Load Test Data for All Feature Files

    Examples:
      | null |
      | null |