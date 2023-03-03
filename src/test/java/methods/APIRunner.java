package methods;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import etaf.helperutils.screenRecorder.VideoRecord;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import static etaf.helperutils.constants.Constants.*;
import static etaf.helperutils.filehelper.GlobalProperties.getConfigProperties;
import static org.junit.jupiter.api.Assertions.assertEquals;

/**
 * Cucumber Option to run Karate API
*/


//Junit
public class APIRunner {

    private static final Logger LOGGER = LoggerFactory.getLogger(APIRunner.class);

    @BeforeClass
    public static void setup() {
        System.setProperty("karate.env",getConfigProperties().getProperty("karate"));
        if (getConfigProperties().getProperty("record_test_video").equals("true")) {
            try {
                VideoRecord.startRecording();
                LOGGER.info("Started video recording");
            } catch (Exception e) {
                LOGGER.error("Unable to start video recording", e);
            }
        }
    }

    public Logger getLogger() {
        return LOGGER;
    }

/**
     * This is the API Test runner Junit
  */

    @Test
    public void testParallel() {
        int forkCount = Integer.parseInt(getConfigProperties().getProperty("forkCount"));
        String REPORTS_PATH = getConfigProperties().getProperty("report-directory") + FILE_SEPARATOR;
        String KARATE_TAGS = getConfigProperties().getProperty("karate-tags");
        String TESTS_PATH = getConfigProperties().getProperty("source.feature");

        Results results = Runner.path(TESTS_PATH)
                .outputCucumberJson(true)
                .reportDir(REPORTS_PATH)
                .tags(KARATE_TAGS)
                .parallel(forkCount);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }


    private static void generateReport(String reportOutputPath) {
        Collection<File> jsonFiles = FileUtils.listFiles(new File(reportOutputPath), new String[]{"json"}, true);
        jsonFiles.remove(new File(AXE_JSON_REPORT));
        jsonFiles.remove(new File(HTMLCS_JSON_REPORT));
        jsonFiles.remove(new File(TEST_ACCESSIBILITY_JSON_REPORT));
        List jsonPaths = new ArrayList(jsonFiles.size());
        for (File file : jsonFiles) {
            jsonPaths.add(file.getAbsolutePath());
        }
        String REPORTS_PATH = getConfigProperties().getProperty("report-directory") + FILE_SEPARATOR;
        Configuration config = new Configuration(new File(REPORTS_PATH), "NGTP API Tests");

        config.addClassifications("Platform", getConfigProperties().getProperty(PLATFORM));
        config.addClassifications("Platform_version", getConfigProperties().getProperty(PLATFORM_VERSION));
        config.addClassifications("Browser", getConfigProperties().getProperty(BROWSER));
        config.addClassifications("Environment", System.getProperty("karate.env"));

        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }


    @AfterClass
    public static void afterScenario() throws Exception {
        String REPORTS_PATH = getConfigProperties().getProperty("report-directory") + FILE_SEPARATOR;
        generateReport(REPORTS_PATH);
        try {
        } catch (Exception e) {
            throw new Exception(e);
        }
    }
}


