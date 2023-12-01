package seleniumutils.applicationlayer.Ccb.stepdefinitions;

import env.DriverUtil;
import etaf.helperutils.elementHelper.ElementObject;
import io.cucumber.java.en.Then;
import stepimplementation.ValidationStepDefs;
import utils.helpers.pageobjechelpers.PageObjectGenerator;


import baseinitializers.StepImplementationBase;
import com.github.javafaker.Faker;
import data.dataclass.inputfilebuilder.TestDataLoader;
import io.cucumber.java.en.Given;
import org.junit.Assert;
import org.openqa.selenium.*;
import org.openqa.selenium.support.ui.ExpectedConditions;
import stepimplementation.NavigationStepDefs;
import stepimplementation.SelectionElementStepDefs;
import stepimplementation.ValidationStepDefs;
//import measuringcomponent.MeasuringComponent;
import etaf.helperutils.datahelpers.*;
import etaf.helperutils.testdatahelpers.TestDataHandler;
import env.DriverUtil;
import etaf.helperutils.ContextManager.ContextManagerImpl;
import etaf.helperutils.datahelpers.StringHelperUtils;
import etaf.helperutils.elementHelper.ElementObject;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import methods.CaptureData;
import stepimplementation.InputElementStepDefs;
import utils.helpers.pageobjechelpers.PageObjectGenerator;

import creditcollection.CreditCollection;
import data.dataclass.TestDataGenerator;
import measuringcomponent.MeasuringComponent;
import billing.Billing;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

public class CcbReusableStepDefinitions extends StepImplementationBase {


    public CcbReusableStepDefinitions(DriverUtil driverUtil) {
        super(driverUtil);
    }

    @Then("^I validate element (.*) has value \"(.*)\"$")
    public void validateElementhasText(String element, String text) {

        String textFromUI = new ValidationStepDefs(driverUtil).getAttributeFromElement("value", element);
        if (textFromUI == null) {
            ElementObject pObj = PageObjectGenerator.getElementObject(element);
            textFromUI = driver.findElement(By.xpath(pObj.getXpath())).getText();
        }
        Assert.assertTrue(textFromUI.contains(text));

    }
}

