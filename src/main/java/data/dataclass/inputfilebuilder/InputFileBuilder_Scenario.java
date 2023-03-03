/*
 *************************************************************************************
 * CHANGE HISTORY:
 *
 * Date:       	by:    		Reason:
 * 2022-05-04	CTongo		Initial Version.
 *************************************************************************************
 */

package data.dataclass.inputfilebuilder;

import data.dataclass.DatabaseUtil;
import data.dataclass.inputfilebuilder.SqlQueries;
import ngtp.utilities.DateTime;

import java.io.*;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public class InputFileBuilder_Scenario {

    //Constants
    final static String PATH = "src\\test\\resources\\C2M_EYDemo\\features\\";
    final static String MANUAL = "MANUAL";


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
    public static void main(String feature) throws ClassNotFoundException, SQLException, IOException{

        SqlResults sqlresults = new SqlResults();
        Map<String, String> listPair = loadTestScenarios(feature);
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

//                                 Format the values retrieve from the query
                                if(listPair.get(key).equals(PATH)){
                                    System.out.println("" + DateTime.stamp() + " -- Successfully Loaded Input Data for file: " + key);
                                } else{
                                    ResultSet result = dbUtil.executeQuery(connection, listPair.get(key));

//                                     Check if all the queries returned a value
                                    if(!result.isBeforeFirst()){
                                        System.out.println("No Data Retrieved for Test: " + key);
                                    } else{

                                        if(testName.equals(feature))
                                            sqlresults.SqlResults(fw, testName, result);

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
    public static Map<String, String> loadTestScenarios(String feature){

        Map<String, String> listPair = new HashMap<String, String>();
        SqlQueries sqlqueries = new SqlQueries();

        // Retrieve Data for each test case.
        String sqlQuery = null;

        sqlQuery = sqlqueries.SqlQueries(feature);
        listPair.put(feature + ".feature", sqlQuery);

        return listPair;
    }

    //////////////////////////////////////////////////////////////////
    //////			End of -SQL QUERY EXECUTION- section		//////
    //////////////////////////////////////////////////////////////////

    /*
     * This method is responsible for calling the InputFileBuilder main method
     * This is to load test data for the feature file.
     * @return boolean - Boolean
     */
    public boolean getMain(String feature) throws Throwable {
        try {
            InputFileBuilder_Scenario.main(feature);
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