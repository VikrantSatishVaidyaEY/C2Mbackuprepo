package seleniumutils.applicationlayer.Ccb.stepdefinitions;

import env.DriverUtil;
import etaf.helperutils.elementHelper.ElementObject;
import io.cucumber.java.en.Then;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.ui.*;
import stepimplementation.*;
import utils.helpers.pageobjechelpers.PageObjectGenerator;


import baseinitializers.StepImplementationBase;
import com.github.javafaker.Faker;
import data.dataclass.inputfilebuilder.TestDataLoader;
import io.cucumber.java.en.Given;
import org.junit.Assert;
import org.openqa.selenium.*;
import stepimplementation.ValidationStepDefs;
import stepimplementation.ClickElementStepDefs;
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
import utils.helpers.pageobjechelpers.PageObjectGenerator;

import creditcollection.CreditCollection;
import data.dataclass.TestDataGenerator;
import measuringcomponent.MeasuringComponent;
import billing.Billing;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.Duration;
import java.util.*;
import java.util.concurrent.TimeUnit;

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

    @Then("^I (check|uncheck) checkbox \"(.*)\" using javascript or action builder$")
    public void clickUsingActionBuilderOrJavascript(String state,String element){

        ClickElementStepDefs clk = new ClickElementStepDefs(driverUtil);
        clk.clickUsingJS(element);
        ElementObject pObj = PageObjectGenerator.getElementObject(element);
        boolean checked = state.equals("check");
        if(!driver.findElement(By.xpath(pObj.getXpath())).isSelected()){
            Actions actions = new Actions(driver);
            new WebDriverWait(driver, Duration.ofSeconds(10)).until(ExpectedConditions.presenceOfElementLocated(By.xpath(pObj.getXpath())));
            actions.moveToElement(driver.findElement(By.xpath(pObj.getXpath()))).click().build().perform();
        }

    }


    @Then("^I change visibility of element \"(.*)\"$")
    public void ChangeVisibility(String element){

        ElementObject pObj = PageObjectGenerator.getElementObject(element);
        JavascriptExecutor jse = (JavascriptExecutor) driver;
        WebElement pageObj = driver.findElement(By.xpath(pObj.getXpath()));
        jse.executeScript("arguments[0].style.visibility='visible';",pageObj);
    }
}

