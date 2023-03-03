/*
 *************************************************************************************
 * CHANGE HISTORY:
 *
 * Date:       	by:    		Reason:
 * 2022-05-06	CTongo		Initial Version.
 *************************************************************************************
 */

package data.dataclass.inputfilebuilder;

public class SqlQueries {

    public String SqlQueries(String feature){

        try{
            //FINANCIAL
            if(feature.equals("fin001_addanadjustment")){
                return FIN001();
            }else if(feature.equals("fin002_cancelanadjustment")){
                return FIN002();
            }else if(feature.equals("fin003_adddepositortendercontrol")){
                return FIN003();
            } else if(feature.equals("fin004_addpaymentevent")){
                return FIN004();
            }else if(feature.equals("fin005_addapaymenttomultipleaccounts")){
                return FIN005();
            }else if(feature.equals("fin006_cancellingapaymentevent")){
                return FIN006();
            }else if(feature.equals("fin007_searchingforapayment")){
                return FIN007();
            }else if(feature.equals("fin008_settingupautopay")){
                return FIN008();
            }else if(feature.equals("fin009_cancellingautopay")){
                return FIN009();
            }else if(feature.equals("fin010_transferringabalance")){
                return FIN010();
            }

            //CREDITS AND COLLECTIONS
            else if(feature.equals("cc001_addcollectionreferralagency")){
                return CC001();
            } else if(feature.equals("cc002_addpayplan")){
                return CC002();
            } else if(feature.equals("cc003_cancelingapayplan")){
                return CC003();
            } else if(feature.equals("cc004_addingapaymentarrangementrequest")){
                return CC004();
            } else if(feature.equals("cc005_addingcollectionprocess")){
                return CC005();
            } else if(feature.equals("cc006_addingsevereanceprocess")){
                return CC006();
            } else if(feature.equals("cc007_addingawriteoffprocess")){
                return CC007();
            } else if(feature.equals("cc008_cancellingcollectionprocess")){
                return CC008();
            } else if(feature.equals("cc009_cancellingseveranceprocess")){
                return CC009();
            } else if(feature.equals("cc010_cancellingwriteoffprocess")){
                return CC010();
            } else if(feature.equals("cc011_manuallyaddingcreditpoints")){
                return CC011();
            } else if(feature.equals("cc012_modifyingcollectioneventtriggerdate")){
                return CC012();
            } else if(feature.equals("cc013_modifyseveranceeventtriggerdate")){
                return CC013();
            } else if(feature.equals("cc014_modifyingwriteoffeventtriggerdate")){
                return CC014();
            }

            //CUSTOMER INFORMATION
            else if(feature.equals("ci003_addservicepoint")){
                return CI003();
            } else if(feature.equals("ci004_personproperlysyncsfromc2mtomdm")){
                return CI004();
            } else if(feature.equals("ci005_startserviceagreement")){
                return CI005();
            } else if(feature.equals("ci007_stopserviceagreement")){
                return CI007();
            } else if(feature.equals("ci008_createdepositsa")){
                return CI008();
            } else if(feature.equals("ci009_serviceagreementsyncsfromc2mtomdm")){
                return CI009();
            } else if(feature.equals("ci010_addchildpremisetoparentpremise")){
                return CI010();
            } else if(feature.equals("ci011_addpremisetoexistinglandlordagreement")){
                return CI011();
            }

            //DEVICE MANAGEMENT
             else if(feature.equals("dm001_adddevice")){
                return DM001();
            }
            else if(feature.equals("bil002_cancelabillsegment")){
                return BIL002();
            }
            else if(feature.equals("tds001_addmanualtodo")){
                return TDS001();
            }
            else if(feature.equals("tds002_completetodo")){
                return TDS002();
            }
            else if(feature.equals("tds003_assigningtodoentries")){
                return TDS003();
            }//Billing
             else if(feature.equals("bil004_settingamaximumbillthreshold")){
                return BIL004();
            }
            else if(feature.equals("bil005_servicecycleupdatesbillingcycle")){
                return BIL005();
            }

            //Custom Test Cases
            else if(feature.equals("cm003_createcustomercontactforbudgetremoval")){
                return CM003();
            }

            else if(feature.equals("cm361_discardpendingimd")){
                return CM361();
            }

             else{
                System.out.println("No Retrieved Query for the Feature File: " + feature);
            }

        }catch (Exception e){
            System.out.println(e);
        }
        return null;
    }

    //////////////////////////////////////////////////////////////////
    //////			   Start of -SQL QUERY- section			    //////
    //////////////////////////////////////////////////////////////////

    /*
     * This method is responsible for retrieving an Account to add a Payment Event
     * @return String - Query for an Account to add a Payment Event
     */
    private static String FIN004() {

        StringBuilder queryStr = new StringBuilder();
        queryStr.append(" SELECT ");
        queryStr.append("      DISTINCT(CA.ACCT_ID) ");
        queryStr.append(" FROM ");
        queryStr.append("      CI_ACCT CA, ");
        queryStr.append("      CI_SA CSA ");
        queryStr.append(" WHERE ");
        queryStr.append("      CA.CIS_DIVISION='CSU' ");
        queryStr.append("      AND CA.ACCT_ID IN ( ");
        queryStr.append("            SELECT ");
        queryStr.append("                  ACCT_ID ");
        queryStr.append("            FROM ");
        queryStr.append("                  CI_ACCT_PER ");
        queryStr.append("            WHERE ");
        queryStr.append("                  ACCT_ID=CA.ACCT_ID ");
        queryStr.append("                  GROUP BY ACCT_ID ");
        queryStr.append("                  HAVING COUNT(ACCT_ID)=1) ");
        queryStr.append("      AND CA.ACCT_ID=CSA.ACCT_ID ");
        queryStr.append("      AND CSA.ACCT_ID IN ( ");
        queryStr.append("            SELECT ");
        queryStr.append("                  ACCT_ID ");
        queryStr.append("            FROM ");
        queryStr.append("                  CI_SA ");
        queryStr.append("            WHERE ");
        queryStr.append("                  ACCT_ID=CSA.ACCT_ID ");
        queryStr.append("                  GROUP BY ACCT_ID ");
        queryStr.append("                  HAVING COUNT(ACCT_ID)=1) ");
        queryStr.append("      AND TRIM(CSA.SA_TYPE_CD) LIKE '%RS' ");
        queryStr.append("      AND CSA.SA_STATUS_FLG='20' ");
        queryStr.append("      AND CA.ACCT_ID NOT IN( ");
        queryStr.append("            SELECT ");
        queryStr.append("                  PAY.ACCT_ID ");
        queryStr.append("            FROM ");
        queryStr.append("                  CI_PAY PAY, ");
        queryStr.append("                  CI_PAY_EVENT PEVT ");
        queryStr.append("            WHERE ");
        queryStr.append("                  PAY.PAY_EVENT_ID = PEVT.PAY_EVENT_ID ");
        queryStr.append("                  AND PEVT.PAY_DT LIKE SYSDATE) ");
        queryStr.append("      FETCH FIRST 1 ROWS ONLY ");

        return queryStr.toString();
    }

    /*
     * This method is responsible for retrieving multiple account for payment
     * @return String - Query for multiple account for payment
     */
    private static String FIN005() {

        StringBuilder queryStr = new StringBuilder();
        queryStr.append(" SELECT ");
        queryStr.append("      DISTINCT ACCOUNT1.ACCT_ID AS ACCT_ID1, ");
        queryStr.append("      ACCOUNT2.ACCT_ID AS ACCT_ID2 ");
        queryStr.append(" FROM ");
        queryStr.append("      (SELECT ");
        queryStr.append("            DISTINCT(CA.ACCT_ID) ");
        queryStr.append("      FROM ");
        queryStr.append("            CI_ACCT CA, ");
        queryStr.append("            CI_SA CSA ");
        queryStr.append("      WHERE ");
        queryStr.append("            CA.CIS_DIVISION='CSU' ");
        queryStr.append("            AND CA.ACCT_ID IN ( ");
        queryStr.append("            SELECT ");
        queryStr.append("                  ACCT_ID ");
        queryStr.append("            FROM ");
        queryStr.append("                  CI_ACCT_PER ");
        queryStr.append("            WHERE ");
        queryStr.append("                  ACCT_ID=CA.ACCT_ID ");
        queryStr.append("                  GROUP BY ACCT_ID ");
        queryStr.append("                  HAVING COUNT(ACCT_ID)=1) ");
        queryStr.append("            AND CA.ACCT_ID=CSA.ACCT_ID ");
        queryStr.append("            AND CSA.ACCT_ID IN ( ");
        queryStr.append("            SELECT ");
        queryStr.append("                  ACCT_ID ");
        queryStr.append("            FROM ");
        queryStr.append("                  CI_SA ");
        queryStr.append("            WHERE ");
        queryStr.append("                  ACCT_ID=CSA.ACCT_ID ");
        queryStr.append("                  GROUP BY ACCT_ID ");
        queryStr.append("                  HAVING COUNT(ACCT_ID)=1) ");
        queryStr.append("            AND TRIM(CSA.SA_TYPE_CD) LIKE '%RS' ");
        queryStr.append("            AND CSA.SA_STATUS_FLG='20') ACCOUNT1, ");
        queryStr.append("      (SELECT ");
        queryStr.append("            DISTINCT(CA.ACCT_ID) ");
        queryStr.append("      FROM ");
        queryStr.append("            CI_ACCT CA, ");
        queryStr.append("            CI_SA CSA ");
        queryStr.append("      WHERE ");
        queryStr.append("            CA.CIS_DIVISION='CSU' ");
        queryStr.append("            AND CA.ACCT_ID IN ( ");
        queryStr.append("            SELECT ");
        queryStr.append("                  ACCT_ID ");
        queryStr.append("            FROM ");
        queryStr.append("                  CI_ACCT_PER ");
        queryStr.append("            WHERE ");
        queryStr.append("                  ACCT_ID=CA.ACCT_ID ");
        queryStr.append("                  GROUP BY ACCT_ID ");
        queryStr.append("                  HAVING COUNT(ACCT_ID)=1) ");
        queryStr.append("            AND CA.ACCT_ID=CSA.ACCT_ID ");
        queryStr.append("            AND CSA.ACCT_ID IN ( ");
        queryStr.append("            SELECT ");
        queryStr.append("                  ACCT_ID ");
        queryStr.append("            FROM ");
        queryStr.append("                  CI_SA ");
        queryStr.append("            WHERE ");
        queryStr.append("                  ACCT_ID=CSA.ACCT_ID ");
        queryStr.append("                  GROUP BY ACCT_ID ");
        queryStr.append("                  HAVING COUNT(ACCT_ID)=1) ");
        queryStr.append("            AND TRIM(CSA.SA_TYPE_CD) LIKE '%RS' ");
        queryStr.append("            AND CSA.SA_STATUS_FLG='20') ACCOUNT2 ");
        queryStr.append(" WHERE ");
        queryStr.append("      ACCOUNT1.ACCT_ID != ACCOUNT2.ACCT_ID ");
        queryStr.append("      FETCH FIRST 1 ROWS ONLY ");

        return queryStr.toString();
    }

    /*
     * This method is responsible for retrieving an DATETIME from DB
     * @return String - Query for an DATETIME from DB used in adding a Device
     */
    private static String DM001() {

        StringBuilder queryStr = new StringBuilder();
        queryStr.append(" SELECT ");
        queryStr.append("      SYSDATE AS DATETIME,");
        queryStr.append("      SYSDATE+1/24 AS DATETIMEPLUSONE");
        queryStr.append(" FROM ");
        queryStr.append("      D1_DVC ");
        queryStr.append(" FETCH FIRST 1 ROWS ONLY ");

        return queryStr.toString();
    }

    /*
     * This method is responsible for retrieving an Account from DB
     * @return String - Query for an Account from DB used in adding a Adjustment
     */
    private static String FIN001() {

        StringBuilder queryStr = new StringBuilder();
        queryStr.append(" SELECT ");
        queryStr.append("      DISTINCT(CA.ACCT_ID)");
        queryStr.append(" FROM ");
        queryStr.append("      CI_ACCT CA, ");
        queryStr.append("      CI_SA CSA, ");
        queryStr.append("      CI_SA_RS_HIST CSRH ");
        queryStr.append(" WHERE ");
        queryStr.append("      CA.CIS_DIVISION='CSU' ");
        queryStr.append("      AND CA.ACCT_ID IN ( ");
        queryStr.append("           SELECT ");
        queryStr.append("                ACCT_ID ");
        queryStr.append("           FROM ");
        queryStr.append("                CI_ACCT_PER ");
        queryStr.append("           WHERE ");
        queryStr.append("                ACCT_ID=CA.ACCT_ID ");
        queryStr.append("           GROUP BY ");
        queryStr.append("                ACCT_ID ");
        queryStr.append("           HAVING COUNT(ACCT_ID)=1) ");
        queryStr.append("      AND CA.ACCT_ID=CSA.ACCT_ID ");
        queryStr.append("      AND CSA.ACCT_ID IN ( ");
        queryStr.append("           SELECT ");
        queryStr.append("                ACCT_ID ");
        queryStr.append("           FROM ");
        queryStr.append("                CI_SA ");
        queryStr.append("           WHERE ");
        queryStr.append("                ACCT_ID=CSA.ACCT_ID ");
        queryStr.append("           GROUP BY ");
        queryStr.append("                ACCT_ID ");
        queryStr.append("           HAVING COUNT(ACCT_ID)=1) ");
        queryStr.append("      AND TRIM(CSA.SA_TYPE_CD) LIKE '%RS' ");
        queryStr.append("      AND CSA.SA_STATUS_FLG='20' ");
        queryStr.append("      AND CSA.SA_ID=CSRH.SA_ID ");
        queryStr.append("      AND CSRH.RS_CD='E1R' ");
        queryStr.append(" FETCH FIRST 1 ROWS ONLY ");

        return queryStr.toString();
    }

    /*
     * This method is responsible for retrieving an frozen adjustment from DB
     * @return String - Query for a frozen adjustment id from DB used to cancel the adjustment
     */
    private static String FIN002() {

        StringBuilder queryStr = new StringBuilder();
        queryStr.append(" SELECT ");
        queryStr.append("      ADJ_ID ");
        queryStr.append(" FROM ");
        queryStr.append("      CI_ADJ ");
        queryStr.append(" WHERE ");
        queryStr.append("      ADJ_STATUS_FLG='50' ");
        queryStr.append(" FETCH FIRST 1 ROWS ONLY ");

        return queryStr.toString();
    }

    /*
     * This method is responsible for retrieving an tender source code from DB
     * @return String - Query for a tender source code from DB used to create a tender control
     */
    private static String FIN003() {

        StringBuilder queryStr = new StringBuilder();
        queryStr.append(" SELECT ");
        queryStr.append("      TNDR_SOURCE_CD ");
        queryStr.append(" FROM ");
        queryStr.append("      CI_TNDR_SRCE ");
        queryStr.append(" WHERE ");
        queryStr.append("      TNDR_SOURCE_CD='COPE' ");
        queryStr.append(" FETCH FIRST 1 ROWS ONLY ");

        return queryStr.toString();
    }

    /*
     * This method is responsible for retrieving an payment event id from DB
     * @return String - Query for a frozen payment event id from DB used to cancel the payment event
     */
    private static String FIN006() {

        StringBuilder queryStr = new StringBuilder();
        queryStr.append(" SELECT ");
        queryStr.append("      PAY_EVENT_ID ");
        queryStr.append(" FROM ");
        queryStr.append("      CI_PAY ");
        queryStr.append(" WHERE ");
        queryStr.append("      PAY_STATUS_FLG = '50' ");
        queryStr.append(" FETCH FIRST 1 ROWS ONLY ");

        return queryStr.toString();
    }

    /*
     * This method is responsible for retrieving an payment event id from DB
     * @return String - Query for a frozen payment event id from DB used to search the payment event
     */
    private static String FIN007() {

        StringBuilder queryStr = new StringBuilder();
        queryStr.append(" SELECT ");
        queryStr.append("      PAY_EVENT_ID ");
        queryStr.append(" FROM ");
        queryStr.append("      CI_PAY ");
        queryStr.append(" WHERE ");
        queryStr.append("      PAY_STATUS_FLG = '50' ");
        queryStr.append(" FETCH FIRST 1 ROWS ONLY ");

        return queryStr.toString();
    }

    /*
     * This method is responsible for retrieving account from DB
     * @return String - Query for an account id from DB used to add autopay to the account
     */
    private static String FIN008() {

        StringBuilder queryStr = new StringBuilder();
        queryStr.append(" SELECT ");
        queryStr.append("      ACCT_ID ");
        queryStr.append(" FROM ");
        queryStr.append("      CI_ACCT ");
        queryStr.append(" WHERE ");
        queryStr.append("      ACCT_ID IN ( ");
        queryStr.append("      SELECT ");
        queryStr.append("           ACCT_ID ");
        queryStr.append("      FROM ");
        queryStr.append("           CI_ACCT_PER ");
        queryStr.append("      GROUP BY ");
        queryStr.append("           ACCT_ID ");
        queryStr.append("      HAVING COUNT(ACCT_ID)=1) ");
        queryStr.append("      AND ACCT_ID IN ( ");
        queryStr.append("      SELECT ");
        queryStr.append("           ACCT_ID ");
        queryStr.append("      FROM ");
        queryStr.append("           CI_SA ");
        queryStr.append("      GROUP BY ");
        queryStr.append("           ACCT_ID ");
        queryStr.append("      HAVING COUNT(ACCT_ID)=1) ");
        queryStr.append("      AND ACCT_ID NOT IN ( ");
        queryStr.append("      SELECT ");
        queryStr.append("           ACCT_ID ");
        queryStr.append("      FROM ");
        queryStr.append("           CI_ACCT_APAY) ");
        queryStr.append("      AND CIS_DIVISION='CSU' ");
        queryStr.append(" FETCH FIRST 1 ROWS ONLY ");

        return queryStr.toString();
    }

    /*
     * This method is responsible for retrieving account from DB
     * @return String - Query for an account id from DB used to cancel autopay to the account
     */
    private static String FIN009() {

        StringBuilder queryStr = new StringBuilder();
        queryStr.append(" SELECT ");
        queryStr.append("      ACCT_ID ");
        queryStr.append(" FROM ");
        queryStr.append("      CI_ACCT ");
        queryStr.append(" WHERE ");
        queryStr.append("      ACCT_ID IN ( ");
        queryStr.append("      SELECT ");
        queryStr.append("           ACCT_ID ");
        queryStr.append("      FROM ");
        queryStr.append("           CI_ACCT_PER ");
        queryStr.append("      GROUP BY ");
        queryStr.append("           ACCT_ID ");
        queryStr.append("      HAVING COUNT(ACCT_ID)=1) ");
        queryStr.append("      AND ACCT_ID IN ( ");
        queryStr.append("      SELECT ");
        queryStr.append("           ACCT_ID ");
        queryStr.append("      FROM ");
        queryStr.append("           CI_SA ");
        queryStr.append("      GROUP BY ");
        queryStr.append("           ACCT_ID ");
        queryStr.append("      HAVING COUNT(ACCT_ID)=1) ");
        queryStr.append("      AND ACCT_ID IN ( ");
        queryStr.append("      SELECT ");
        queryStr.append("           ACCT_ID ");
        queryStr.append("      FROM ");
        queryStr.append("           CI_ACCT_APAY) ");
        queryStr.append("      AND CIS_DIVISION='CSU' ");
        queryStr.append(" FETCH FIRST 1 ROWS ONLY ");

        return queryStr.toString();
    }

    /*
     * This method is responsible for retrieving account and transfer SA from DB
     * @return String - Query for an account id and transfer SA ID from DB
     */
    private static String FIN010() {

        StringBuilder queryStr = new StringBuilder();
        queryStr.append(" SELECT ");
        queryStr.append("      DISTINCT ACCT.ACCT_ID AS ACCT_ID, ");
        queryStr.append("      SA.SA_ID AS SA_ID ");
        queryStr.append(" FROM ");
        queryStr.append("      (SELECT ");
        queryStr.append("           DISTINCT(CA.ACCT_ID) ");
        queryStr.append("      FROM ");
        queryStr.append("           CI_ACCT CA, ");
        queryStr.append("           CI_SA CSA ");
        queryStr.append("      WHERE ");
        queryStr.append("           CA.CIS_DIVISION='CSU' ");
        queryStr.append("           AND CA.ACCT_ID IN ( ");
        queryStr.append("                SELECT ");
        queryStr.append("                     ACCT_ID ");
        queryStr.append("                FROM ");
        queryStr.append("                     CI_ACCT_PER ");
        queryStr.append("                WHERE ");
        queryStr.append("                     ACCT_ID=CA.ACCT_ID ");
        queryStr.append("                GROUP BY ");
        queryStr.append("                     ACCT_ID ");
        queryStr.append("                HAVING COUNT(ACCT_ID)=1) ");
        queryStr.append("           AND CA.ACCT_ID=CSA.ACCT_ID ");
        queryStr.append("           AND CSA.ACCT_ID IN ( ");
        queryStr.append("                SELECT ");
        queryStr.append("                     ACCT_ID ");
        queryStr.append("                FROM ");
        queryStr.append("                     CI_SA ");
        queryStr.append("                WHERE ");
        queryStr.append("                     ACCT_ID=CSA.ACCT_ID ");
        queryStr.append("                GROUP BY ");
        queryStr.append("                     ACCT_ID ");
        queryStr.append("                HAVING COUNT(ACCT_ID)=1) ");
        queryStr.append("           AND TRIM(CSA.SA_TYPE_CD) LIKE '%RS' ");
        queryStr.append("           AND CSA.SA_STATUS_FLG='20') ACCT, ");
        queryStr.append("      (SELECT ");
        queryStr.append("           DISTINCT(CSA.SA_ID), ");
        queryStr.append("           CSA.ACCT_ID ");
        queryStr.append("      FROM ");
        queryStr.append("           CI_ACCT CA, ");
        queryStr.append("           CI_SA CSA ");
        queryStr.append("      WHERE ");
        queryStr.append("           CA.CIS_DIVISION='CSU' ");
        queryStr.append("           AND CA.ACCT_ID IN ( ");
        queryStr.append("                SELECT ");
        queryStr.append("                     ACCT_ID ");
        queryStr.append("                FROM ");
        queryStr.append("                     CI_ACCT_PER ");
        queryStr.append("                WHERE ");
        queryStr.append("                     ACCT_ID=CA.ACCT_ID ");
        queryStr.append("                GROUP BY ");
        queryStr.append("                     ACCT_ID ");
        queryStr.append("                HAVING COUNT(ACCT_ID)=1) ");
        queryStr.append("           AND CA.ACCT_ID=CSA.ACCT_ID ");
        queryStr.append("           AND CSA.ACCT_ID IN ( ");
        queryStr.append("                SELECT ");
        queryStr.append("                     ACCT_ID ");
        queryStr.append("                FROM ");
        queryStr.append("                     CI_SA ");
        queryStr.append("                WHERE ");
        queryStr.append("                     ACCT_ID=CSA.ACCT_ID ");
        queryStr.append("                GROUP BY ");
        queryStr.append("                     ACCT_ID ");
        queryStr.append("                HAVING COUNT(ACCT_ID)=1) ");
        queryStr.append("           AND TRIM(CSA.SA_TYPE_CD) LIKE '%RS' ");
        queryStr.append("           AND CSA.SA_STATUS_FLG='20') SA, ");
        queryStr.append("      (SELECT ");
        queryStr.append("           SA.ACCT_ID, ");
        queryStr.append("           MAX(FT.CRE_DTTM) AS CRE_DTTM, ");
        queryStr.append("           SUM(FT.CUR_AMT) ");
        queryStr.append("      FROM ");
        queryStr.append("           CI_SA SA, ");
        queryStr.append("           CI_FT FT, ");
        queryStr.append("           CI_ACCT ACCT ");
        queryStr.append("      WHERE ");
        queryStr.append("           SA.SA_ID = FT.SA_ID ");
        queryStr.append("           AND SA.ACCT_ID = ACCT.ACCT_ID ");
        queryStr.append("           AND SA.SA_TYPE_CD = 'E-RS' ");
        queryStr.append("           AND SA.SA_STATUS_FLG = '20' ");
        queryStr.append("           AND ACCT.CIS_DIVISION = 'CSU' ");
        queryStr.append("           HAVING SUM(FT.CUR_AMT) > 150 ");
        queryStr.append("           GROUP BY SA.ACCT_ID) FT ");
        queryStr.append(" WHERE ");
        queryStr.append("      ACCT.ACCT_ID != SA.ACCT_ID ");
        queryStr.append("      AND ACCT.ACCT_ID = FT.ACCT_ID ");
        queryStr.append(" FETCH FIRST 1 ROWS ONLY ");

        return queryStr.toString();
    }

    /*
     * This method is responsible for retrieving an account id from DB
     * @return String - Query for an account id from DB used for adding collection referral agency
     */
    private static String CC001() {

        StringBuilder queryStr = new StringBuilder();
        queryStr.append(" SELECT ");
        queryStr.append("      SA.ACCT_ID, ");
        queryStr.append("      SUM(FT.CUR_AMT) AS CUR_AMT ");
        queryStr.append(" FROM ");
        queryStr.append("      CI_SA SA, ");
        queryStr.append("      CI_FT FT, ");
        queryStr.append("      CI_ACCT ACCT ");
        queryStr.append(" WHERE ");
        queryStr.append("      SA.SA_ID = FT.SA_ID ");
        queryStr.append("      AND SA.ACCT_ID = ACCT.ACCT_ID ");
        queryStr.append("      AND SA.SA_TYPE_CD = 'E-RS' ");
        queryStr.append("      AND SA.SA_STATUS_FLG = '40' ");
        queryStr.append("      AND ACCT.CIS_DIVISION = 'CSU' ");
        queryStr.append("      AND ACCT.ACCT_ID NOT IN ( ");
        queryStr.append("           SELECT ");
        queryStr.append("                ACCT_ID ");
        queryStr.append("           FROM ");
        queryStr.append("                CI_PP ");
        queryStr.append("           WHERE ");
        queryStr.append("                PP_STAT_FLG = '20') ");
        queryStr.append("      AND ACCT.ACCT_ID NOT IN ( ");
        queryStr.append("           SELECT ");
        queryStr.append("                ACCT_ID ");
        queryStr.append("           FROM ");
        queryStr.append("                CI_COLL_PROC ");
        queryStr.append("           WHERE ");
        queryStr.append("                COLL_STATUS_FLG = '10') ");
        queryStr.append("      HAVING SUM(FT.CUR_AMT) > 100 ");
        queryStr.append("      GROUP BY SA.ACCT_ID ");
        queryStr.append(" FETCH FIRST 1 ROWS ONLY ");

        return queryStr.toString();
    }

    /*
     * This method is responsible for retrieving an account id from DB
     * @return String - Query for an account id from DB used for adding a payplan
     */
    private static String CC002() {

        StringBuilder queryStr = new StringBuilder();
        queryStr.append(" SELECT ");
        queryStr.append("      SA.ACCT_ID, ");
        queryStr.append("      SUM(FT.CUR_AMT) AS CUR_AMT ");
        queryStr.append(" FROM ");
        queryStr.append("      CI_SA SA, ");
        queryStr.append("      CI_FT FT, ");
        queryStr.append("      CI_ACCT ACCT ");
        queryStr.append(" WHERE ");
        queryStr.append("      SA.SA_ID = FT.SA_ID ");
        queryStr.append("      AND SA.ACCT_ID = ACCT.ACCT_ID ");
        queryStr.append("      AND SA.SA_TYPE_CD = 'E-RS' ");
        queryStr.append("      AND SA.SA_STATUS_FLG = '20' ");
        queryStr.append("      AND ACCT.CIS_DIVISION = 'CSU' ");
        queryStr.append("      AND ACCT.ACCT_ID NOT IN ( ");
        queryStr.append("           SELECT ");
        queryStr.append("                ACCT_ID ");
        queryStr.append("           FROM ");
        queryStr.append("                CI_PP ");
        queryStr.append("           WHERE ");
        queryStr.append("                PP_STAT_FLG = '20') ");
        queryStr.append("      AND ACCT.ACCT_ID NOT IN ( ");
        queryStr.append("           SELECT ");
        queryStr.append("                ACCT_ID ");
        queryStr.append("           FROM ");
        queryStr.append("                CI_COLL_PROC ");
        queryStr.append("           WHERE ");
        queryStr.append("                COLL_STATUS_FLG = '10') ");
        queryStr.append("      HAVING SUM(FT.CUR_AMT) > 100 ");
        queryStr.append("      GROUP BY SA.ACCT_ID ");
        queryStr.append(" FETCH FIRST 1 ROWS ONLY ");

        return queryStr.toString();
    }

    /*
     * This method is responsible for retrieving an account id from DB
     * @return String - Query for an account id from DB used for canceling a payplan
     */
    private static String CC003() {

        StringBuilder queryStr = new StringBuilder();
        queryStr.append(" SELECT ");
        queryStr.append("      PP.ACCT_ID ");
        queryStr.append(" FROM ");
        queryStr.append("      CI_PP PP, ");
        queryStr.append("      CI_ACCT ACCT ");
        queryStr.append(" WHERE ");
        queryStr.append("      PP.ACCT_ID = ACCT.ACCT_ID ");
        queryStr.append("      AND ACCT.CIS_DIVISION = 'CSU' ");
        queryStr.append("      AND PP.PP_TYPE_CD = 'RS' ");
        queryStr.append("      AND PP.PP_STAT_FLG = '20' ");
        queryStr.append(" FETCH FIRST 1 ROWS ONLY ");

        return queryStr.toString();
    }

    /*
     * This method is responsible for retrieving an account id from DB
     * @return String - Query for an account id from DB used for adding a payment arrangement
     */
    private static String CC004() {

        StringBuilder queryStr = new StringBuilder();
        queryStr.append(" SELECT ");
        queryStr.append("      SA.ACCT_ID ");
        queryStr.append(" FROM ");
        queryStr.append("      (SELECT ");
        queryStr.append("           SA.ACCT_ID, ");
        queryStr.append("           SUM(FT.CUR_AMT) ");
        queryStr.append("      FROM ");
        queryStr.append("           CI_SA SA, ");
        queryStr.append("           CI_FT FT, ");
        queryStr.append("           CI_ACCT ACCT ");
        queryStr.append("      WHERE ");
        queryStr.append("           SA.SA_ID = FT.SA_ID ");
        queryStr.append("           AND SA.ACCT_ID = ACCT.ACCT_ID ");
        queryStr.append("           AND SA.SA_TYPE_CD = 'E-RS' ");
        queryStr.append("           AND SA.SA_STATUS_FLG = '20' ");
        queryStr.append("           AND ACCT.CIS_DIVISION = 'CSU' ");
        queryStr.append("           HAVING SUM(FT.CUR_AMT) > 300 ");
        queryStr.append("           GROUP BY SA.ACCT_ID) SA ");
        queryStr.append(" WHERE ");
        queryStr.append("      SA.ACCT_ID IN ( ");
        queryStr.append("      SELECT  ");
        queryStr.append("           ACCT_ID ");
        queryStr.append("      FROM ");
        queryStr.append("           CI_SA ");
        queryStr.append("      GROUP BY ");
        queryStr.append("           ACCT_ID ");
        queryStr.append("           HAVING COUNT(SA_ID) = 1) ");
        queryStr.append(" FETCH FIRST 1 ROWS ONLY ");

        return queryStr.toString();
    }

    /*
     * This method is responsible for retrieving an account id from DB
     * @return String - Query for an account id from DB used for adding collection process
     */
    private static String CC005() {

        StringBuilder queryStr = new StringBuilder();
        queryStr.append(" SELECT ");
        queryStr.append("      ACCT.ACCT_ID, ");
        queryStr.append("      SA.SA_ID ");
        queryStr.append(" FROM ");
        queryStr.append("      (SELECT ");
        queryStr.append("           SA.ACCT_ID, ");
        queryStr.append("           MAX(FT.CRE_DTTM) AS CRE_DTTM, ");
        queryStr.append("           SUM(FT.CUR_AMT) ");
        queryStr.append("      FROM ");
        queryStr.append("           CI_SA SA, ");
        queryStr.append("           CI_FT FT, ");
        queryStr.append("           CI_ACCT ACCT ");
        queryStr.append("      WHERE ");
        queryStr.append("           SA.SA_ID = FT.SA_ID ");
        queryStr.append("           AND SA.ACCT_ID = ACCT.ACCT_ID ");
        queryStr.append("           AND SA.SA_TYPE_CD = 'E-RS' ");
        queryStr.append("           AND SA.SA_STATUS_FLG = '20' ");
        queryStr.append("           AND ACCT.CIS_DIVISION = 'CSU' ");
        queryStr.append("           HAVING SUM(FT.CUR_AMT) > 100 ");
        queryStr.append("           GROUP BY SA.ACCT_ID) ACCT, ");
        queryStr.append("      (SELECT ");
        queryStr.append("           ACCT_ID, ");
        queryStr.append("           SA_ID ");
        queryStr.append("      FROM ");
        queryStr.append("           CI_SA ");
        queryStr.append("      WHERE ");
        queryStr.append("           SA_STATUS_FLG = '20') SA ");
        queryStr.append(" WHERE ");
        queryStr.append("      ACCT.ACCT_ID = SA.ACCT_ID ");
        queryStr.append("      AND ACCT.ACCT_ID NOT IN (  ");
        queryStr.append("           SELECT ");
        queryStr.append("                ACCT_ID ");
        queryStr.append("           FROM ");
        queryStr.append("                CI_COLL_PROC ");
        queryStr.append("           WHERE ");
        queryStr.append("                COLL_STATUS_FLG = '10') ");
        queryStr.append("      AND ACCT.ACCT_ID NOT IN (  ");
        queryStr.append("           SELECT ");
        queryStr.append("                SA.ACCT_ID ");
        queryStr.append("           FROM ");
        queryStr.append("                CI_SEV_PROC SEV, ");
        queryStr.append("                CI_SA SA ");
        queryStr.append("           WHERE ");
        queryStr.append("                SEV.SA_ID = SA.SA_ID ");
        queryStr.append("                AND SEV_STATUS_FLG = '10') ");
        queryStr.append("      AND ACCT.ACCT_ID IN (  ");
        queryStr.append("           SELECT ");
        queryStr.append("                ACCT_ID ");
        queryStr.append("           FROM ");
        queryStr.append("                CI_ACCT_PER ");
        queryStr.append("           GROUP BY ");
        queryStr.append("                ACCT_ID ");
        queryStr.append("                HAVING COUNT(PER_ID) = 1) ");
        queryStr.append("      AND CRE_DTTM < SYSDATE-40  ");
        queryStr.append(" FETCH FIRST 1 ROWS ONLY ");

        return queryStr.toString();
    }

    /*
     * This method is responsible for retrieving an account id from DB
     * @return String - Query for an account id from DB used for adding severance process
     */
    private static String CC006() {

        StringBuilder queryStr = new StringBuilder();
        queryStr.append(" SELECT ");
        queryStr.append("      ACCT.ACCT_ID ");
        queryStr.append(" FROM ");
        queryStr.append("      (SELECT ");
        queryStr.append("           SA.ACCT_ID, ");
        queryStr.append("           MAX(FT.CRE_DTTM) AS CRE_DTTM, ");
        queryStr.append("           SUM(FT.CUR_AMT) ");
        queryStr.append("      FROM ");
        queryStr.append("           CI_SA SA, ");
        queryStr.append("           CI_FT FT, ");
        queryStr.append("           CI_ACCT ACCT ");
        queryStr.append("      WHERE ");
        queryStr.append("           SA.SA_ID = FT.SA_ID ");
        queryStr.append("           AND SA.ACCT_ID = ACCT.ACCT_ID ");
        queryStr.append("           AND SA.SA_TYPE_CD = 'E-RS' ");
        queryStr.append("           AND SA.SA_STATUS_FLG = '20' ");
        queryStr.append("           AND ACCT.CIS_DIVISION = 'CSU' ");
        queryStr.append("           HAVING SUM(FT.CUR_AMT) > 150 ");
        queryStr.append("           GROUP BY SA.ACCT_ID) ");
        queryStr.append(" WHERE ");
        queryStr.append("      ACCT_ID NOT IN (  ");
        queryStr.append("           SELECT ");
        queryStr.append("                ACCT_ID ");
        queryStr.append("           FROM ");
        queryStr.append("                CI_COLL_PROC ");
        queryStr.append("           WHERE ");
        queryStr.append("                COLL_STATUS_FLG = '10') ");
        queryStr.append("      AND ACCT_ID NOT IN (  ");
        queryStr.append("           SELECT ");
        queryStr.append("                SA.ACCT_ID ");
        queryStr.append("           FROM ");
        queryStr.append("                CI_SEV_PROC SEV, ");
        queryStr.append("                CI_SA SA ");
        queryStr.append("           WHERE ");
        queryStr.append("                SEV.SA_ID = SA.SA_ID ");
        queryStr.append("                AND SEV_STATUS_FLG = '10') ");
        queryStr.append("      AND ACCT_ID IN (  ");
        queryStr.append("           SELECT ");
        queryStr.append("                ACCT_ID ");
        queryStr.append("           FROM ");
        queryStr.append("                CI_ACCT_PER ");
        queryStr.append("           GROUP BY ");
        queryStr.append("                ACCT_ID ");
        queryStr.append("                HAVING COUNT(PER_ID) = 1) ");
        queryStr.append("      AND CRE_DTTM < SYSDATE-40  ");
        queryStr.append(" FETCH FIRST 1 ROWS ONLY ");

        return queryStr.toString();
    }

    /*
     * This method is responsible for retrieving an account id from DB
     * @return String - Query for an account id from DB used for adding a write off process
     */
    private static String CC007() {

        StringBuilder queryStr = new StringBuilder();
        queryStr.append(" SELECT ");
        queryStr.append("      ACCT.ACCT_ID, ");
        queryStr.append("      SA.SA_ID ");
        queryStr.append(" FROM ");
        queryStr.append("      (SELECT ");
        queryStr.append("           SA.ACCT_ID, ");
        queryStr.append("           MAX(FT.CRE_DTTM) AS CRE_DTTM, ");
        queryStr.append("           SUM(FT.CUR_AMT) ");
        queryStr.append("      FROM ");
        queryStr.append("           CI_SA SA, ");
        queryStr.append("           CI_FT FT, ");
        queryStr.append("           CI_ACCT ACCT ");
        queryStr.append("      WHERE ");
        queryStr.append("           SA.SA_ID = FT.SA_ID ");
        queryStr.append("           AND SA.ACCT_ID = ACCT.ACCT_ID ");
        queryStr.append("           AND SA.SA_TYPE_CD = 'E-RS' ");
        queryStr.append("           AND SA.SA_STATUS_FLG = '20' ");
        queryStr.append("           AND ACCT.CIS_DIVISION = 'CSU' ");
        queryStr.append("           HAVING SUM(FT.CUR_AMT) > 150 ");
        queryStr.append("           GROUP BY SA.ACCT_ID) ACCT,");
        queryStr.append("      (SELECT ");
        queryStr.append("           ACCT_ID, ");
        queryStr.append("           SA_ID ");
        queryStr.append("      FROM ");
        queryStr.append("           CI_SA SA ");
        queryStr.append("      WHERE ");
        queryStr.append("           SA_STATUS_FLG = '20') SA ");
        queryStr.append(" WHERE ");
        queryStr.append("      ACCT.ACCT_ID = SA.ACCT_ID  ");
        queryStr.append("      AND ACCT.ACCT_ID IN (  ");
        queryStr.append("           SELECT ");
        queryStr.append("                ACCT_ID ");
        queryStr.append("           FROM ");
        queryStr.append("                CI_ACCT_PER ");
        queryStr.append("           GROUP BY ");
        queryStr.append("                ACCT_ID ");
        queryStr.append("                HAVING COUNT(PER_ID) = 1) ");
        queryStr.append("      AND ACCT.ACCT_ID NOT IN (  ");
        queryStr.append("           SELECT ");
        queryStr.append("                ACCT_ID ");
        queryStr.append("           FROM ");
        queryStr.append("                CI_WO_PROC ");
        queryStr.append("           WHERE ");
        queryStr.append("                WO_STATUS_FLG = '10') ");
        queryStr.append("      AND CRE_DTTM < SYSDATE-40  ");
        queryStr.append(" FETCH FIRST 1 ROWS ONLY ");

        return queryStr.toString();
    }

    /*
     * This method is responsible for retrieving an account id from DB
     * @return String - Query for an account id from DB used for cancelling collection process
     */
    private static String CC008() {

        StringBuilder queryStr = new StringBuilder();
        queryStr.append(" SELECT ");
        queryStr.append("      ACCT.ACCT_ID ");
        queryStr.append(" FROM ");
        queryStr.append("      CI_ACCT ACCT, ");
        queryStr.append("      CI_COLL_PROC COLL ");
        queryStr.append(" WHERE ");
        queryStr.append("      ACCT.ACCT_ID = COLL.ACCT_ID  ");
        queryStr.append("      AND ACCT.CIS_DIVISION = 'CSU'  ");
        queryStr.append("      AND COLL.COLL_STATUS_FLG = '10'  ");
        queryStr.append("      AND ACCT.ACCT_ID IN (  ");
        queryStr.append("           SELECT ");
        queryStr.append("                ACCT_ID ");
        queryStr.append("           FROM ");
        queryStr.append("                CI_ACCT_PER ");
        queryStr.append("           GROUP BY ");
        queryStr.append("                ACCT_ID ");
        queryStr.append("           HAVING COUNT(PER_ID) = 1) ");
        queryStr.append(" FETCH FIRST 1 ROWS ONLY ");

        return queryStr.toString();
    }

    /*
     * This method is responsible for retrieving an account id from DB
     * @return String - Query for an account id from DB used for cancelling collection process
     */
    private static String CC009() {

        StringBuilder queryStr = new StringBuilder();
        queryStr.append(" SELECT ");
        queryStr.append("      ACCT.ACCT_ID ");
        queryStr.append(" FROM ");
        queryStr.append("      CI_ACCT ACCT, ");
        queryStr.append("      CI_SEV_PROC SEV, ");
        queryStr.append("      CI_SA SA ");
        queryStr.append(" WHERE ");
        queryStr.append("      ACCT.ACCT_ID = SA.ACCT_ID  ");
        queryStr.append("      AND SA.SA_ID = SEV.SA_ID  ");
        queryStr.append("      AND ACCT.CIS_DIVISION = 'CSU'  ");
        queryStr.append("      AND SEV.SEV_STATUS_FLG = '10'  ");
        queryStr.append("      AND ACCT.ACCT_ID IN (  ");
        queryStr.append("           SELECT ");
        queryStr.append("                ACCT_ID ");
        queryStr.append("           FROM ");
        queryStr.append("                CI_ACCT_PER ");
        queryStr.append("           GROUP BY ");
        queryStr.append("                ACCT_ID ");
        queryStr.append("           HAVING COUNT(PER_ID) = 1) ");
        queryStr.append(" FETCH FIRST 1 ROWS ONLY ");

        return queryStr.toString();
    }

    /*
     * This method is responsible for retrieving an account id from DB
     * @return String - Query for an account id from DB used for cancelling write off process
     */
    private static String CC010() {

        StringBuilder queryStr = new StringBuilder();
        queryStr.append(" SELECT ");
        queryStr.append("      ACCT.ACCT_ID ");
        queryStr.append(" FROM ");
        queryStr.append("      CI_ACCT ACCT, ");
        queryStr.append("      CI_WO_PROC WO ");
        queryStr.append(" WHERE ");
        queryStr.append("      ACCT.ACCT_ID = WO.ACCT_ID  ");
        queryStr.append("      AND ACCT.CIS_DIVISION = 'CSU'  ");
        queryStr.append("      AND WO.WO_STATUS_FLG = '10'  ");
        queryStr.append("      AND ACCT.ACCT_ID IN (  ");
        queryStr.append("           SELECT ");
        queryStr.append("                ACCT_ID ");
        queryStr.append("           FROM ");
        queryStr.append("                CI_ACCT_PER ");
        queryStr.append("           GROUP BY ");
        queryStr.append("                ACCT_ID ");
        queryStr.append("           HAVING COUNT(PER_ID) = 1) ");
        queryStr.append(" FETCH FIRST 1 ROWS ONLY ");

        return queryStr.toString();
    }

    /*
     * This method is responsible for retrieving an account id from DB
     * @return String - Query for an account id from DB used for manually adding credit points
     */
    private static String CC011() {

        StringBuilder queryStr = new StringBuilder();
        queryStr.append(" SELECT ");
        queryStr.append("      ACCT.ACCT_ID ");
        queryStr.append(" FROM ");
        queryStr.append("      CI_ACCT ACCT, ");
        queryStr.append("      CI_SA SA ");
        queryStr.append(" WHERE ");
        queryStr.append("      SA.ACCT_ID = ACCT.ACCT_ID  ");
        queryStr.append("      AND ACCT.CIS_DIVISION = 'CSU'  ");
        queryStr.append("      AND TRIM(ACCT.MAILING_PREM_ID) IS NOT NULL  ");
        queryStr.append("      AND SA.SA_STATUS_FLG = '20'  ");
        queryStr.append("      AND SA.SA_TYPE_CD = 'E-RS'  ");
        queryStr.append("      AND ACCT.ACCT_ID IN (  ");
        queryStr.append("           SELECT ");
        queryStr.append("                ACCT_ID ");
        queryStr.append("           FROM ");
        queryStr.append("                CI_ACCT_PER ");
        queryStr.append("           GROUP BY ");
        queryStr.append("                ACCT_ID ");
        queryStr.append("           HAVING COUNT(PER_ID) = 1) ");
        queryStr.append(" FETCH FIRST 1 ROWS ONLY ");

        return queryStr.toString();
    }

    /*
     * This method is responsible for retrieving an account id from DB
     * @return String - Query for an account id from DB used for modify a collection event trigger date
     */
    private static String CC012() {

        StringBuilder queryStr = new StringBuilder();
        queryStr.append(" SELECT ");
        queryStr.append("      ACCT.ACCT_ID, ");
        queryStr.append("      COLLEVT.TRIGGER_DT+1 AS TRIGGER_DT ");
        queryStr.append(" FROM ");
        queryStr.append("      CI_ACCT ACCT, ");
        queryStr.append("      CI_COLL_PROC COLL, ");
        queryStr.append("      (SELECT ");
        queryStr.append("           COLL_PROC_ID, ");
        queryStr.append("           TRIGGER_DT ");
        queryStr.append("      FROM ");
        queryStr.append("           CI_COLL_EVT ");
        queryStr.append("      WHERE ");
        queryStr.append("           EVT_SEQ = '20') COLLEVT ");
        queryStr.append(" WHERE ");
        queryStr.append("      ACCT.ACCT_ID = COLL.ACCT_ID ");
        queryStr.append("      AND COLL.COLL_PROC_ID = COLLEVT.COLL_PROC_ID ");
        queryStr.append("      AND ACCT.CIS_DIVISION = 'CSU' ");
        queryStr.append("      AND COLL.COLL_STATUS_FLG = '10' ");
        queryStr.append("      AND COLL.COLL_PROC_ID IN ( ");
        queryStr.append("           SELECT ");
        queryStr.append("                COLL_PROC_ID ");
        queryStr.append("           FROM ");
        queryStr.append("                CI_COLL_EVT ");
        queryStr.append("           WHERE ");
        queryStr.append("                EVT_SEQ = '20' ");
        queryStr.append("                AND COLL_EVT_STAT_FLG < '30') ");
        queryStr.append("      AND ACCT.ACCT_ID IN (  ");
        queryStr.append("           SELECT ");
        queryStr.append("                ACCT_ID ");
        queryStr.append("           FROM ");
        queryStr.append("                CI_ACCT_PER ");
        queryStr.append("           GROUP BY ");
        queryStr.append("                ACCT_ID ");
        queryStr.append("           HAVING COUNT(PER_ID) = 1) ");
        queryStr.append(" FETCH FIRST 1 ROWS ONLY ");

        return queryStr.toString();
    }

    /*
     * This method is responsible for retrieving an account id from DB
     * @return String - Query for an account id from DB used for modify a severance event trigger date
     */
    private static String CC013() {

        StringBuilder queryStr = new StringBuilder();
        queryStr.append(" SELECT ");
        queryStr.append("      ACCT.ACCT_ID, ");
        queryStr.append("      SEVEVT.TRIGGER_DT+1 AS TRIGGER_DT ");
        queryStr.append(" FROM ");
        queryStr.append("      CI_ACCT ACCT, ");
        queryStr.append("      CI_SEV_PROC SEV, ");
        queryStr.append("      CI_SA SA, ");
        queryStr.append("      (SELECT ");
        queryStr.append("           SEV_PROC_ID, ");
        queryStr.append("           TRIGGER_DT ");
        queryStr.append("      FROM ");
        queryStr.append("           CI_SEV_EVT ");
        queryStr.append("      WHERE ");
        queryStr.append("           EVT_SEQ = '10') SEVEVT ");
        queryStr.append(" WHERE ");
        queryStr.append("      ACCT.ACCT_ID = SA.ACCT_ID ");
        queryStr.append("      AND SEV.SEV_PROC_ID = SEVEVT.SEV_PROC_ID ");
        queryStr.append("      AND SA.SA_ID = SEV.SA_ID ");
        queryStr.append("      AND ACCT.CIS_DIVISION = 'CSU' ");;
        queryStr.append("      AND SEV.SEV_STATUS_FLG = '10' ");
        queryStr.append("      AND SEV.SEV_PROC_ID IN ( ");
        queryStr.append("           SELECT ");
        queryStr.append("                SEV_PROC_ID ");
        queryStr.append("           FROM ");
        queryStr.append("                CI_SEV_EVT ");
        queryStr.append("           WHERE ");
        queryStr.append("                EVT_SEQ = '10' ");
        queryStr.append("                AND SEV_EVT_STAT_FLG = '10') ");
        queryStr.append("      AND ACCT.ACCT_ID IN (  ");
        queryStr.append("           SELECT ");
        queryStr.append("                ACCT_ID ");
        queryStr.append("           FROM ");
        queryStr.append("                CI_ACCT_PER ");
        queryStr.append("           GROUP BY ");
        queryStr.append("                ACCT_ID ");
        queryStr.append("           HAVING COUNT(PER_ID) = 1) ");
        queryStr.append(" FETCH FIRST 1 ROWS ONLY ");

        return queryStr.toString();
    }

    /*
     * This method is responsible for retrieving an account id from DB
     * @return String - Query for an account id from DB used for modify a write off event trigger date
     */
    private static String CC014() {

        StringBuilder queryStr = new StringBuilder();
        queryStr.append(" SELECT ");
        queryStr.append("      ACCT.ACCT_ID, ");
        queryStr.append("      WO.WO_PROC_ID, ");
        queryStr.append("      WOEVT.TRIGGER_DT+1 AS TRIGGER_DT ");
        queryStr.append(" FROM ");
        queryStr.append("      CI_ACCT ACCT, ");
        queryStr.append("      CI_WO_PROC WO, ");
        queryStr.append("      (SELECT ");
        queryStr.append("           WO_PROC_ID, ");
        queryStr.append("           TRIGGER_DT ");
        queryStr.append("      FROM ");
        queryStr.append("           CI_WO_EVT ");
        queryStr.append("      WHERE ");
        queryStr.append("           EVT_SEQ = '20') WOEVT ");
        queryStr.append(" WHERE ");
        queryStr.append("      ACCT.ACCT_ID = WO.ACCT_ID ");
        queryStr.append("      AND WO.WO_PROC_ID = WOEVT.WO_PROC_ID ");
        queryStr.append("      AND ACCT.CIS_DIVISION = 'CSU' ");
        queryStr.append("      AND WO.WO_STATUS_FLG = '10' ");
        queryStr.append("      AND WO.WO_PROC_ID IN ( ");
        queryStr.append("           SELECT ");
        queryStr.append("                WO_PROC_ID ");
        queryStr.append("           FROM ");
        queryStr.append("                CI_WO_EVT ");
        queryStr.append("           WHERE ");
        queryStr.append("                EVT_SEQ = '20' ");
        queryStr.append("                AND WO_EVT_STAT_FLG < '30') ");
        queryStr.append("      AND ACCT.ACCT_ID IN (  ");
        queryStr.append("           SELECT ");
        queryStr.append("                ACCT_ID ");
        queryStr.append("           FROM ");
        queryStr.append("                CI_ACCT_PER ");
        queryStr.append("           GROUP BY ");
        queryStr.append("                ACCT_ID ");
        queryStr.append("           HAVING COUNT(PER_ID) = 1) ");
        queryStr.append(" FETCH FIRST 1 ROWS ONLY ");

        return queryStr.toString();
    }

    /*
     * This method is responsible for retrieving a premise id from DB
     * @return String - Query for a premise id from DB used for adding a SP
     */
    private static String CI003() {

        StringBuilder queryStr = new StringBuilder();
        queryStr.append(" SELECT ");
        queryStr.append("      PREM_ID ");
        queryStr.append(" FROM ");
        queryStr.append("      CI_PREM ");
        queryStr.append(" WHERE ");
        queryStr.append("      PREM_TYPE_CD='SF' ");
        queryStr.append("      AND PREM_ID NOT IN ( ");
        queryStr.append("           SELECT ");
        queryStr.append("                PREM_ID ");
        queryStr.append("           FROM ");
        queryStr.append("                CI_SP) ");
        queryStr.append(" FETCH FIRST 1 ROWS ONLY ");

        return queryStr.toString();
    }

    /*
     * This method is responsible for retrieving an account id from DB
     * @return String - Query for an account id from DB used for person sync c2m to mdm
     */
    private static String CI004() {

        StringBuilder queryStr = new StringBuilder();
        queryStr.append(" SELECT ");
        queryStr.append("      PER.ACCT_ID, ");
        queryStr.append("      PER.ENTITY_NAME, ");
        queryStr.append("      PREM.PREM_ID, ");
        queryStr.append("      SD.START_DATE, ");
        queryStr.append("      PREMDET.ADDRESS1, ");
        queryStr.append("      PREMDET.CITY ");
        queryStr.append(" FROM ");
        queryStr.append("      (SELECT ");
        queryStr.append("           DISTINCT CA.ACCT_ID, ");
        queryStr.append("           CPN.ENTITY_NAME ");
        queryStr.append("      FROM ");
        queryStr.append("           CI_ACCT CA, ");
        queryStr.append("           CI_ACCT_PER CAP, ");
        queryStr.append("           CI_PER CP, ");
        queryStr.append("           CI_PER_NAME CPN ");
        queryStr.append("      WHERE ");
        queryStr.append("           CA.CIS_DIVISION='CSU' ");
        queryStr.append("           AND TRIM(MAILING_PREM_ID) IS NULL ");
        queryStr.append("           AND CA.ACCT_ID=CAP.ACCT_ID ");
        queryStr.append("           AND CAP.ACCT_REL_TYPE_CD='MAIN' ");
        queryStr.append("           AND CAP.PER_ID=CP.PER_ID ");
        queryStr.append("           AND CP.PER_OR_BUS_FLG='P' ");
        queryStr.append("           AND CP.PER_ID=CPN.PER_ID) PER, ");
        queryStr.append("      (SELECT ");
        queryStr.append("           DISTINCT CP.PREM_ID ");
        queryStr.append("      FROM ");
        queryStr.append("           CI_PREM CP, ");
        queryStr.append("           CI_SP CSP ");
        queryStr.append("      WHERE ");
        queryStr.append("           CP.CIS_DIVISION='CSU' ");
        queryStr.append("           AND CP.PREM_TYPE_CD='SF' ");
        queryStr.append("           AND CSP.PREM_ID NOT IN ( ");
        queryStr.append("                SELECT ");
        queryStr.append("                     MAILING_PREM_ID ");
        queryStr.append("                FROM ");
        queryStr.append("                     CI_ACCT ");
        queryStr.append("                WHERE ");
        queryStr.append("                     TRIM(MAILING_PREM_ID) IS NOT NULL) ");
        queryStr.append("           AND CP.PREM_ID=CSP.PREM_ID ");
        queryStr.append("           AND CSP.PREM_ID IN ( ");
        queryStr.append("                SELECT ");
        queryStr.append("                     PREM_ID ");
        queryStr.append("                FROM ");
        queryStr.append("                     CI_SP ");
        queryStr.append("                WHERE ");
        queryStr.append("                     PREM_ID=CSP.PREM_ID ");
        queryStr.append("                GROUP BY ");
        queryStr.append("                     PREM_ID HAVING COUNT(PREM_ID)=1) ");
        queryStr.append("           AND CSP.SP_TYPE_CD LIKE '%RES' ");
        queryStr.append("           AND CSP.SP_ID NOT IN( ");
        queryStr.append("                SELECT ");
        queryStr.append("                     SP_ID ");
        queryStr.append("                FROM ");
        queryStr.append("                     CI_SA_SP)) PREM, ");
        queryStr.append("      (SELECT ");
        queryStr.append("           TO_CHAR(CURRENT_DATE - 1, 'MM-DD-YYYY') AS START_DATE ");
        queryStr.append("      FROM ");
        queryStr.append("           DUAL) SD, ");
        queryStr.append("      (SELECT ");
        queryStr.append("           PREM_ID, ");
        queryStr.append("           ADDRESS1, ");
        queryStr.append("           CITY ");
        queryStr.append("      FROM ");
        queryStr.append("           CI_PREM) PREMDET ");
        queryStr.append(" WHERE ");
        queryStr.append("      PREM.PREM_ID = PREMDET.PREM_ID ");
        queryStr.append(" FETCH FIRST 1 ROWS ONLY ");

        return queryStr.toString();
    }

    /*
     * This method is responsible for retrieving an account id from DB
     * @return String - Query for an account id from DB used for start service agreement
     */
    private static String CI005() {

        StringBuilder queryStr = new StringBuilder();
        queryStr.append(" SELECT ");
        queryStr.append("      PER.ACCT_ID, ");
        queryStr.append("      PER.ENTITY_NAME, ");
        queryStr.append("      PREM.PREM_ID, ");
        queryStr.append("      PERCONT.CONTACT_VALUE ");
        queryStr.append(" FROM ");
        queryStr.append("      (SELECT ");
        queryStr.append("           CA.ACCT_ID, ");
        queryStr.append("           CP.PER_ID, ");
        queryStr.append("           CPN.ENTITY_NAME ");
        queryStr.append("      FROM ");
        queryStr.append("           CI_ACCT CA, ");
        queryStr.append("           CI_ACCT_PER CAP, ");
        queryStr.append("           CI_PER CP, ");
        queryStr.append("           CI_PER_NAME CPN ");
        queryStr.append("      WHERE ");
        queryStr.append("           CA.CIS_DIVISION='CSU' ");
        queryStr.append("           AND TRIM(MAILING_PREM_ID) IS NULL ");
        queryStr.append("           AND CA.ACCT_ID=CAP.ACCT_ID ");
        queryStr.append("           AND CAP.ACCT_REL_TYPE_CD='MAIN' ");
        queryStr.append("           AND CAP.PER_ID=CP.PER_ID ");
        queryStr.append("           AND CP.PER_OR_BUS_FLG='P' ");
        queryStr.append("           AND CP.PER_ID=CPN.PER_ID) PER, ");
        queryStr.append("      (SELECT ");
        queryStr.append("           CP.PREM_ID ");
        queryStr.append("      FROM ");
        queryStr.append("           CI_PREM CP, ");
        queryStr.append("           CI_SP CSP ");
        queryStr.append("      WHERE ");
        queryStr.append("           CP.CIS_DIVISION='CSU' ");
        queryStr.append("           AND CP.PREM_TYPE_CD='SF' ");
        queryStr.append("           AND CSP.PREM_ID NOT IN ( ");
        queryStr.append("                SELECT ");
        queryStr.append("                     MAILING_PREM_ID ");
        queryStr.append("                FROM ");
        queryStr.append("                     CI_ACCT ");
        queryStr.append("                WHERE ");
        queryStr.append("                     TRIM(MAILING_PREM_ID) IS NOT NULL) ");
        queryStr.append("           AND CP.PREM_ID=CSP.PREM_ID ");
        queryStr.append("           AND CSP.PREM_ID IN ( ");
        queryStr.append("                SELECT ");
        queryStr.append("                     PREM_ID ");
        queryStr.append("                FROM ");
        queryStr.append("                     CI_SP ");
        queryStr.append("                WHERE ");
        queryStr.append("                     PREM_ID=CSP.PREM_ID ");
        queryStr.append("                GROUP BY ");
        queryStr.append("                     PREM_ID HAVING COUNT(PREM_ID)=1) ");
        queryStr.append("           AND CSP.SP_TYPE_CD LIKE '%RES' ");
        queryStr.append("           AND CSP.SP_ID NOT IN( ");
        queryStr.append("                SELECT ");
        queryStr.append("                     SP_ID ");
        queryStr.append("                FROM ");
        queryStr.append("                     CI_SA_SP)) PREM, ");
        queryStr.append("      (SELECT ");
        queryStr.append("           PER_ID, ");
        queryStr.append("           CONTACT_VALUE ");
        queryStr.append("      FROM ");
        queryStr.append("           C1_PER_CONTDET ");
        queryStr.append("      WHERE ");
        queryStr.append("           COMM_RTE_TYPE_CD = 'PRIMARYEMAIL') PERCONT ");
        queryStr.append(" WHERE ");
        queryStr.append("      PER.PER_ID = PERCONT.PER_ID ");
        queryStr.append(" FETCH FIRST 1 ROWS ONLY ");

        return queryStr.toString();
    }

    /*
     * This method is responsible for retrieving an account id from DB
     * @return String - Query for an account id from DB used for stop service agreement
     */
    private static String CI007() {

        StringBuilder queryStr = new StringBuilder();
        queryStr.append(" SELECT ");
        queryStr.append("      CA.ACCT_ID, ");
        queryStr.append("      CA.MAILING_PREM_ID ");
        queryStr.append(" FROM ");
        queryStr.append("      CI_ACCT CA, ");
        queryStr.append("      CI_SA SA ");
        queryStr.append(" WHERE ");
        queryStr.append("      CA.CIS_DIVISION = 'CSU' ");
        queryStr.append("      AND CA.ACCT_ID = SA.ACCT_ID ");
        queryStr.append("      AND TRIM(CA.MAILING_PREM_ID) IS NOT NULL ");
        queryStr.append("      AND CA.ACCT_ID IN ( ");
        queryStr.append("           SELECT ");
        queryStr.append("                ACCT_ID ");
        queryStr.append("           FROM ");
        queryStr.append("                CI_SA ");
        queryStr.append("           WHERE ");
        queryStr.append("                ACCT_ID = CA.ACCT_ID ");
        queryStr.append("                AND SA_STATUS_FLG = '20' ");
        queryStr.append("                AND SA_TYPE_CD LIKE '%RS%' ");
        queryStr.append("                GROUP BY ");
        queryStr.append("                     ACCT_ID ");
        queryStr.append("                HAVING COUNT(ACCT_ID)=1) ");
        queryStr.append(" FETCH FIRST 1 ROWS ONLY ");

        return queryStr.toString();
    }

    /*
     * This method is responsible for retrieving a account id from DB
     * @return String - Query for a account id from DB used to create deposit SA
     */
    private static String CI008() {

        StringBuilder queryStr = new StringBuilder();
        queryStr.append(" SELECT ");
        queryStr.append("      CA.ACCT_ID, ");
        queryStr.append("      CA.MAILING_PREM_ID ");
        queryStr.append(" FROM ");
        queryStr.append("      CI_ACCT CA, ");
        queryStr.append("      CI_SA SA ");
        queryStr.append(" WHERE ");
        queryStr.append("      CA.CIS_DIVISION ='CSU'  ");
        queryStr.append("      AND CA.ACCT_ID = SA.ACCT_ID  ");
        queryStr.append("      AND TRIM(CA.MAILING_PREM_ID) IS NOT NULL  ");
        queryStr.append("      AND CA.ACCT_ID NOT IN ( ");
        queryStr.append("           SELECT ");
        queryStr.append("                ACCT_ID ");
        queryStr.append("           FROM ");
        queryStr.append("                CI_SA ");
        queryStr.append("           WHERE ");
        queryStr.append("                SA_TYPE_CD = 'RESDEP'  ");
        queryStr.append("                AND SA_STATUS_FLG = '20')  ");
        queryStr.append("      AND CA.ACCT_ID IN ( ");
        queryStr.append("           SELECT ");
        queryStr.append("                ACCT_ID ");
        queryStr.append("           FROM ");
        queryStr.append("                CI_SA ");
        queryStr.append("           WHERE ");
        queryStr.append("                ACCT_ID = CA.ACCT_ID  ");
        queryStr.append("                AND SA_TYPE_CD LIKE '%RS%'  ");
        queryStr.append("           GROUP BY ");
        queryStr.append("                ACCT_ID  ");
        queryStr.append("           HAVING COUNT(ACCT_ID)=1) ");
        queryStr.append(" FETCH FIRST 1 ROWS ONLY ");

        return queryStr.toString();
    }

    /*
     * This method is responsible for retrieving an entity name from DB
     * @return String - Query for a entity name from DB used sync sa from c2m to mdm
     */
    private static String CI009() {

        StringBuilder queryStr = new StringBuilder();
        queryStr.append(" SELECT ");
        queryStr.append("      DISTINCT CPN.ENTITY_NAME ");
        queryStr.append(" FROM ");
        queryStr.append("      CI_PER_NAME CPN, ");
        queryStr.append("      CI_PER CP, ");
        queryStr.append("      CI_ACCT_PER CAP, ");
        queryStr.append("      CI_ACCT CA, ");
        queryStr.append("      CI_SA CSA ");
        queryStr.append(" WHERE ");
        queryStr.append("      CPN.PER_ID=CP.PER_ID  ");
        queryStr.append("      AND CP.PER_OR_BUS_FLG='P'  ");
        queryStr.append("      AND CP.PER_ID=CAP.PER_ID  ");
        queryStr.append("      AND CAP.ACCT_REL_TYPE_CD='MAIN' ");
        queryStr.append("      AND CAP.ACCT_ID=CA.ACCT_ID ");
        queryStr.append("      AND CA.ACCT_ID=CSA.ACCT_ID ");
        queryStr.append("      AND CSA.CIS_DIVISION='CSU' ");
        queryStr.append("      AND CSA.SA_TYPE_CD LIKE '%RS%' ");
        queryStr.append("      AND CSA.SA_STATUS_FLG='20' ");
        queryStr.append("      AND TO_CHAR(CSA.START_DT, 'DD-MON-YY') > '01-NOV-20' ");
        queryStr.append(" FETCH FIRST 1 ROWS ONLY ");

        return queryStr.toString();
    }

    /*
     * This method is responsible for retrieving an premise id from DB
     * @return String - Query for an premise id from DB used for adding a parent premise to child premise
     */
    private static String CI010() {

        StringBuilder queryStr = new StringBuilder();
        queryStr.append(" SELECT ");
        queryStr.append("      PPREM.PREM_ID AS PARENT, ");
        queryStr.append("      CPREM.PREM_ID AS CHILD ");
        queryStr.append(" FROM ");
        queryStr.append("      (SELECT ");
        queryStr.append("           DISTINCT PREM_ID ");
        queryStr.append("      FROM ");
        queryStr.append("           CI_PREM) PPREM, ");
        queryStr.append("      (SELECT ");
        queryStr.append("           DISTINCT PREM_ID ");
        queryStr.append("      FROM ");
        queryStr.append("           CI_PREM ");
        queryStr.append("      WHERE ");
        queryStr.append("           TRIM(PRNT_PREM_ID) IS NULL) CPREM ");
        queryStr.append(" WHERE ");
        queryStr.append("      PPREM.PREM_ID != CPREM.PREM_ID ");
        queryStr.append(" FETCH FIRST 1 ROWS ONLY ");

        return queryStr.toString();
    }

    /*
     * This method is responsible for retrieving an landlord and premise id from DB
     * @return String - Query for an landlord and premise id from DB used for adding a landlord to a premise
     */
    private static String CI011() {

        StringBuilder queryStr = new StringBuilder();
        queryStr.append(" SELECT ");
        queryStr.append("      LLORD.LL_ID AS LANDLORD, ");
        queryStr.append("      PREM.PREM_ID AS PREMISE ");
        queryStr.append(" FROM ");
        queryStr.append("      (SELECT ");
        queryStr.append("           LL_ID ");
        queryStr.append("      FROM ");
        queryStr.append("           CI_LANDLORD) LLORD, ");
        queryStr.append("      (SELECT ");
        queryStr.append("           PREM_ID ");
        queryStr.append("      FROM ");
        queryStr.append("           CI_PREM ");
        queryStr.append("      WHERE ");
        queryStr.append("           TRIM(LL_ID) IS NULL) PREM ");
        queryStr.append(" FETCH FIRST 1 ROWS ONLY ");

        return queryStr.toString();
    }


    //Billing test cases
    private static String BIL004() {
        StringBuilder queryStr = new StringBuilder();
        queryStr.append(" SELECT ");
        queryStr.append("      CA.ACCT_ID ");
        queryStr.append(" FROM ");
        queryStr.append("      CI_ACCT CA, ");
        queryStr.append("      CI_ACCT_PER CAP, ");
        queryStr.append("      CI_PER CP, ");
        queryStr.append("      CI_SA CSA ");
        queryStr.append(" WHERE ");
        queryStr.append("      CA.CIS_DIVISION='CSU' ");
        queryStr.append("      AND TRIM(MAILING_PREM_ID) IS NULL ");
        queryStr.append("      AND CA.ACCT_ID=CAP.ACCT_ID ");
        queryStr.append("      AND CAP.ACCT_REL_TYPE_CD='MAIN' ");
        queryStr.append("      AND CAP.PER_ID=CP.PER_ID ");
        queryStr.append("      AND CP.PER_OR_BUS_FLG='P' ");
        queryStr.append("      AND CA.ACCT_ID IN ( ");
        queryStr.append("            SELECT ");
        queryStr.append("                  ACCT_ID ");
        queryStr.append("            FROM ");
        queryStr.append("                  CI_SA ");
        queryStr.append("            WHERE ");
        queryStr.append("                  CA.ACCT_ID=ACCT_ID ");
        queryStr.append("                  GROUP BY ACCT_ID ");
        queryStr.append("                  HAVING COUNT(ACCT_ID) = 1) ");
        queryStr.append("      AND CA.ACCT_ID=CSA.ACCT_ID ");
        queryStr.append("      AND TRIM(CSA.SA_TYPE_CD) LIKE '%RS' ");
        queryStr.append("      AND CSA.SA_STATUS_FLG='20' ");
        queryStr.append("      FETCH FIRST 1 ROWS ONLY ");

        return queryStr.toString();
    }

    private static String BIL005() {
        StringBuilder queryStr = new StringBuilder();
        queryStr.append(" SELECT ");
        queryStr.append("      CA.ACCT_ID ");
        queryStr.append(" FROM ");
        queryStr.append("      CI_ACCT CA, ");
        queryStr.append("      CI_ACCT_PER CAP, ");
        queryStr.append("      CI_PER CP, ");
        queryStr.append("      CI_SA CSA ");
        queryStr.append(" WHERE ");
        queryStr.append("      CA.CIS_DIVISION='DIV1' ");
        queryStr.append("      AND TRIM(MAILING_PREM_ID) IS NULL ");
        queryStr.append("      AND CA.ACCT_ID=CAP.ACCT_ID ");
        queryStr.append("      AND CAP.ACCT_REL_TYPE_CD='MAIN' ");
        queryStr.append("      AND CAP.PER_ID=CP.PER_ID ");
        queryStr.append("      AND CP.PER_OR_BUS_FLG='P' ");
        queryStr.append("      AND CA.ACCT_ID IN ( ");
        queryStr.append("            SELECT ");
        queryStr.append("                  ACCT_ID ");
        queryStr.append("            FROM ");
        queryStr.append("                  CI_SA ");
        queryStr.append("            WHERE ");
        queryStr.append("                  CA.ACCT_ID=ACCT_ID ");
        queryStr.append("                  GROUP BY ACCT_ID ");
        queryStr.append("                  HAVING COUNT(ACCT_ID) = 1) ");
        queryStr.append("      AND CA.ACCT_ID=CSA.ACCT_ID ");
        queryStr.append("      AND TRIM(CSA.SA_TYPE_CD) LIKE '%RES' ");
        queryStr.append("      AND CSA.SA_STATUS_FLG='20' ");
        queryStr.append("      FETCH FIRST 1 ROWS ONLY ");
        return queryStr.toString();
    }
    private static String BIL002() {

        StringBuilder queryStr = new StringBuilder();
        queryStr.append(" SELECT ");
        queryStr.append("      DISTINCT ACCT.ACCT_ID, ");
        queryStr.append("      BILLID.BILL_ID, ");
        queryStr.append("      BSEG.SA_ID ");
        queryStr.append(" FROM ");
        queryStr.append("      CI_ACCT ACCT, ");
        queryStr.append("      CI_SA SA, ");
        queryStr.append("      CI_BILL CBILL, ");
        queryStr.append("      CI_BSEG BSEG, ");
        queryStr.append("      (SELECT ");
        queryStr.append("            ACCT_ID, ");
        queryStr.append("            MAX(BILL_DT) AS MAXBILL ");
        queryStr.append("      FROM ");
        queryStr.append("            CI_BILL ");
        queryStr.append("            GROUP BY ACCT_ID) BILL, ");
        queryStr.append("      (SELECT ");
        queryStr.append("            ACCT_ID, ");
        queryStr.append("            BILL_DT, ");
        queryStr.append("            BILL_ID ");
        queryStr.append("      FROM ");
        queryStr.append("            CI_BILL) BILLID ");
        queryStr.append(" WHERE ");
        queryStr.append("      ACCT.ACCT_ID = SA.ACCT_ID ");
        queryStr.append("      AND ACCT.ACCT_ID = BILL.ACCT_ID ");
        queryStr.append("      AND ACCT.ACCT_ID = CBILL.ACCT_ID ");
        queryStr.append("      AND BILL.MAXBILL = BILLID.BILL_DT ");
        queryStr.append("      AND BILLID.BILL_ID = BSEG.BILL_ID ");
        queryStr.append("      AND ACCT.CIS_DIVISION='CSU' ");
        queryStr.append("      AND TRIM(ACCT.MAILING_PREM_ID) IS NOT NULL ");
        queryStr.append("      AND ACCT.ACCT_ID IN ( ");
        queryStr.append("            SELECT ");
        queryStr.append("                  ACCT_ID ");
        queryStr.append("            FROM ");
        queryStr.append("                  CI_SA ");
        queryStr.append("            WHERE ");
        queryStr.append("                  ACCT.ACCT_ID=ACCT_ID ");
        queryStr.append("                  GROUP BY ACCT_ID ");
        queryStr.append("                  HAVING COUNT(ACCT_ID) = 1) ");
        queryStr.append("      AND ACCT.ACCT_ID IN ( ");
        queryStr.append("            SELECT ");
        queryStr.append("                  ACCT_ID ");
        queryStr.append("            FROM ");
        queryStr.append("                  CI_ACCT_PER ");
        queryStr.append("                  GROUP BY ACCT_ID ");
        queryStr.append("                  HAVING COUNT(PER_ID) = 1) ");
        queryStr.append("      AND CBILL.BILL_STAT_FLG = 'C' ");
        queryStr.append("      AND TRIM(SA.SA_TYPE_CD) LIKE '%RS' ");
        queryStr.append("      AND SA.SA_STATUS_FLG='20' ");
        queryStr.append("      AND BSEG.BSEG_STAT_FLG = '50' ");
        queryStr.append("      FETCH FIRST 1 ROWS ONLY ");

        return queryStr.toString();
    }

    private static String TDS001() {

        StringBuilder queryStr = new StringBuilder();
        queryStr.append(" SELECT ");
        queryStr.append("      ACCT_ID ");
        queryStr.append(" FROM ");
        queryStr.append("      CI_ACCT ");
        queryStr.append(" WHERE ");
        queryStr.append("      ACCT_ID IN ( ");
        queryStr.append("             SELECT ");
        queryStr.append("                   ACCT_ID ");
        queryStr.append("             FROM ");
        queryStr.append("                   CI_ACCT_PER ");
        queryStr.append("                   GROUP BY ACCT_ID ");
        queryStr.append("                   HAVING COUNT(PER_ID) = 1) ");
        queryStr.append("      FETCH FIRST 1 ROWS ONLY ");


        return queryStr.toString();
    }

    private static String TDS002() {

        StringBuilder queryStr = new StringBuilder();
        queryStr.append(" SELECT ");
        queryStr.append("      TD_ENTRY_ID ");
        queryStr.append(" FROM ");
        queryStr.append("      CI_TD_ENTRY ");
        queryStr.append(" WHERE ");
        queryStr.append("      TD_TYPE_CD = 'BI' ");
        queryStr.append("      AND ENTRY_STATUS_FLG = 'O' ");
        queryStr.append("      FETCH FIRST 1 ROWS ONLY ");


        return queryStr.toString();
    }
    private static String TDS003() {

        StringBuilder queryStr = new StringBuilder();
        queryStr.append(" SELECT ");
        queryStr.append("      TD_ENTRY_ID, ");
        queryStr.append("      TD_TYPE_CD, ");
        queryStr.append("      ENTRY_STATUS_FLG ");
        queryStr.append(" FROM ");
        queryStr.append("      CI_TD_ENTRY ");
        queryStr.append(" WHERE ");
        queryStr.append("      TD_TYPE_CD = 'BI' ");
        queryStr.append("      AND ENTRY_STATUS_FLG = 'O' ");
        queryStr.append("      FETCH FIRST 1 ROWS ONLY ");


        return queryStr.toString();
    }

    /*
     * This method is responsible for retrieving an account with Active Budget from DB
     * @return String - Query for an DATETIME from DB used in adding a Device
     */
    private static String CM003() {

        StringBuilder queryStr = new StringBuilder();
        queryStr.append(" SELECT ");
        queryStr.append("      ACCT_ID");
        queryStr.append(" FROM ");
        queryStr.append("      CI_BILL ");
        queryStr.append("      WHERE APAY_AMT >0 ");
        queryStr.append(" FETCH FIRST 1 ROWS ONLY ");

        return queryStr.toString();
    }



    private static String CM361() {

        StringBuilder queryStr = new StringBuilder();
        queryStr.append(" SELECT ");
        queryStr.append("      INIT_MSRMT_DATA_ID");
        queryStr.append(" FROM ");
        queryStr.append("      D1_IMD_CTRL ");
        queryStr.append("      where BO_STATUS_CD='PENDING' ");
        queryStr.append(" FETCH FIRST 1 ROWS ONLY ");

        return queryStr.toString();
    }
    //////////////////////////////////////////////////////////////////
    //////			   End of -SQL QUERY- section			    //////
    //////////////////////////////////////////////////////////////////

}