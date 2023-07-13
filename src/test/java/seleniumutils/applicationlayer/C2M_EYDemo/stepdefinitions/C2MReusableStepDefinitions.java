package seleniumutils.applicationlayer.C2M_EYDemo.stepdefinitions;

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
import utils.helpers.testdatahelpers.TestDataHandler;
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

public class C2MReusableStepDefinitions extends StepImplementationBase {
    Faker faker = new Faker();
    TestDataLoader tdl=new TestDataLoader();
    static ArrayList<String> windowHandlerStack = new ArrayList<>();
    NavigationStepDefs navigationDef = new NavigationStepDefs(driverUtil);
    private TestDataHandler testDataHandler;

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
       // this.browserHandling.closeActiveDriver();
        this.driver.quit();
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

//    @Then("^Validate that required measuring component list elements (.+) are created for device configuration (.+)$")
//    public void validate_measuring_component_list(String element, String specification) {
//        MeasuringComponent mc = new MeasuringComponent(this.driver);
//        ElementObject pObj = PageObjectGenerator.getElementObject(element);
//        int mcCounter = 1;
//        boolean mcValidationFlag = true;
//        System.out.println("Displayed Measuring Components:");
//        do {
//            if (mc.isMcPresent(pObj.getAccessType(), mc.initialize_mc_xpath(pObj.getXpath(), mcCounter), true) == true) {
//                mc.validate_mc_type(this.elementGetters.getText(pObj.getAccessType(), mc.initialize_mc_xpath(pObj.getXpath(), mcCounter)), specification);
//            } else {
//                mcValidationFlag = false;
//            }
//            mcCounter = mcCounter + 1;
//        } while (mcValidationFlag != false);
//    }

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


    //new code
    @Then("^I save the device configuration id$")public void saveAssetConfigID()
    {    String configID = driver.findElement(By.xpath("//span[@id='bsDeviceConfigId']")).getText();
        CaptureData.addData("DevConfigID",configID);

    }

    @Then("^I enter saved configuration id into input element (.*)$")
    public void enterSavedDetails(String element)
    {    String configID = CaptureData.getData("DevConfigID");
        InputElementStepDefs I = new InputElementStepDefs(driverUtil);
        I.enter_text(configID,element);

    }

    //new methods
    @Then("^I save (.*) detail in variable \"(.*)\"$")
    public void saveDetails(String element,String variable){

        String text = new ValidationStepDefs(driverUtil).getAttributeFromElement("value",element);
        if(text==null){
            ElementObject pObj = PageObjectGenerator.getElementObject(element);
            text = driver.findElement(By.xpath(pObj.getXpath())).getText();
        }
        tdl.addData(variable,text);

    }

    @Then("^I load \"(.*)\" from test data into dropdown (.*)$")
    public void loadTextInDropdown(String key, String element){

        String text = tdl.getData(key);
        new SelectionElementStepDefs(driverUtil).select_option_from_dropdown_by_text(text,element);

    }

    @Then("^I enter \"(.*)\" from (file|test data) in input field (.*)$")
    public void enterDataFromSavedDetails(String key, String isElement, String element) throws Exception{

        boolean elementOrSavedInfo = isElement.equalsIgnoreCase("file");
        String text = "";
        if(elementOrSavedInfo){
            String[] arrOfStr = key.split("\\.");
            text = this.testDataHandler.getDataStringFromNonTestDataFile(arrOfStr[1], "src/test/resources/C2M_EYDEMO/data/inputdata/yaml/"+ arrOfStr[0] +".yaml");
        }
        else{ text = tdl.getData(key);}

        new InputElementStepDefs(driverUtil).enter_text(text,element);

    }

    @Given("^I load the data for feature \"(.*)\"$")
    public void loadTestData(String feature) throws Exception{

        tdl.loadData(feature);

    }
//"(.*)"$
    @Given("^I connect to db")
    public void connectToDataBase(String dbname) throws Exception{

        tdl.connectToDatabase();

    }


    @Then("^I update (.*) (numeric|) value in variable \"(.*)\"$")
    public void updateVariable(String element,String isNumeric, String variable)
    {


        if(isNumeric.equalsIgnoreCase("numeric")){
            int numElements = driver.findElements(By.xpath("//input[@id='BSEG_READ_CALC:0$FINAL_REG_QTY']/ancestor::tbody/tr")).size();
            double Value = Double.parseDouble(tdl.getOrDefault(variable, "0.0").replaceAll(",", ""));
            for(int i=0;i<numElements;i++) {
                String text = driver.findElement(By.xpath("//input[@id='BSEG_READ_CALC:"+i+"$FINAL_REG_QTY']")).getAttribute("value");
                Value += Double.parseDouble(text.replaceAll(",",""));
            }
            tdl.update(variable, String.valueOf(Value));
        }

    }
    @Then("^I run the query \"(.*)\" to update records$")
    public void runQueryInDB(String queryPath) throws Exception{

        tdl.updateDataInDB(queryPath);

    }

    @Then("^I execute query \"(.*)\" to fetch results from database$")
    public void fetchRecordstoValidateResults(String query) throws Exception {

        String[] queryBuilder = query.split(" ");
        for(int i=0;i<queryBuilder.length;i++){
            if(queryBuilder[i].contains("<") && queryBuilder[i].endsWith(">")){
                int startIndex = queryBuilder[i].indexOf("<");
                String key = queryBuilder[i].substring(startIndex+1,queryBuilder[i].length()-1);
                System.out.println(key);
                String[] replacement = queryBuilder[i].split("<");
                queryBuilder[i] = replacement[0] + "'" + tdl.getData(key)+"'";

            }

        }

        String newQuery = String.join(" ",queryBuilder);

        tdl.executeQueryFromInput(newQuery);


    }

//    @Then("^I enter todays date into date field (.*)$")
//    public void i_enter_todays_date_into_date_field(String element) {
//        DateFormat dformat = new SimpleDateFormat("MM/dd/yyyy");
//        Calendar today = Calendar.getInstance();
//    //    Date d2 = new Date();
//        today.add(Calendar.DATE,0);
//        String datef = dformat.format(today.getTime());
//        ElementObject pObj = PageObjectGenerator.getElementObject(element);
//        this.sendKeys.sendKeys(pObj.getAccessType(), pObj.getAccessName(), datef);
//    }

//######################
@Then("^I enter todays date into the input field (.+)$")
public void i_enter_todays_date_into_date_field(String element) {
    DateFormat dformat = new SimpleDateFormat("MM/dd/yyyy");
    Calendar today = Calendar.getInstance();
    //    Date d2 = new Date();
    today.add(Calendar.DATE,0);
    String datef = dformat.format(today.getTime());
    ElementObject pObj = PageObjectGenerator.getElementObject(element);
    this.sendKeys.sendKeys(pObj.getAccessType(), pObj.getAccessName(), datef);
}

@Then("^I accept the alerts if applicable$")
public void acceptAlertIfPopedUp()
{
    NavigationStepDefs nvs = new NavigationStepDefs(driverUtil);
    try
  {
    if (ExpectedConditions.alertIsPresent() != null)
    {
    nvs.handle_alert();
    }
  }
 catch (NoAlertPresentException e){
        e.printStackTrace();
 }
}


//######################### New Steps for Workbench####################################################################

    @Then("^I login to application$")
    public void logintoapplication()
    {
        NavigationStepDefs nvs = new NavigationStepDefs(driverUtil);
        try
        {
            if (ExpectedConditions.alertIsPresent() != null)
            {
                nvs.handle_alert();
            }
        }
        catch (NoAlertPresentException e){
            e.printStackTrace();
        }
    }

    @Then("^I retrieve text from element (.*) and store it in memory as (.*) data$")
    public void iRetrieveTheTextFromElementTextbox(String element, String datavalue) {
        ElementObject pObj = PageObjectGenerator.getElementObject(element);
        String data = this.elementGetters.getText(pObj.getAccessType(), pObj.getAccessName());
        ContextManagerImpl.getInstance().put(datavalue.toUpperCase(), data);
    }

    @Then("^I retrieve (.*) data from memory and enter retrieved text into input field (.+)$")
    public void iRetrieveDataFromMemory(String dataKey,String element) {
        ElementObject pObj = PageObjectGenerator.getElementObject(element);
        String datafrommemory= ContextManagerImpl.getInstance().get(dataKey.toUpperCase()).toString();
        System.out.println(datafrommemory);
        this.sendKeys.sendKeys(pObj.getAccessType(), pObj.getAccessName(), datafrommemory);
    }

    @Then("^I move to new window$")
    public void switchToNewWindow() {
        String mainWindowHandler = driver.getWindowHandle();
        windowHandlerStack.add(mainWindowHandler);
        navigationDef.switch_to_new_window();

    }

    @Then("^I move to previous window$")
    public void switchToPreviousWindowHandler(){
        String previousWindowHandler=windowHandlerStack.get(windowHandlerStack.size()-1);
        driver.switchTo().window(previousWindowHandler);
        windowHandlerStack.remove(previousWindowHandler);
    }

//    @Then("^I enter current time into the input field (.+)$")
//    public void i_enter_current_time_into_date_field(String element) {
//
//        Date time = new java.util.Date(System.currentTimeMillis());
//      //  System.out.println(new SimpleDateFormat("HH:mm:ss").format(time));
//        SimpleDateFormat currenttime=new SimpleDateFormat("hh:mm:ssa",Locale.getDefault());
//        //currenttime.setTimeZone(TimeZone.getTimeZone("America/Denver"));
//
//        String date=currenttime.format(time).toString();
//
//        ElementObject pObj = PageObjectGenerator.getElementObject(element);
//        this.sendKeys.sendKeys(pObj.getAccessType(), pObj.getAccessName(), date);
//    }

    @Then("^I accept alert if it is displayed$")
    public void handle_alert_if_displayed() {

        if(this.windowHandling.alerttext()!=null)
        {        this.windowHandling.handleAlert("accept");

        }
    }

    @Then("^I get \"(.*)\" text from (UI|file|saved results) and enter to \"(.*)\" input field$")
    public void getInputFromFileAndEnterToInputField(String key, String source1, String element) throws Exception {

        InputElementStepDefs input = new InputElementStepDefs(driverUtil);

        String text1 = "";
        switch (source1) {
            case "UI":
                ElementObject keyObj = PageObjectGenerator.getElementObject(key);
                text1 = driver.findElement(By.xpath(keyObj.getXpath())).getText();
                break;
            case "file":
                String[] keyArray = key.split("\\.");
                text1 = this.testDataHandler.getDataStringFromNonTestDataFile(keyArray[1], "src/test/resources/C2M/data/inputdata/yaml/" + keyArray[0] + ".yaml");
                break;
            case "saved results":
                text1 = tdl.getData(key);
        }

        input.enter_text(text1, element);
    }

    @Then("^I move to frame (.*)$")
    public void moveToTargetFrame(String element) throws Exception{

        ElementObject pObj = PageObjectGenerator.getElementObject(element);
        String frameXpath = pObj.getXpath();
        String currentFrame = "";
        Set<String> visited =  new HashSet<String>();

        if(element.contains("main")){
            navigationDef.switch_to_default_content();
            navigationDef.switch_frame_by_element(element);
        }
        else {
            if (driver.findElements(By.xpath(frameXpath)).size() != 1) {

                if (driver.findElements(By.xpath("//iframe")).size() == 0) {
                    navigationDef.switch_to_default_content();
                    try {
                        driver.switchTo().frame("main");
                    }catch (Exception e){
                        e.printStackTrace();
                    }
                }
                int numOfFrames = driver.findElements(By.xpath("//iframe")).size();

                int i = 1;
                while (i <= numOfFrames) {
                    String id = driver.findElement(By.xpath("(//iframe)[" + i + "]")).getAttribute("id");
                    if (!visited.contains(id)) {
                        currentFrame = id;
                        driver.switchTo().frame(currentFrame);
                        break;
                    }
                    i++;
                }
                Assert.assertTrue("Frame not found", i <= numOfFrames);
                Assert.assertTrue("Frame not found", switchFrameHelper(visited, currentFrame, element));

            } else {
                navigationDef.switch_frame_by_element(element);
            }
        }

    }

    public boolean switchFrameHelper(Set<String> visited, String currentFrame, String targetFrame){

        ElementObject pObj = PageObjectGenerator.getElementObject(targetFrame);
        int numOfFrames = 0;
        String frameId = "";
        //Base Case 1: target frame is found
        //switch and return true
        if(driver.findElements(By.xpath(pObj.getXpath())).size()==1){
            navigationDef.switch_frame_by_element(targetFrame);
            return true;
        }
        else{
            //target frame not found
            if((driver.findElements(By.xpath("//iframe")).size()==0) || currentFrame.equalsIgnoreCase("main")){
                visited.add(currentFrame);
                navigationDef.switch_to_default_content();
                driver.switchTo().frame("main");
                numOfFrames = driver.findElements(By.xpath("//iframe")).size();
                int i = 1;

                while(i<=numOfFrames){
                    frameId = driver.findElement(By.xpath("(//iframe)["+i+"]")).getAttribute("id");
                    if(visited.contains(frameId)){
                        i++;
                    }
                    else{
                        break;
                    }
                }
                if(i <= (numOfFrames)){
                    //Base case 2 : no other frames available within current frame
                    //add current frame to visited, explore other branches
                    currentFrame = frameId;
                    driver.switchTo().frame(currentFrame);
                    return switchFrameHelper(visited,currentFrame,targetFrame);
                }else{
                    //Base case 3: all frames explored
                    //return false
                    return false;
                }
            }
            else{
                //Base case 4 : other frames available to explore within current frame
                //call switchFrameHelper on child framed
                numOfFrames = driver.findElements(By.xpath("//iframe")).size();
                int i = 1;

                while(i<=numOfFrames){
                    frameId = driver.findElement(By.xpath("(//iframe)["+i+"]")).getAttribute("id");
                    if(visited.contains(frameId)){
                        i++;
                    }
                    else{
                        break;
                    }
                }
                if(i <= (numOfFrames)){
                    currentFrame = frameId;
                    driver.switchTo().frame(currentFrame);
                    return switchFrameHelper(visited,currentFrame,targetFrame);
                }

                else{
                    visited.add(currentFrame);
                    navigationDef.switch_to_default_content();
                    driver.switchTo().frame("main");
                    currentFrame = "main";
                    return switchFrameHelper(visited,currentFrame,targetFrame);
                }
            }
        }

    }


    @Then("^I enter current time into the input field (.+)$")
    public void i_enter_current_time_into_date_field(String element) {

        Date time = new java.util.Date(System.currentTimeMillis());
        //  System.out.println(new SimpleDateFormat("HH:mm:ss").format(time));
        SimpleDateFormat currenttime=new SimpleDateFormat("hh:mm:ssa",Locale.getDefault());
        currenttime.setTimeZone(TimeZone.getTimeZone("America/Denver"));

        String date=currenttime.format(time).toString();


        ElementObject pObj = PageObjectGenerator.getElementObject(element);
        this.sendKeys.sendKeys(pObj.getAccessType(), pObj.getAccessName(), date);
    }

}
