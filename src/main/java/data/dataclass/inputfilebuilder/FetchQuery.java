
package data.dataclass.inputfilebuilder;

import java.io.File;
import java.io.IOException;
import java.util.Properties;
//import etaf.helperutils.testdatahelpers.TestDataHandler;
import utils.helpers.testdatahelpers.TestDataHandler;

import java.io.FileNotFoundException;
public class FetchQuery {

    private static String fileName;
    private TestDataHandler testDataHandler;

    public String FetchQuery(String feature) {

        String query = "";
        this.testDataHandler = this.getTestDataHandler();
        File file = new File("src/test/resources/C2M_EYDEMO/data/inputdata/yaml/SqlQueries.yaml");

        try{
            query = testDataHandler.getDataStringFromNonTestDataFile(feature.toUpperCase(),file.getAbsolutePath());
        } catch (Exception e)
        {
            e.printStackTrace();
        }

        return query;
    }
    public TestDataHandler getTestDataHandler() {
        if (testDataHandler == null) {
            Class var0 = TestDataHandler.class;
            synchronized (TestDataHandler.class) {
                if (testDataHandler == null) {
                    testDataHandler = new TestDataHandler();
                }
            }

        }
        return testDataHandler;


    }
}