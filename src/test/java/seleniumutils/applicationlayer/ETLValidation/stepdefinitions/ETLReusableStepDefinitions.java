package seleniumutils.applicationlayer.ETLValidation.stepdefinitions;

import application.ETLStepDefinitions;
import application.Initializer;
import env.DriverUtil;
import infrastructure.ETLContext;
import io.cucumber.java.Before;
import io.cucumber.java.Scenario;
import io.cucumber.java.en.And;
import org.apache.spark.SparkFiles;
import org.apache.spark.sql.Dataset;
import org.apache.spark.sql.Row;
import org.apache.spark.sql.functions;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.lang.invoke.MethodHandles;
import java.util.HashSet;
import java.util.Set;


public class ETLReusableStepDefinitions extends Initializer {
    private static final Logger LOGGER = LoggerFactory.getLogger(MethodHandles.lookup().lookupClass());
    private Scenario scenario;
    private ETLStepDefinitions etlStepDefinitions;
    public ETLReusableStepDefinitions() throws Exception {
        etlStepDefinitions = new ETLStepDefinitions();
    }

    @Before
    public void before(Scenario scenario) {
        this.scenario = scenario;
    }

    private static Set<String> findLinks(String url) throws IOException {

        Set<String> links = new HashSet<>();

        Document doc = Jsoup.connect(url)
                .data("query", "Java")
                .userAgent("Mozilla")
                .cookie("auth", "token")
                .timeout(3000)
                .get();

        Elements elements = doc.select("a[href]");
        for (Element element : elements) {
            links.add(element.attr("href"));
        }

        return links;

    }

    /**
     * Get the trade with the maximum volatility.
     *
     * @param datasetName the dataset name
     */
    @And("^I get the trade with the maximum volatility from ([^\\s]+) dataset$")
    public void iGetTheTradeWithTheMaximumVolatility(String datasetName) {
        Dataset<Row> dataset = super.getContextManager().getDataset(datasetName);
        dataset = dataset.withColumn("volatility", functions.abs(dataset.col("High").minus(dataset.col("Low"))));
        super.getContextManager().setDatasetMap(datasetName,dataset);
        scenario.attach(dataset.agg(functions.max(dataset.col("volatility")).as("max_volatility"),functions.min(dataset.col("volatility")).as("min_volatility")).showString(5, 20, false), "text/plain","noname");
    }

    /**
     * Read data from url as csv file.
     *
     * @param urls        the urls
     * @param datasetName the dataset name
     * @throws Exception the exception
     */
    @And("^I read data from \"(.*)\" url as csv file and store it in (.*) dataset$")
    public void iReadDataFromUrlAsCsvFile(String urls, String datasetName) throws Exception {
        new DriverUtil().getDriver().navigate().to(urls);
        Set<String> links = findLinks(urls);
        Dataset<Row> result = links.parallelStream().filter(link -> link.contains("products/csv/")).limit(10).map(url -> {
            Dataset<Row> subset = null;
            try {
                ETLContext.getETLContext().getSession().sparkContext().addFile(urls + url);
                subset = ETLContext.getETLContext().getSession()
                        .read()
                        .option("inferSchema", true)
                        .option("header", true)
                        .csv(SparkFiles.get("*"))
                        .repartition(5);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return subset;
        }).reduce((left,right) -> left.unionAll(right))
                .orElse(ETLContext.getETLContext().getSession().emptyDataFrame())
                .dropDuplicates("Trade Date","Futures");
        super.getContextManager().setDatasetMap(datasetName,result);
    }

    @And("^I compare (.*) and (.*) data by column having primary key \"(.*)\" and store it in \"(.*)\" dataset ignoring (.*) for (.*) field$")
    public void iCompareWaveAndInfoleaseDataByColumnHavingPrimaryKeyAndStoreItInDatasetIgnoringDateFormats(String source, String target, String primaryKey, String comparison, String exclusion, String column) throws Exception {
        Dataset<Row> src;
        Dataset<Row> tgt;
        if (exclusion.toLowerCase().contains("format") && (exclusion.toLowerCase().contains("date")||exclusion.toLowerCase().contains("time"))) {
            src = contextManager.getDataset(source);
            src = src.withColumn(column, functions.to_date(src.col(column), "yyyy/d/MM"));
            contextManager.setDatasetMap("FORMATTED_SOURCE",src);
            tgt = contextManager.getDataset(target);
            tgt = tgt.withColumn(column, functions.to_date(tgt.col(column), "MM/d/yyyy"));
            contextManager.setDatasetMap("FORMATTED_TARGET",tgt);
            //etlStepDefinitions.iCompareData_AndData_ByColumn( "formatted_source", "formatted_target", primaryKey, comparison);
            Dataset<Row> compareResult = super.getValidator().compareByColumn(super.getContextManager().getDataset("formatted_source"), super.getContextManager().getDataset("formatted_target"), primaryKey).cache();
            super.getContextManager().setDatasetMap(comparison.toUpperCase(), compareResult);
            this.scenario.attach(compareResult.showString(5, 20, false), "text/plain", "First 5 rows");
            if (compareResult.count() > 5L) {
                this.scenario.attach("There are more rows to the report. Write the result to a file or database to view the entire report", "text/plain", "Details");
            }

            LOGGER.info("Comparison completed");
        }else {
            LOGGER.error("Unknown format provided for exclusion. This step only supports time and date formats");
        }

    }
}