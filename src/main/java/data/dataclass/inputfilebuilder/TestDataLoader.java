package data.dataclass.inputfilebuilder;

import data.dataclass.DatabaseUtil;

import java.sql.*;
import java.util.HashMap;


public class TestDataLoader {

    static HashMap<String,String> testData;
    public static Connection connection=null;
    public static DatabaseUtil dbUtil ;//= new DatabaseUtil();

    public static ResultSet rs;
    public static void newRequest() { testData = new HashMap<>(); }

    public static void connectToDatabase() throws SQLException, ClassNotFoundException {
        if (testData == null){
            newRequest();
        }

        try {
//        DatabaseUtil
            dbUtil = new DatabaseUtil();
            connection = dbUtil.connectToDB();


            System.out.println("Successfully connected to the Database\n");
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }

    }

    public static void loadData(String featureName) throws Exception{

//        if (testData == null){
//            newRequest();
//        }
//
//        DatabaseUtil dbUtil = new DatabaseUtil();
//        Connection connection = dbUtil.connectToDB();
        Statement stmt;
     //   try (connection) {
            System.out.println("Successfully connected to the Database\n");

            System.out.println("Creating statement...");
            stmt = connection.createStatement();
            FetchQuery fq = new FetchQuery();
            String sql = fq.FetchQuery(featureName);
            rs = stmt.executeQuery(sql);
            ResultSetMetaData md = rs.getMetaData();
            while(rs.next()) {
                for (int i = 1; i <= md.getColumnCount(); i++) {
                    testData.put(md.getColumnLabel(i),rs.getString(i));
                }
            }

       // }

//        catch (Exception e){
//            e.printStackTrace();
//        }


            dbUtil.cleanUp(connection);

    }

    public static String getData(String key){

        if(testData.containsKey(key))
        {
            return testData.get(key);
        }
        else {
            System.out.println("Test Data not found\n");
            return null;
        }

    }

    public static void addData(String key, String value){

        if(testData == null){
            newRequest();
        }
        testData.put(key,value);
    }

    public static String getOrDefault(String key, String defaultValue){

        if (testData.containsKey(key)){
            return testData.get(key);
        }
        else{
            return defaultValue;
        }
    }

    public static void update(String key, String value) {

        if(!testData.containsKey(key)){
            System.out.println(key + " not found.");
        }
        else {
            testData.replace(key,value);
        }

    }

    public static void updateDataInDB(String featureName) throws Exception{

        DatabaseUtil dbUtil = new DatabaseUtil();
        Statement stmt;
        try (Connection connection = dbUtil.connectToDB()){
            System.out.println("Successfully connected to the Database\n");
            stmt = connection.createStatement();
            FetchQuery fq = new FetchQuery();
            String sql = fq.FetchQuery(featureName);
            int i = stmt.executeUpdate(sql);
            System.out.println("Executing query...");
            assert i > 0;
            System.out.println(i + " records updated");
            stmt.executeQuery("COMMIT");
        }


    }

    public static void executeQueryFromInput(String query) throws Exception{

        if (testData == null){
            newRequest();
        }
        DatabaseUtil dbUtil = new DatabaseUtil();
        Connection connection = dbUtil.connectToDB();
        Statement stmt;
        try (connection) {
            System.out.println("Successfully connected to the Database\n");

            stmt = connection.createStatement();
            rs = stmt.executeQuery(query);
            ResultSetMetaData md = rs.getMetaData();
            while(rs.next()) {
                for (int i = 1; i <= md.getColumnCount(); i++) {
                    testData.put(md.getColumnLabel(i),rs.getString(i));
                }
            }
        }

        catch (Exception e){
            e.printStackTrace();
        }

        dbUtil.cleanUp(connection);


    }

}