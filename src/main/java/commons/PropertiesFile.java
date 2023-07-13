/*
 *************************************************************************************
 * CHANGE HISTORY:
 *
 * Date:       	by:    		Reason:
 * 2022-05-04	CTongo		Initial Version.
 *************************************************************************************
 */

package commons;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

public class PropertiesFile {

    private Properties properties;
    private static String fileName;

    public PropertiesFile(){
        BufferedReader reader;

        // This holds the information of the configuration file path.
        File file = new File("C:\\Users\\FH352RA\\OneDrive - EY\\Documents\\GitHub\\C2Mbackuprepo\\Configuration.properties.txt");
        fileName = file.getName();

        try {
            // Reads text from a character-input stream, buffering characters
            // so as to provide for the efficient reading of characters, arrays, and lines.
            // Creates a new FileReader, given the name of the file to read from.
            reader = new BufferedReader(new FileReader(file));
            properties = new Properties();

            try {
                properties.load(reader);
                reader.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
            System.out.println(fileName + " found at " + file);
        }
    }

    public int getImplicitWait() {
        String implicitWait = properties.getProperty("ImplicitWait").trim();
        if(!implicitWait.isEmpty()){
            return Integer.parseInt(implicitWait);
        } else {
            System.out.println("\"ImplicitWait\" not specified in the " + fileName + " file.");
            return 30;
        }
    }

    public int getExplicitWait() {
        String explicitWait = properties.getProperty("ExplicitWait").trim();
        if(!explicitWait.isEmpty()){
            return Integer.parseInt(explicitWait);
        } else {
            System.out.println("\"ExplicitWait\" not specified in the " + fileName + " file.");
            return 60;
        }
    }

    public String getBrowser(){
        String browser = properties.getProperty("Browser").trim();
        if(!browser.isEmpty()){
            return browser;
        } else {
            System.out.println("\"Browser\" not specified in the " + fileName + " file.");
            return null;
        }
    }

    public String getWebDriverPath(){
        String webDriverPath = properties.getProperty("WebDriverPath").trim();
        if(!webDriverPath.isEmpty()){
            return webDriverPath;
        } else {
            System.out.println("\"WebDriverPath\" not specified in the " + fileName + " file.");
            return null;
        }
    }

    public String getUrl() {
        String appUrl = properties.getProperty("Url").trim();
        if(!appUrl.isEmpty()){
            return appUrl;
        } else {
            System.out.println("\"Url\" not specified in the " + fileName + " file.");
            return null;
        }
    }

    public String getUsername() {
        String username = properties.getProperty("Username").trim();
        if(!username.isEmpty()){
            return username;
        } else {
            System.out.println("\"Username\" not specified in the " + fileName + " file.");
            return null;
        }
    }

    public String getPassword() {
        String password = properties.getProperty("Password").trim();
        if(!password.isEmpty()){
            return password;
        } else {
            System.out.println("\"Password\" not specified in the " + fileName + " file.");
            return null;
        }
    }

    public String getDbHost() {
        String dbHost = properties.getProperty("dbHost").trim();
        if(!dbHost.isEmpty()){
            return dbHost;
        } else {
            System.out.println("\"dbHost\" not specified in the " + fileName + " file.");
            return null;
        }
    }

    public String getDbPort() {
        String dbPort = properties.getProperty("dbPort").trim();
        if(!dbPort.isEmpty()){
            return dbPort;
        } else {
            System.out.println("\"dbPort\" not specified in the " + fileName + " file.");
            return null;
        }
    }

    public String getDbServiceName() {
        String dbServiceName = properties.getProperty("dbServiceName").trim();
        if(!dbServiceName.isEmpty()){
            return dbServiceName;
        } else {
            System.out.println("\"dbServiceName\" not specified in the " + fileName + " file.");
            return null;
        }
    }

    public String getDbUsername() {
        String dbUsername = properties.getProperty("dbUsername").trim();
        if(!dbUsername.isEmpty()){
            return dbUsername;
        } else {
            System.out.println("\"dbUsername\" not specified in the " + fileName + " file.");
            return null;
        }
    }

    public String getDbPassword() {
        String dbPassword = properties.getProperty("dbPassword").trim();
        if(!dbPassword.isEmpty()){
            return dbPassword;
        } else {
            System.out.println("\"dbPassword\" not specified in the " + fileName + " file.");
            return null;
        }
    }

    public String getScreenshotNameTemplate() {
        String screenshotNameTemplate = properties.getProperty("screenshotNameTemplate").trim();
        if(!screenshotNameTemplate.isEmpty()){
            return screenshotNameTemplate;
        } else {
            System.out.println("\"screenshotNameTemplate\" not specified in the " + fileName + " file.");
            return null;
        }
    }

    public String getScreenshotExtension() {
        String screenshotExtension = properties.getProperty("screenshotExtension").trim();
        if(!screenshotExtension.isEmpty()){
            return screenshotExtension;
        } else {
            System.out.println("\"dbPassword\" not specified in the " + fileName + " file.");
            return null;
        }
    }
}