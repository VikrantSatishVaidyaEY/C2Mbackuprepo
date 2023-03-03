/*
 *************************************************************************************
 * CHANGE HISTORY:
 *
 * Date:       	by:    		Reason:
 * 2022-05-04	CTongo		Initial Version.
 *************************************************************************************
 */

package data.dataclass;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.Connection;
import java.util.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

import ngtp.utilities.DateTime;

public class InputFileBuilder {

    //Constants
    final static String PATH = "src\\test\\resources\\C2M_EYDemo\\features\\";
    final static String MANUAL = "MANUAL";

    static String columnNames;

    public static SimpleDateFormat formatter = new SimpleDateFormat ("MM-dd-yyyy");
    public static String dateToday = formatter.format(new Date());

    //////////////////////////////////////////////////////////////////
    //////			       Start of -MAIN- section		        //////
    //////////////////////////////////////////////////////////////////

    /*
     * Main Processing
     * @param args - Arguments
     * @throws ClassNotFoundException - Class Not Found Exception
     * @throws SQLException - SQL Exception
     * @throws IOException - IO Exception
     */
    public static void main(String[] args) throws ClassNotFoundException, SQLException, IOException{

        Map<String, String> listPair = loadTestScenarios();
        File file = null;
        String testName = "";

        DatabaseUtil dbUtil = new DatabaseUtil();
        Connection connection = dbUtil.connectToDB();

        if(!listPair.isEmpty()){

            for(String key : listPair.keySet()){

                file = new File(PATH + key);
                testName = getTestName(key);
                System.out.println("" + DateTime.stamp() + " -- Starting Data Load for " + key);
                if(fileExists(file)){
                    fileCleanUp(file);

                    Scanner myReader = new Scanner(file);
                    FileWriter fw = new FileWriter(file, true);
                    while (myReader.hasNextLine()){
                        String line = myReader.nextLine().toString();

                        if(line.equals("    Examples:")){
                            try {

                                // Format the values retrieve from the query
                                if(listPair.get(key).equals(PATH)){
                                    System.out.println("" + DateTime.stamp() + " -- Successfully Loaded Input Data for file: " + key);
                                } else{
                                    ResultSet result = dbUtil.executeQuery(connection, listPair.get(key));

                                    // Check if all the queries returned a value
                                    if(!result.isBeforeFirst()){
                                        System.out.println("No Data Retrieved for Test: " + key);
                                    } else{

                                        if(testName.equals("fin004_addpaymentevent"))
                                            AccountToAddPaymentEvent(fw, testName, result);

                                        System.out.println("" + DateTime.stamp() + " -- Successfully Loaded Input Data for file: " + key);
                                    }
                                }
                            } catch (Exception e){
                                e.printStackTrace();
                                System.out.println("Failed Loading Data for Test: " + key);
                            }
                        }
                    }

                    myReader.close();
                    fw.close();
                } else {
                    System.out.println("File does not exist: " + PATH + key);
                }
            }
        }else{
            System.out.println("List is Empty");
        }

        dbUtil.cleanUp(connection);
    }

    //////////////////////////////////////////////////////////////////
    //////			       End of -MAIN- section		        //////
    //////////////////////////////////////////////////////////////////

    //////////////////////////////////////////////////////////////////
    //////			Start of -SQL QUERY EXECUTION- section		//////
    //////////////////////////////////////////////////////////////////

    /*
     * This method is responsible for executing the SQL query for the test scenario's input data.
     * @link Map - Collection that contains key and value
     * @link String - Key
     * @link String - Value
     */
    public static Map<String, String> loadTestScenarios(){

        Map<String, String> listPair = new HashMap<String, String>();

        // Retrieve Data for each test case.
        String sqlQuery = null;

        sqlQuery = getAddingToAddPaymentEvent();
        listPair.put("fin004_addpaymentevent.feature", sqlQuery);

        return listPair;
    }

    //////////////////////////////////////////////////////////////////
    //////			End of -SQL QUERY EXECUTION- section		//////
    //////////////////////////////////////////////////////////////////

    //////////////////////////////////////////////////////////////////
    //////			   Start of -SQL QUERY- section			    //////
    //////////////////////////////////////////////////////////////////

    /*
     * This method is responsible for retrieving an Account to add a Payment Event
     * @return String - Query for an Account to add a Payment Event
     */
    private static String getAddingToAddPaymentEvent() {

        StringBuilder queryStr = new StringBuilder();
        queryStr.append(" SELECT ");
        queryStr.append("      DISTINCT(CA.ACCT_ID) ");
        queryStr.append(" FROM ");
        queryStr.append("      CI_ACCT CA, ");
        queryStr.append("      CI_SA CSA ");
        queryStr.append(" WHERE ");
        queryStr.append("      CA.CIS_DIVISION='DIV1' ");
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
        queryStr.append("      AND TRIM(CSA.SA_TYPE_CD) LIKE '%RES' ");
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
        queryStr.append("      FETCH FIRST 3 ROWS ONLY ");

        return queryStr.toString();
    }

    //////////////////////////////////////////////////////////////////
    //////			   End of -SQL QUERY- section			    //////
    //////////////////////////////////////////////////////////////////

    //////////////////////////////////////////////////////////////////
    //////			Start of -INPUT DATA FORMAT- section		//////
    //////////////////////////////////////////////////////////////////

    /*
     * This method is responsible for retrieving an Account to add a Payment Event
     */
    public static void AccountToAddPaymentEvent(FileWriter fw, String testName, ResultSet result) throws IOException, SQLException{

        columnNames = "      | accountId\t| paymentDate\t| distributionCode \t| amount\t| tenderType\t|";
        fw.append(columnNames + "\n");
        while(result.next()){
            String acctId = result.getString("ACCT_ID").trim();
            fw.append("      | " + acctId + "\t| " + dateToday + "\t| Distribute and Freeze if OK\t| $10\t| Cash\t|\n");
        }
    }

    //////////////////////////////////////////////////////////////////
    //////	  		 End of -INPUT DATA FORMAT- section		    //////
    //////////////////////////////////////////////////////////////////

    /*
     * This method is responsible for calling the InputFileBuilder main method
     * This is to load test data for the feature file.
     * @return boolean - Boolean
     */
    public boolean getMain(Object object) throws Throwable {
        try {
            InputFileBuilder.main(null);
            return true;
        } catch (Exception e) {
            System.out.println(e.getLocalizedMessage());
            return false;
        }
    }

    /*
     * This method is responsible for checking if the feature file to be processed does exist.
     * @param file - Feature file
     * @return boolean - Boolean
     */
    public static boolean fileExists(File file){

        if(file.exists() && !file.isDirectory()){
            return true;
        } else{
            return false;
        }
    }

    /*
     * This method is responsible for writing the input data section in the feature file.
     * @param file - Feature file
     */
    public static void fileCleanUp(File file) {

        try {

            BufferedReader bf = new BufferedReader(new FileReader(file));
            StringBuffer inputBuffer = new StringBuffer();
            String line;
            boolean markerFound = false;

            while ((line = bf.readLine()) != null) {

                if(!markerFound){
                    inputBuffer.append(line);
                    inputBuffer.append('\n');
                }

                if((line.equals("    Examples:")) && (!markerFound)){
                    markerFound = true;
                }

            }
            bf.close();

            // Write the new string with the replaced line OVER the same file
            FileOutputStream fileOut = new FileOutputStream(file);
            fileOut.write(inputBuffer.toString().getBytes());
            fileOut.close();

        } catch (Exception e) {
            System.out.println("Problem Reading File: " + file);
        }
    }

    /*
     * This method is responsible for getting the Test name of the feature file.
     * @param fileName - Feature File Name
     * @return String - Test Name
     */
    public static String getTestName(String fileName){
        return fileName.substring(0, (fileName.length() - 8));
    }
}