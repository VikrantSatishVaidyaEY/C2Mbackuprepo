package seleniumutils.applicationlayer.C2M_EYDemo.stepdefinitions;

import baseinitializers.StepImplementationBase;
import com.github.javafaker.Faker;
import env.DriverUtil;
import etaf.helperutils.ContextManager.ContextManagerImpl;
import etaf.helperutils.datahelpers.StringHelperUtils;
import etaf.helperutils.elementHelper.ElementObject;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebElement;
import utils.helpers.pageobjechelpers.PageObjectGenerator;

import creditcollection.CreditCollection;
import data.dataclass.TestDataGenerator;
import measuringcomponent.MeasuringComponent;
import billing.Billing;

import java.util.List;

public class C2MReusableStepDefinitions extends StepImplementationBase {
    Faker faker = new Faker();

    public C2MReusableStepDefinitions(DriverUtil driverUtil) {
        super(driverUtil);
    }

    @Then("^I put random number into input field (.+)$")
    public void enter_random_number_into_input_field(String element) {
        String ssn = faker.idNumber().ssnValid();
        ElementObject pObj = PageObjectGenerator.getElementObject(element);
        this.enterText.enterText(pObj.getAccessType(), ssn, pObj.getAccessName());
    }

    //new code
    @Then("^I enter current date into datepicker field (.+)$")
    public void enter_current_date_into_datepicker_field(String element) {
        // Write code here that turns the phrase above into concrete actions
        ElementObject pObj = PageObjectGenerator.getElementObject(element);
        WebElement wb = driver.findElement(By.xpath("//*[@id='serviceStartDate_datePicker']"));
        //WebElement wb =
               // driver.findElement(By.xpath("//*[@id='serviceStartDate']")).sendKeys("08-18-20");
        JavascriptExecutor jse = (JavascriptExecutor)driver;
        //working jse.executeScript("document.getElementById('serviceStartDate').value='08-17-2022'");


        //identify all td elements in list
        List<WebElement> t =driver.findElements(By.xpath("//table/tbody/tr/td"));
        //list traversal
        for (int k = 0; k<t.size(); k++) {
            //check date
            String dt = t.get(k).getText();
            if (dt.equals("18")) {
                t.get(k).click();
                break;
            }
        }
        String v = wb.getAttribute("value");





//        jse.executeScript("arguments[0].value='08-18-2022';", wb);
        // jse.executeScript("document.getElementById('ssn').value='555-55-5555';");
        //WebElement pObj = driver.findElement(By.xpath(element));
//        List<WebElement> columns = pObj.findElements(By.tagName("td"));
//
//        for (WebElement cell : columns) {
//            //Select 13th Date
//            if (cell.getText().equals("17")) {
//                cell.findElement(By.linkText("17")).click();
//                break;
//            }
//
//        }

       // throw new io.cucumber.java.PendingException();
    }

//    @Then("^I press \"([^\"]*)\" key")
//    public void enter_key(String key) {
//        //ElementObject pObj = PageObjectGenerator.getElementObject(element);
//        Keys k = StringHelperUtils.identifyKey(key);
//       // this.actionSendKeys.enterKeys(pObj.getAccessType(), k, pObj.getAccessName());
//        this.actionSendKeys.sendKeys(Keys.ENTER,);
//    }

    //8/19/2022

    @Then("^I put date number into input field (.+)$")
    public void enter_date_number_into_input_field(String element){

        WebElement wb = driver.findElement(By.xpath("//*[@id='serviceStartDate_datePicker']"));

        JavascriptExecutor jse = (JavascriptExecutor)driver;
        jse.executeScript("document.getElementById('serviceStartDate').value='08-17-2022'");
        jse.executeScript("processServiceStartDate();");

    }


    @Then("^I put time into input field (.+)$")
    public void enter_time_into_input_field(String element){

        WebElement wb = driver.findElement(By.xpath("//*[@id='serviceStartDate_datePicker']"));

        JavascriptExecutor jse = (JavascriptExecutor)driver;
        jse.executeScript("document.getElementById('serviceStartDate').value='08-17-2022'");
        jse.executeScript("processServiceStartDate();");

    }


    @Then("^validate the attribute (.+) from the element (.+) for event sequence (.+) if not matched click (.+)$")
    public void validate_event_sequence_number(String attributeName, String element_eventSequence, String event, String element_rightArrow) {
        CreditCollection cc = new CreditCollection();
        ElementObject pObj = null;
        String eventSeq = null;
        boolean eventValidationFlag = false;
        do {
            pObj = PageObjectGenerator.getElementObject(element_eventSequence);
            eventSeq = this.elementGetters.getAttribute(pObj.getAccessType(), pObj.getAccessName(), attributeName).trim();
            if (cc.compare_eventSequence(event, eventSeq) == true) {
                eventValidationFlag = true;
            } else {
                pObj = PageObjectGenerator.getElementObject(element_rightArrow);
                this.seleniumClicks.click(pObj.getAccessType(), pObj.getAccessName());
            }
        } while (eventValidationFlag != true);
    }
    //io.cucumber.java.en.Then
    @When("^I put badge number (.+) into the input field$")
    public void i_put_badge_number_assetpage_asset_type_badge_number_into_the_input_field(String element) {
    //enter_badge_number_into_input_field(String element) {
        TestDataGenerator data = new TestDataGenerator();
        String badgeNumber = data.generatebadgenumber();
        ElementObject pObj = PageObjectGenerator.getElementObject(element);
        this.enterText.enterText(pObj.getAccessType(), badgeNumber, pObj.getAccessName());
    }

    @When("^I quit browser$")
    public void i_quit_browser() {
        //  this.browserHandling.closeActiveDriver();
        this.browserHandling.closeActiveDriver();
    }
//io.cucumber.java.en.Then
    @When("^I put serial number (.+) into the input field$")
    public void i_put_serial_number_assetpage_asset_type_serial_number_into_the_input_field (String element){
    //enter_serial_number_into_input_field(String element) {
        TestDataGenerator data = new TestDataGenerator();
        String serialNumber = data.generateserialnumber();
        ElementObject pObj = PageObjectGenerator.getElementObject(element);
        this.enterText.enterText(pObj.getAccessType(), serialNumber, pObj.getAccessName());
    }

    @Then("^Go back to Last Page by clicking go back (.+) element button$")
    public void go_back_to_last_page(String element) {
        ElementObject pObj = PageObjectGenerator.getElementObject(element);
        this.seleniumClicks.click(pObj.getAccessType(), pObj.getAccessName());
    }

    @Then("^Validate that required measuring component list elements (.+) are created for device configuration (.+)$")
    public void validate_measuring_component_list(String element, String specification) {
        MeasuringComponent mc = new MeasuringComponent(this.driver);
        ElementObject pObj = PageObjectGenerator.getElementObject(element);
        int mcCounter = 1;
        boolean mcValidationFlag = true;
        System.out.println("Displayed Measuring Components:");
        do {
            if (mc.isMcPresent(pObj.getAccessType(), mc.initialize_mc_xpath(pObj.getXpath(), mcCounter), true) == true) {
                mc.validate_mc_type(this.elementGetters.getText(pObj.getAccessType(), mc.initialize_mc_xpath(pObj.getXpath(), mcCounter)), specification);
            } else {
                mcValidationFlag = false;
            }
            mcCounter = mcCounter + 1;
        } while (mcValidationFlag != false);
    }

    @Then("^I put random address into input field (.+)$")
    public void enter_random_address_into_input_field(String element) {
    //String ssn = faker.idNumber().ssnValid();
    // String zipCode = faker.address().zipCode();
        String address = faker.address().streetAddress();
    // .number()..digits(5);
        ElementObject pObj = PageObjectGenerator.getElementObject(element);
        this.enterText.enterText(pObj.getAccessType(), address, pObj.getAccessName());
    }

    @Then("^Search for the SA ID (.+) within the BSEG (.+) elements$")
    public void select_bseg_with_sa_id(String saId, String element) {
        Billing billing = new Billing();
        ElementObject pObj = PageObjectGenerator.getElementObject(element);
        this.seleniumClicks.click(pObj.getAccessType(), billing.initialize_bseg_xpath(pObj.getXpath(), saId));
    }

    @Then("^I get text from element (.*) and store it in memory as (.*) data")
    public void iGetTheTextFromElementSubmissionboundPolicy_numberAndStoreItInMemoryAsData_keyData(String element, String dataKey) {
        ElementObject pObj = PageObjectGenerator.getElementObject(element);
        String data = this.elementGetters.getText(pObj.getAccessType(), pObj.getAccessName());
        ContextManagerImpl.getInstance().put(dataKey.toUpperCase(), data);
    }
//commented code 08/18
//    @io.cucumber.java.en.Then("^I enter current date into datepicker field (.+)$")
//    public void i_enter_current_date_into_datepicker_field(String element) {
//        //String ssn = faker.idNumber().ssnValid();
//        // String date=faker.date().
//        // String zipCode = faker.address().zipCode();
//        // String address = faker.address().streetAddress();
//        // .number()..digits(5);
//        // ElementObject pObj = PageObjectGenerator.getElementObject(element);
//        // this.enterText.enterText(pObj.getAccessType(), address, pObj.getAccessName());
//
//        // WebElement pObj = PageObjectGenerator.getElementObject(element);
//        WebElement pObj = driver.findElement(By.xpath(element));
//        List<WebElement> columns = pObj.findElements(By.tagName("td"));
//
//        for (WebElement cell : columns) {
//            //Select 13th Date
//            if (cell.getText().equals("13")) {
//                cell.findElement(By.linkText("13")).click();
//                break;
//            }
//
//        }
//    }


}
