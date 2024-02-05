package methods;

import etaf.helperutils.filehelper.GlobalProperties;
import etaf.helperutils.screenRecorder.VideoRecord;
import io.cucumber.testng.AbstractTestNGCucumberTests;
import io.cucumber.testng.CucumberOptions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.testng.annotations.AfterClass;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.DataProvider;

import java.io.IOException;

import static etaf.helperutils.constants.Constants.POPUP_REPORT;
import static etaf.helperutils.filehelper.GlobalProperties.getConfigProperties;

@CucumberOptions(
        tags = "@CC008",
        plugin = {"pretty", "html:target/reports/cucumberHtmlReport", "json:target/reports/cucumberJSONReport.json", "rerun:rerun.txt"},
        features = {"src/test/resources"},
        glue = { "seleniumutils.applicationlayer", "seleniumutils.frameworklayer", "methods", "stepimplementation", "application", "com.intuit.karate"}
)

public class CC008CanelingACollectionProcess extends AbstractTestNGCucumberTests {
    private static final Logger LOGGER = LoggerFactory.getLogger(CC008CanelingACollectionProcess.class);

    @BeforeClass
    public static void setup() throws IOException {
        if (getConfigProperties().getProperty("record_test_video").equals("true")) {
            try {
                GlobalProperties globalProperties = getConfigProperties();
                VideoRecord.startRecording();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

    }

    @Override
    @DataProvider(parallel = true)
    public Object[][] scenarios() {
        return super.scenarios();
    }

    @AfterClass
    public static void afterScenario() throws Exception {
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
