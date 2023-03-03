package methods;

import application.Initializer;
import base.BaseInitializer;
import baseinitializers.StepImplementationBase;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import env.DriverUtil;
import io.cucumber.java.AfterStep;
import io.cucumber.java.Before;
import io.cucumber.java.Scenario;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import utils.browser.ScreenShotMethods;
import utils.helpers.testdatahelpers.TestDataHandler;

import static etaf.helperutils.filehelper.JarPropertiesHelper.*;


public class Hooks {
    DriverUtil driverUtil;
    private static final Logger LOGGER = LoggerFactory.getLogger(Hooks.class);

    @AfterStep("@step_screenshots")
    public void takeStepScreenshot(Scenario scenario) {
        scenario.attach(ScreenShotMethods.getScreenShotMethods().takeDesktopScreenshot(), "image/png", "test");

    }

    @AfterStep("@desktop_screenshots")
    public void takeDesktopScreenshot(Scenario scenario) {
        scenario.attach(ScreenShotMethods.getScreenShotMethods().takeDesktopScreenshot(), "image/png", "test");
    }

    @Before("not @etl")
    public void JarInitialize() throws Exception {
        driverUtil = new DriverUtil();
        new StepImplementationBase(driverUtil, stepDefPropJson(), dataUtilsBaseJson(), selfHealingPropJson());
    }

    @Before("@etl")
    public void initialize() throws Exception {
        Initializer initializer = new Initializer();
        new BaseInitializer(null, dataUtilsBaseJson(), selfHealingPropJson());
        ObjectMapper mapper = new ObjectMapper();
        try {
            initializer.setEtlDataHandler(mapper.writeValueAsString(TestDataHandler.traverseMap));
        } catch (JsonProcessingException e) {
            LOGGER.error("Unable to convert Test Data files to json objects for etl core libraries instance");
        }
    }
}
