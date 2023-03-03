/*
 *************************************************************************************
 * CHANGE HISTORY:
 *
 * Date:       	by:    		Reason:
 * 2022-05-06	CTongo		Initial Version.
 *************************************************************************************
 */
package seleniumutils.applicationlayer.C2M_EYDemo.dataimportdefinitions;

import data.dataclass.InputFileBuilder;
import data.dataclass.inputfilebuilder.InputFileBuilder_Scenario;
import io.cucumber.java.en.Given;
import org.testng.Assert;

public class C2MReusableDataImportDefinitions
{
    private String assertPrefix = "XXX";

    public void hasError(Boolean flag) throws Throwable {
        if (flag == false){
            System.out.println("Failed to Load Data");
        }
    }

    @Given("^Load Test Data for All Feature Files$")
    public void load_test_data_for_feature_files() throws Throwable {
        InputFileBuilder input = new InputFileBuilder();
        boolean flag = input.getMain(null);
        hasError(flag);
        Assert.assertTrue(flag, assertPrefix + " - Failed to Load Data");
    }

    @Given("^Load Test Data for Feature File (.+)$")
    public void load_test_data_for_feature_file(String feature) throws Throwable {
        InputFileBuilder_Scenario input = new InputFileBuilder_Scenario();
        boolean flag = input.getMain(feature);
        hasError(flag);
        Assert.assertTrue(flag, assertPrefix + " - Failed to Load Data");
    }

}
