package methods;

import etaf.helperutils.filehelper.GlobalProperties;
import etaf.helperutils.screenRecorder.VideoRecord;
import io.cucumber.testng.AbstractTestNGCucumberTests;
import io.cucumber.testng.CucumberOptions;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.testng.annotations.DataProvider;

import java.io.IOException;

import static etaf.helperutils.constants.Constants.POPUP_REPORT;
import static etaf.helperutils.filehelper.GlobalProperties.getConfigProperties;


@CucumberOptions(
        tags = "@parallel",
        plugin = {"pretty", "html:target/reports/cucumberHtmlReport", "json:target/reports/cucumberJSONReport.json", "rerun:rerun.txt"},
        features = {"src/test/resources"},
        glue = { "seleniumutils.applicationlayer", "seleniumutils.frameworklayer", "methods", "stepimplementation", "application", "com.intuit.karate"}
)


public class ScenarioRunner extends AbstractTestNGCucumberTests {
    private static final Logger LOGGER = LoggerFactory.getLogger(ScenarioRunner.class);

    @BeforeClass
    public static void setup() throws IOException {
        System.out.println("==============ScenarioRunner called=========");
        if (getConfigProperties().getProperty("record_test_video").equals("true")) {
            try {
                GlobalProperties globalProperties = getConfigProperties();
                VideoRecord.startRecording();

            } catch (Exception e) {
                e.printStackTrace();
            }
        }

    }

    @DataProvider(parallel = true)
    @Override
    public Object[][] scenarios() {
        return super.scenarios();
    }


    @AfterClass
    public static void afterScenario() throws Exception {
        System.out.println("ScenarioRunner called");
        try {
            if (getConfigProperties().getProperty("record_test_video").equals("true")) {
                VideoRecord.stopRecording();
                LOGGER.info("Started video recording");
            }
        } catch (Exception e) {
            LOGGER.error("Unable to start video recording", e);
        } finally {
            Runtime r = Runtime.getRuntime();
            r.addShutdownHook(new ReportGeneratorThread());
            if (getConfigProperties().getProperty(POPUP_REPORT).equalsIgnoreCase("true"))
                r.exec(new String[]{"cmd.exe", "/c", "ReportPopup.bat"});
        }
    }

}


