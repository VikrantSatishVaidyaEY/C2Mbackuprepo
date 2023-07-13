package data.dataclass.inputfilebuilder;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import commons.PropertiesFile;

public class DatabaseUtility {
    public Connection con;
    public Statement stmt;
    public ResultSet rs;


    //	private PropertiesFile config;
    private PropertiesFile config = new PropertiesFile();

    public DatabaseUtility() throws Exception {
    }

    public Connection connectToDB() throws ClassNotFoundException, SQLException{
        Class.forName("oracle.jdbc.driver.OracleDriver");

        String host = config.getDbHost();
        String port = config.getDbPort();
        String serviceName = config.getDbServiceName();
        String username = config.getDbUsername();
        String password = config.getDbPassword();

        Connection connect = DriverManager.getConnection("jdbc:oracle:thin:@//" + host + ":" + port + "/" + serviceName, username, password);
        return connect;
    }


    public void main(String[] args) throws SQLException, ClassNotFoundException{

        try{
//            Class.forName("oracle.jdbc.driver.OracleDriver");
            Class.forName("com.mysql.jdbc.Driver");

            // Execute a query
            System.out.println("Creating statement...");
            stmt = con.createStatement();
            String sql;
            sql = "SELECT ACCT_ID, SA_ID FROM CI_SA FETCH FIRST 5 ROW ONLY";
            ResultSet rs = stmt.executeQuery(sql);

            // Extract data from result set
            while(rs.next()){
                //Retrieve by column name
                String acctID  = rs.getString("ACCT_ID");
                String saID = rs.getString("SA_ID");

                //Display values
                System.out.println("Acct ID: " + acctID + " ~~~~ SA ID: " + saID);
            }

            // Clean-up environment
            rs.close();
            stmt.close();
            con.close();
        } catch(ClassNotFoundException cnf) {
            System.out.println("No Driver");
            System.out.println(cnf.getLocalizedMessage());
        } catch(SQLException se){
            System.out.println(se.getLocalizedMessage());
        }
    }

    public ResultSet executeQuery(Connection connect, String query) throws SQLException{
        stmt = connect.createStatement();
        rs = stmt.executeQuery(query);
        return rs;
    }

    public void cleanUp(Connection connect) throws SQLException{
        // Clean-up environment
        if(rs != null)
            rs.close();

        if(stmt != null)
            stmt.close();

        if(connect != null)
            connect.close();
    }
}
