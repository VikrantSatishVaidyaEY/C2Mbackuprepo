package methods;

import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.lang3.StringUtils;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.*;

import static etaf.helperutils.constants.Constants.*;
import static etaf.helperutils.filehelper.GlobalProperties.getConfigProperties;

public class ReportGeneratorThread extends Thread{
    static void generateReport() {

        File dir = new File(REPORTS_PATH);

        File[] files = dir.listFiles((dir1, name) -> name.startsWith("cucumberJSONReport") && name.endsWith(".json"));
        if (files != null) {
            Collection<File> jsonFiles = Arrays.asList(files);
            List<String> jsonPaths = new ArrayList<String>(jsonFiles.size());
            for (File file : jsonFiles) {
                jsonPaths.add(file.getAbsolutePath());
            }
            Configuration config = new Configuration(new File(REPORTS_PATH), "CucumberBDD");

            config.addClassifications(StringUtils.capitalize(PLATFORM), getConfigProperties().getProperty(PLATFORM));
            config.addClassifications(StringUtils.capitalize(PLATFORM_VERSION), getConfigProperties().getProperty(PLATFORM_VERSION));
            config.addClassifications(StringUtils.capitalize(BROWSER), getConfigProperties().getProperty(BROWSER));

            ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
            reportBuilder.generateReports();
        }
    }

    public void run() {
        String timeStamp = new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss").format(new Date());
        File cucumberReports = new File(REPORTS_PATH + "cucumberJSONReport.json");
        File cucumberReportsHistory = new File(REPORTS_PATH + "cucumberJSONReport_" + timeStamp + ".json");

        cucumberReports.renameTo(cucumberReportsHistory);

        generateReport();
    }
}
