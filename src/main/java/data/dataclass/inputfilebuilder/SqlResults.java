/*
 *************************************************************************************
 * CHANGE HISTORY:
 *
 * Date:       	by:    		Reason:
 * 2022-05-06	CTongo		Initial Version.
 * 2022-08-02   VVaidya     Added code for CM003
 *************************************************************************************
 */

package data.dataclass.inputfilebuilder;

import data.dataclass.TestDataGenerator;

import java.io.FileWriter;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class SqlResults {

    static String columnNames;

    public static SimpleDateFormat formatter = new SimpleDateFormat ("MM-dd-yyyy");
    public static String dateToday = formatter.format(new Date());

    public String SqlResults(FileWriter fw, String testName, ResultSet result){

        try{
            //FINANCIAL
            if(testName.equals("fin001_addanadjustment")){
                FIN001(fw, testName, result);
            }else if(testName.equals("fin002_cancelanadjustment")){
                FIN002(fw, testName, result);
            }else if(testName.equals("fin003_adddepositortendercontrol")){
                FIN003(fw, testName, result);
            }else if(testName.equals("fin004_addpaymentevent")){
                FIN004(fw, testName, result);
            }else if(testName.equals("fin005_addapaymenttomultipleaccounts")){
                FIN005(fw, testName, result);
            }else if(testName.equals("fin006_cancellingapaymentevent")){
                FIN006(fw, testName, result);
            }else if(testName.equals("fin007_searchingforapayment")){
                FIN007(fw, testName, result);
            }else if(testName.equals("fin008_settingupautopay")){
                FIN008(fw, testName, result);
            }else if(testName.equals("fin009_cancellingautopay")){
                FIN009(fw, testName, result);
            }else if(testName.equals("fin010_transferringabalance")){
                FIN010(fw, testName, result);
            }

            //CREDITS AND COLLECTIONS
            else if(testName.equals("cc001_addcollectionreferralagency")) {
                CC001(fw, testName, result);
            } else if(testName.equals("cc002_addpayplan")){
                CC002(fw, testName, result);
            } else if(testName.equals("cc003_cancelingapayplan")){
                CC003(fw, testName, result);
            } else if(testName.equals("cc004_addingapaymentarrangementrequest")){
                CC004(fw, testName, result);
            } else if(testName.equals("cc005_addingcollectionprocess")){
                CC005(fw, testName, result);
            } else if(testName.equals("cc006_addingseveranceprocess")){
                CC006(fw, testName, result);
            } else if(testName.equals("cc007_addingseveranceprocess")){
                CC007(fw, testName, result);
            } else if(testName.equals("cc008_cancellingcollectionprocess")){
                CC008(fw, testName, result);
            } else if(testName.equals("cc009_cancellingseveranceprocess")){
                CC009(fw, testName, result);
            } else if(testName.equals("cc010_cancellingwriteoffprocess")){
               CC010(fw, testName, result);
            } else if(testName.equals("cc011_manuallyaddingcreditpoints")){
               CC011(fw, testName, result);
            } else if(testName.equals("cc012_modifyingcollectioneventtriggerdate")){
               CC012(fw, testName, result);
            } else if(testName.equals("cc013_modifyseveranceeventtriggerdate")){
               CC013(fw, testName, result);
            } else if(testName.equals("cc014_modifyingwriteoffeventtriggerdate")){
               CC014(fw, testName, result);
            }

            //CUSTOMER INFORMATION
            else if(testName.equals("ci003_addservicepoint")) {
                CI003(fw, testName, result);
            } else if(testName.equals("ci004_personproperlysyncsfromc2mtomdm")) {
                CI004(fw, testName, result);
            } else if(testName.equals("ci005_startserviceagreement")) {
                CI005(fw, testName, result);
            } else if(testName.equals("ci007_stopserviceagreement")) {
                CI007(fw, testName, result);
            } else if(testName.equals("ci008_createadepositsa")) {
                CI008(fw, testName, result);
            } else if(testName.equals("ci009_serviceagreementsyncsfromc2mtomdm")) {
                CI009(fw, testName, result);
            } else if(testName.equals("ci010_addchildpremisetoparentpremise")) {
                CI010(fw, testName, result);
            } else if(testName.equals("ci011_addpremisetoexistinglandlordagreement")) {
                CI011(fw, testName, result);
            }

             //DEVICE MANAGEMENT
             else if(testName.equals("dm001_adddevice")){
                DM001(fw, testName, result);
            }
            else if(testName.equals("bil002_cancelabillsegment")){
                BIL002(fw, testName, result);
            }
            else if(testName.equals("tds001_addmanualtodo")){
                TDS001(fw, testName, result);
            }
            else if(testName.equals("tds002_completetodo")){
                TDS002(fw, testName, result);
            }
            else if(testName.equals("tds003_assigningtodoentries")){
                TDS003(fw, testName, result);
            }//BILLING
            else if(testName.equals("bil004_settingamaximumbillthreshold")){
                BIL004(fw, testName, result);
            }
            else if(testName.equals("bil005_servicecycleupdatesbillingcycle")) {
                BIL005(fw, testName, result);
            }

            //Custom Test Cases
            else if(testName.equals("cm003_createcustomercontactforbudgetremoval")) {
                CM003(fw, testName, result);
            }

            else if(testName.equals("cm361_discardpendingimd")) {
                CM361(fw, testName, result);
            }

             else{
                System.out.println("No Retrieved Result for the Feature File: " + testName);
            }
        }catch (Exception e){
            System.out.println(e);
        }
        return null;
    }

    /*
     * This method is responsible for retrieving an Account to add a Payment Event
     */
    public static void FIN004(FileWriter fw, String testName, ResultSet result) throws IOException, SQLException{

        columnNames = "      | accountId\t| paymentDate\t| distributionCode \t| amount\t| tenderType\t|";
        fw.append(columnNames + "\n");
        while(result.next()){
            String acctId = result.getString("ACCT_ID").trim();
            fw.append("      | " + acctId + "\t| " + dateToday + "\t| Distribute and Freeze if OK\t| $10\t| Cash\t|\n");
        }
    }

    /*
     * This method is responsible for retrieving multiple account for payment
     */
    public static void FIN005(FileWriter fw, String testName, ResultSet result) throws IOException, SQLException{

        columnNames = "      | accountId1\t| accountId2 \t| paymentDate \t| distributionCode  \t| amount1 \t| amount2 \t| tenderType \t|";
        fw.append(columnNames + "\n");
        while(result.next()){
            String acctId1 = result.getString("ACCT_ID1").trim();
            String acctId2 = result.getString("ACCT_ID2").trim();

            fw.append("      | " + acctId1 + "\t| " + acctId2 + "\t| " + dateToday + "  | Do not Distribute\t| $20\t| $10\t| Cash\t|\n");
        }
    }

    /*
     * This method is responsible for retrieving a new data for adding a device
     */
    public static void DM001(FileWriter fw, String testName, ResultSet result) throws IOException, SQLException{

        TestDataGenerator td = new TestDataGenerator();
        columnNames = "      |date\t|time\t|assetType\t|serviceLocation\t|specification\t|badgeNo\t|serialNo\t|measurementConfig\t|storeTime\t|metrologyFirmwareVersion\t|nicFirmwareVersion\t|";
        fw.append(columnNames + "\n");
        while(result.next()){
            String badgeNo = td.generatebadgenumber();
            String serialNo = td.generateserialnumber();
            String date = td.dbDateFormatter(result.getString("DATETIME").trim());
            String time = td.dbTimeFormatter(result.getString("DATETIME").trim());
            String timeAddOne = td.dbTimeFormatter(result.getString("DATETIMEPLUSONE").trim());
            fw.append("      |" + date + "\t|" + time + "\t|Electric Type 1 - 120V 2W 1PH 100CL\t|East Service Center Warehouse,2910 Willamette Pl\t|1_LAN&GYR_ALF\t|" + badgeNo + "\t|" + serialNo + "\t|17420-E-TYPICAL\t|" + timeAddOne + "\t|1.0|1.0|\n");
        }
    }

    /*
     * This method is responsible for Billing 004 test case
     */
    public static void BIL004(FileWriter fw, String testName, ResultSet result) throws IOException, SQLException{

        TestDataGenerator td = new TestDataGenerator();
        columnNames = "      |searchBy\t|accountId\t|cisDivision\t|threshold\t|";
        fw.append(columnNames + "\n");
        while(result.next()){
            //String badgeNo = td.generatebadgenumber();
            //String serialNo = td.generateserialnumber();
            String accountid = td.dbDateFormatter(result.getString("ACCT_ID").trim());
            //String time = td.dbTimeFormatter(result.getString("DATETIME").trim());
            //String timeAddOne = td.dbTimeFormatter(result.getString("DATETIMEPLUSONE").trim());
            fw.append("      | Account ID|\t" + accountid + "\t|Colorado Springs Utilities\t|2500\t\n");
        }
    }

    /*
     * This method is responsible for Billing 005 test case
     */
    public static void BIL005(FileWriter fw, String testName, ResultSet result) throws IOException, SQLException{

        TestDataGenerator td = new TestDataGenerator();
        columnNames = "      |searchBy\t|accountId\t|cisDivision\t|measurementCycle\t|";
        fw.append(columnNames + "\n");
        while(result.next()){
            //String badgeNo = td.generatebadgenumber();
            //String serialNo = td.generateserialnumber();
            String accountid = td.dbDateFormatter(result.getString("ACCT_ID").trim());
            //String time = td.dbTimeFormatter(result.getString("DATETIME").trim());
            //String timeAddOne = td.dbTimeFormatter(result.getString("DATETIMEPLUSONE").trim());
            fw.append("      | Account ID|\t" + accountid + "\t|Colorado Springs Utilities\t|Read Cycle 02\t\n");
        }
    }

    /*
     * This method is responsible for retrieving a new data for cancelling a bill segment
     */
    public static void BIL002(FileWriter fw, String testName, ResultSet result) throws IOException, SQLException{

        columnNames = "      | SEARCH BY\t| ACCOUNT ID \t| CIS DIVISION \t| BILL ID  \t| CANCEL REASON \t|";
        fw.append(columnNames + "\n");
        while(result.next()){
            String acctId = result.getString("ACCT_ID").trim();
            String billId = result.getString("BILL_ID").trim();

            fw.append("      |Account ID| " + acctId + "|Colorado Springs Utilities | " + billId + "|Wrong read   |\n");
        }
    }

    /*
     * This method is responsible for retrieving a new data for Manual To Do
     */
    public static void TDS001(FileWriter fw, String testName, ResultSet result) throws IOException, SQLException{

        columnNames = "      | To DO Type\t| Subject \t| Comment \t| Override Priority  \t| search_by_list \t|Account_ID \t|";
        fw.append(columnNames + "\n");
        while(result.next()){
            String acctId = result.getString("ACCT_ID").trim();


            fw.append("      |Billing     | NGTP Testing\t|NGTP Test|Priority 10 -- Highest| Account ID| " + acctId +  "|\n");
        }
    }

    /*
     * This method is responsible for retrieving a new data for Completing a To Do
     */
    public static void TDS002(FileWriter fw, String testName, ResultSet result) throws IOException, SQLException{

        columnNames = "      |    TODO_ID        \t| search_by_list \t| TODO_Log_Entry \t|";
        fw.append(columnNames + "\n");
        while(result.next()){
            String todoId = result.getString("TD_ENTRY_ID").trim();


            fw.append("      |" + todoId + "\t| To Do Entry Identifier\t|Complete|\n");
        }
    }

    /*
     * This method is responsible for assigning to do entries
     */
    public static void TDS003(FileWriter fw, String testName, ResultSet result) throws IOException, SQLException{

        columnNames = "      |    toDoType  \t| filterBy \t| user \t|";
        fw.append(columnNames + "\n");
        while(result.next()){
            String todoType = result.getString("TD_TYPE_CD").trim();


            fw.append("      |" + todoType + "\t| Open\t|16243066|\n");
        }
    }
    /*
     * This method is responsible for retrieving an account for adding an adjustment
     */
    public static void FIN001(FileWriter fw, String testName, ResultSet result) throws IOException, SQLException{

        columnNames = "      |SEARCH BY|ACCOUNT ID|CIS DIVISION|ADJUSTMENT TYPE|AMOUNT|";
        fw.append(columnNames + "\n");
        while(result.next()){
            String acctId = result.getString("ACCT_ID").trim();
            fw.append("      |Account ID| " + acctId + "|Colorado Springs Utilities |FEEREI  |100   |\n");
        }
    }

    /*
     * This method is responsible for retrieving an frozen adjustment
     */
    public static void FIN002(FileWriter fw, String testName, ResultSet result) throws IOException, SQLException{

        columnNames = "      |ADJUSTMENT ID|CANCEL REASON|";
        fw.append(columnNames + "\n");
        while(result.next()){
            String adjId = result.getString("ADJ_ID").trim();
            fw.append("      |" + adjId +" |Incorrect adjustment|\n");
        }
    }

    /*
     * This method is responsible for retrieving an tender source code
     */
    public static void FIN003(FileWriter fw, String testName, ResultSet result) throws IOException, SQLException{

        columnNames = "      | TENDER SOURCE  | STARTING BALANCE |";
        fw.append(columnNames + "\n");
        while(result.next()){
            String tndrSrceCd = result.getString("TNDR_SOURCE_CD").trim();
            fw.append("      | " + tndrSrceCd + "           | $0.00            |\n");
        }
    }

    /*
     * This method is responsible for retrieving an frozen payment event
     */
    public static void FIN006(FileWriter fw, String testName, ResultSet result) throws IOException, SQLException{

        columnNames = "      | paymentEventId | cancelReason         |";
        fw.append(columnNames + "\n");
        while(result.next()){
            String paymentEventId = result.getString("PAY_EVENT_ID").trim();
            fw.append("      | " + paymentEventId + "   | Non Sufficient Funds |\n");
        }
    }

    /*
     * This method is responsible for retrieving an frozen payment event
     */
    public static void FIN007(FileWriter fw, String testName, ResultSet result) throws IOException, SQLException{

        columnNames = "      | paymentEventId |";
        fw.append(columnNames + "\n");
        while(result.next()){
            String paymentEventId = result.getString("PAY_EVENT_ID").trim();
            fw.append("      | " + paymentEventId + "   |\n");
        }
    }

    /*
     * This method is responsible for retrieving an accouont id without autopay
     */
    public static void FIN008(FileWriter fw, String testName, ResultSet result) throws IOException, SQLException{

        columnNames = "      | accountId  | startDate  | sourceCode  | externalAcctId   |";
        fw.append(columnNames + "\n");
        while(result.next()){
            String acctId = result.getString("ACCT_ID").trim();
            fw.append("      | " + acctId + " | " + dateToday + " | 789456124-S | 0012345202435366 |\n");
        }
    }

    /*
     * This method is responsible for retrieving an accouont id with autopay
     */
    public static void FIN009(FileWriter fw, String testName, ResultSet result) throws IOException, SQLException{

        columnNames = "      | accountId  | endDate    |";
        fw.append(columnNames + "\n");
        while(result.next()){
            String acctId = result.getString("ACCT_ID").trim();
            fw.append("      | " + acctId + " | " + dateToday + " |\n");
        }
    }

    /*
     * This method is responsible for retrieving an accouont id and transfer SA
     */
    public static void FIN010(FileWriter fw, String testName, ResultSet result) throws IOException, SQLException{

        columnNames = "      | accountId  | adjustmentType | amount | transferSaAccountId |";
        fw.append(columnNames + "\n");
        while(result.next()){
            String acctId = result.getString("ACCT_ID").trim();
            String transferSaId = result.getString("SA_ID").trim();
            fw.append("      | " + acctId + " | XFERNP           | 5.00   | " + transferSaId + " |\n");
        }
    }

    /*
     * This method is responsible for retrieving an accouont id for adding collection referral agency
     */
    public static void CC001(FileWriter fw, String testName, ResultSet result) throws IOException, SQLException{

        columnNames = "      | SEARCH BY |ACCOUNT ID | CIS DIVISION | COLLECTION AGENCY | START DATE | CREATION DATE | REFERRAL AMOUNT |";
        fw.append(columnNames + "\n");
        while(result.next()){
            String acctId = result.getString("ACCT_ID").trim();
            fw.append("      | Account ID | " + acctId + " | Colorado Springs Utilities | CBCS | " + dateToday + " | " + dateToday + " | 100             |\n");
        }
    }

    /*
     * This method is responsible for retrieving an accouont id for adding a payplan
     */
    public static void CC002(FileWriter fw, String testName, ResultSet result) throws IOException, SQLException{

        columnNames = "      | SEARCH BY | ACCOUNT ID | CIS DIVISION | TYPE | PAY METHOD | COMMENTS | SCHEDULED DATE | SCHEDULED AMOUNT |";
        fw.append(columnNames + "\n");
        while(result.next()){
            String acctId = result.getString("ACCT_ID").trim();
            fw.append("      | Account ID | " + acctId + " | Colorado Springs Utilities | RES | In Person | Adding a payplan test | " + dateToday + " | 100 |\n");
        }
    }

    /*
     * This method is responsible for retrieving an accouont id for canceling a payplan
     */
    public static void CC003(FileWriter fw, String testName, ResultSet result) throws IOException, SQLException{

        columnNames = "      | searchBy | accountId | cisDivision |";
        fw.append(columnNames + "\n");
        while(result.next()){
            String acctId = result.getString("ACCT_ID").trim();
            fw.append("      | Account ID | " + acctId + " | Colorado Springs Utilities |\n");
        }
    }

    /*
     * This method is responsible for retrieving an accouont id for adding a payment arrangement request
     */
    public static void CC004(FileWriter fw, String testName, ResultSet result) throws IOException, SQLException{

        columnNames = "      | searchBy | accountId | cisDivision | paymentArrangementRquestType | paymentArrangementReason | noOfInstallments |";
        fw.append(columnNames + "\n");
        while(result.next()){
            String acctId = result.getString("ACCT_ID").trim();
            fw.append("      | Account ID | " + acctId + " | Colorado Springs Utilities | PA - Select SAs / Down Payment Not Applicable / Always Eligible / No Approval | Delayed Billing | 3 |\n");
        }
    }

    /*
     * This method is responsible for retrieving an accouont id for adding a collection process
     */
    public static void CC005(FileWriter fw, String testName, ResultSet result) throws IOException, SQLException{

        columnNames = "      | SEARCH BY | ACCOUNT ID | CIS DIVISION | COLLECTION CLASS CONTROL | COLLECTION PROCESS TEMPLATE | DAYS IN ARREARS | COMMENTS | SERVICE AGREEMENT | STATUS | COLLECTION EVENT TYPE |";
        fw.append(columnNames + "\n");
        while(result.next()){
            String acctId = result.getString("ACCT_ID").trim();
            String saId = result.getString("SA_ID").trim();
            fw.append("      | Account ID | "+ acctId +" | Colorado Springs Utilities | RES UTIL | Normal utility debt | 40 | NGTP Collection process Testing | " + saId + "  | Active | Cancel payment plan |\n");
        }
    }

    /*
     * This method is responsible for retrieving an accouont id for adding severance process
     */
    public static void CC006(FileWriter fw, String testName, ResultSet result) throws IOException, SQLException{

        columnNames = "      | SEARCH BY  | ACCOUNT ID | CIS DIVISION | SA ID | SEVERANCE PROCESS TEMPLATE | COMMENTS | SEVERANCE AMOUNT BASE DATE |";
        fw.append(columnNames + "\n");
        while(result.next()){
            String acctId = result.getString("ACCT_ID").trim();
            String saId = result.getString("SA_ID").trim();
            fw.append("      | Account ID | " + acctId + " | Colorado Springs Utilities | " + saId + " | Standard utility severance | NGTP Severance process Testing | " + dateToday + " |\n");
        }
    }

    /*
     * This method is responsible for retrieving an accouont id for adding a write off process
     */
    public static void CC007(FileWriter fw, String testName, ResultSet result) throws IOException, SQLException{

        columnNames = "      | searchBy | accountId | cisDivision | woControl | woTemplate | comments | sa | saStatus |";
        fw.append(columnNames + "\n");
        while(result.next()){
            String acctId = result.getString("ACCT_ID").trim();
            String saId = result.getString("SA_ID").trim();
            fw.append("      | Account ID | " + acctId + " | Colorado Springs Utilities | RES ELIGIBLE | Eligible for Write Off | NextGen Test | " + saId + " | Active |\n");
        }
    }

    /*
     * This method is responsible for retrieving an account id for cancelling collection process
     */
    public static void CC008(FileWriter fw, String testName, ResultSet result) throws IOException, SQLException{

        columnNames = "      | SEARCH BY  | ACCOUNT ID | CIS DIVISION |";
        fw.append(columnNames + "\n");
        while(result.next()){
            String acctId = result.getString("ACCT_ID").trim();
            fw.append("      | Account ID | " + acctId + " | Colorado Springs Utilities   |\n");
        }
    }

    /*
     * This method is responsible for retrieving an account id for cancelling severance process
     */
    public static void CC009(FileWriter fw, String testName, ResultSet result) throws IOException, SQLException{

        columnNames = "      | SEARCH BY  | ACCOUNT ID | CIS DIVISION |";
        fw.append(columnNames + "\n");
        while(result.next()){
            String acctId = result.getString("ACCT_ID").trim();
            fw.append("      | Account ID | " + acctId + " | Colorado Springs Utilities   |\n");
        }
    }

    /*
     * This method is responsible for retrieving an account id for cancelling write off process
     */
    public static void CC010(FileWriter fw, String testName, ResultSet result) throws IOException, SQLException{

        columnNames = "      |searchBy|accountId|cisDivision|";
        fw.append(columnNames + "\n");
        while(result.next()){
            String acctId = result.getString("ACCT_ID").trim();
            fw.append("      |Account ID|" + acctId + "|Colorado Springs Utilities|\n");
        }
    }

    /*
     * This method is responsible for retrieving an account id for cancelling write off process
     */
    public static void CC011(FileWriter fw, String testName, ResultSet result) throws IOException, SQLException{

        columnNames = "      | searchBy | accountId | cisDivision | startDate | endDate | creditRating | comments |";
        fw.append(columnNames + "\n");
        while(result.next()){
            String acctId = result.getString("ACCT_ID").trim();
            fw.append("      | Account ID | " + acctId + " | Colorado Springs Utilities | " + dateToday + " | " + dateToday+7 + " | -30 | NGTP Testing |\n");
        }
    }

    /*
     * This method is responsible for retrieving an account id for modifying a collection event trigger date
     */
    public static void CC012(FileWriter fw, String testName, ResultSet result) throws IOException, SQLException{
        TestDataGenerator td = new TestDataGenerator();
        columnNames = "      | SEARCH BY  | ACCOUNT ID | CIS DIVISION | TRIGGER DATE | eventSequence |";
        fw.append(columnNames + "\n");
        while(result.next()){
            String acctId = result.getString("ACCT_ID").trim();
            String triggerDt = td.dbDateFormatter(result.getString("TRIGGER_DT").trim());
            fw.append("      | Account ID | " + acctId + " | Colorado Springs Utilities  | " + triggerDt + "   | 10 |\n");
        }
    }

    /*
     * This method is responsible for retrieving an account id for modifying a severance event trigger date
     */
    public static void CC013(FileWriter fw, String testName, ResultSet result) throws IOException, SQLException{
        TestDataGenerator td = new TestDataGenerator();
        columnNames = "      |Search By |Account ID|CIS Division|eventSequence|Event Trigger Date|";
        fw.append(columnNames + "\n");
        while(result.next()){
            String acctId = result.getString("ACCT_ID").trim();
            String triggerDt = td.dbDateFormatter(result.getString("TRIGGER_DT").trim());
            fw.append("      |Account ID|" + acctId + "|Colorado Springs Utilities |20            | " + triggerDt + "        |\n");
        }
    }

    /*
     * This method is responsible for retrieving an account id for modifying a write off event trigger date
     */
    public static void CC014(FileWriter fw, String testName, ResultSet result) throws IOException, SQLException{
        TestDataGenerator td = new TestDataGenerator();
        columnNames = "      | writeOffProcessId  | eventSequence | newTriggerDate |";
        fw.append(columnNames + "\n");
        while(result.next()){
            String writeOffProceId = result.getString("WO_PROC_ID").trim();
            String triggerDt = td.dbDateFormatter(result.getString("TRIGGER_DT").trim());
            fw.append("      | " + writeOffProceId + "         | 60            | " + triggerDt + "     |\n");
        }
    }

    /*
     * This method is responsible for retrieving a premise id for adding a service point
     */
    public static void CI003(FileWriter fw, String testName, ResultSet result) throws IOException, SQLException{
        columnNames = "      | Premise_Id   | Service Point Type   | Measurement Cycle           |";
        fw.append(columnNames + "\n");
        while(result.next()){
            String premId = result.getString("PREM_ID").trim();
            fw.append("      | " + premId + "   | Electric Residential | Meter Read Cycle Number 01  |\n");
        }
    }

    /*
     * This method is responsible for retrieving an account id for person sync c2m to mdm
     */
    public static void CI004(FileWriter fw, String testName, ResultSet result) throws IOException, SQLException{
        columnNames = "      | searchBy  | accountId | cisDivision | startDate | startMethod    | address                | city     | rate |";
        fw.append(columnNames + "\n");
        while(result.next()){
            String acctId = result.getString("ACCT_ID").trim();
            String address = result.getString("ADDRESS1").trim();
            String city = result.getString("CITY").trim();
            fw.append("      | Account ID | " + acctId + " | Colorado Springs Utilities  | " + dateToday + " | Start a Premise | " + address + " | " + city + " | E-CM |\n");
        }
    }

    /*
     * This method is responsible for retrieving an account id for start service agreement
     */
    public static void CI005(FileWriter fw, String testName, ResultSet result) throws IOException, SQLException{
        columnNames = "      | SEARCH BY  | ACCOUNT ID | CIS DIVISION | PREMISE ID |START DATE |REQUESTED BY |PREMISE FIELD NOTED|PERSON CONTACT TYPE|CONTACT INFORMATION|COMMENT       |";
        fw.append(columnNames + "\n");
        while(result.next()){
            String acctId = result.getString("ACCT_ID").trim();
            String premId = result.getString("PREM_ID").trim();
            String entityName = result.getString("ENTITY_NAME").trim();
            String perEmail = result.getString("CONTACT_VALUE").trim();
            fw.append("      | Account ID | " + acctId + " | Colorado Springs Utilities   | " + premId + " | " + dateToday + " | " + entityName + " |Started Service    |Primary Email      | " + perEmail + "    |Start Service |\n");
        }
    }

    /*
     * This method is responsible for retrieving an account id for stop service agreement
     */
    public static void CI007(FileWriter fw, String testName, ResultSet result) throws IOException, SQLException{
        columnNames = "      | SEARCH BY  | ACCOUNT ID | CIS DIVISION | Stop Date | Stop Method    | PremiseId  |";
        fw.append(columnNames + "\n");
        while(result.next()){
            String acctId = result.getString("ACCT_ID").trim();
            String premId = result.getString("MAILING_PREM_ID").trim();
            fw.append("      | Account ID | " + acctId + " | Colorado Springs Utilities   | " + dateToday + "| Stop a Premise | " + premId + " |\n");
        }
    }

    /*
     * This method is responsible for retrieving an account id to create a deposit SA
     */
    public static void CI008(FileWriter fw, String testName, ResultSet result) throws IOException, SQLException{
        columnNames = "      | SEARCH BY | ACCOUNT ID | CIS DIVISION | DIVISION | SA TYPE | CHAR PREMISE ID | DEPOSIT AMOUNT |";
        fw.append(columnNames + "\n");
        while(result.next()){
            String acctId = result.getString("ACCT_ID").trim();
            String premId = result.getString("MAILING_PREM_ID").trim();
            fw.append("      | Account ID | " + acctId + " | Colorado Springs Utilities  | Colorado Springs Utilities | RESDEP | " + premId + " | 100 |\n");
        }
    }

    /*
     * This method is responsible for retrieving an entity name to sync sa from c2m to mdm
     */
    public static void CI009(FileWriter fw, String testName, ResultSet result) throws IOException, SQLException{
        columnNames = "      |name|";
        fw.append(columnNames + "\n");
        while(result.next()){
            String entityName = result.getString("ENTITY_NAME").trim();
            fw.append("      |" + entityName + "|\n");
        }
    }

    /*
     * This method is responsible for retrieving a parent and child premise id
     */
    public static void CI010(FileWriter fw, String testName, ResultSet result) throws IOException, SQLException{
        columnNames = "      | premiseFilter  | childPremiseId | parentPremiseId |";
        fw.append(columnNames + "\n");
        while(result.next()){
            String parentPrem = result.getString("PARENT").trim();
            String childPrem = result.getString("CHILD").trim();
            fw.append("      | Show This Specific Premise | " + childPrem +"  | " + parentPrem + " |\n");
        }
    }

    /*
     * This method is responsible for retrieving a landlord and premise id
     */
    public static void CI011(FileWriter fw, String testName, ResultSet result) throws IOException, SQLException{
        columnNames = "      | premiseFilter  | PremiseId | landLordId |";
        fw.append(columnNames + "\n");
        while(result.next()){
            String premiseId = result.getString("PREMISE").trim();
            String landlord = result.getString("LANDLORD").trim();
            fw.append("      | Show This Specific Premise | " + premiseId + " | " + landlord + " |\n");
        }
    }

    /*
     * This method is responsible for CM003 - retrieving a new data for getting account for Budget cancel
     */
    public static void CM003(FileWriter fw, String testName, ResultSet result) throws IOException, SQLException{

        columnNames = "      |searchBy\t|accountId\t|cisDivision\t|";
        fw.append(columnNames + "\n");
        while(result.next()){

            String accountId = result.getString("ACCT_ID").trim();

            fw.append("      | Account ID | " + accountId + " | Colorado Springs Utilities  |  \n");
        }
    }

    /*
     * This method is responsible for CM361 - retrieving a new data for getting Initial measurement data
     */
    public static void CM361(FileWriter fw, String testName, ResultSet result) throws IOException, SQLException{

        columnNames = "      |IMD\t|";
        fw.append(columnNames + "\n");
        while(result.next()){

            String imd = result.getString("INIT_MSRMT_DATA_ID").trim();

            fw.append("      | " + imd + " |");
        }
    }

}