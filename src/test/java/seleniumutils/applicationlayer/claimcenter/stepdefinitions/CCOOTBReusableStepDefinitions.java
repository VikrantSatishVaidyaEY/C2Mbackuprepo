package seleniumutils.applicationlayer.claimcenter.stepdefinitions;

import baseinitializers.StepImplementationBase;
import env.DriverUtil;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import stepimplementation.*;


public class CCOOTBReusableStepDefinitions extends StepImplementationBase {
    public CCOOTBReusableStepDefinitions(DriverUtil driverUtil) {
        super(driverUtil);
        this.driverUtil = driverUtil;
    }
     ClickElementStepDefs clickDefs = new ClickElementStepDefs(driverUtil);
     InputElementStepDefs inputDefs = new InputElementStepDefs(driverUtil);
     NavigationStepDefs navigationDefs = new NavigationStepDefs(driverUtil);
     SelectionElementStepDefs selectionElementStepDefs = new SelectionElementStepDefs(driverUtil);
     ValidationStepDefs validationDefs = new ValidationStepDefs(driverUtil);
     WaitStepDefs waitStepDefs = new WaitStepDefs(driverUtil);

    String pagename;

    // select option by text/value from dropdown
    @Then("^I gwselect option \"(.*?)\" by (index) from dropdown (.+)$")
    public void gw_select_option_from_dropdown(String option, String optionBy, String element) throws Exception {
        int optionint;
        if (optionBy.equals("index")) {
            optionint = Integer.parseInt(option);
            clickDefs.click(element);
            for (int i = 0; i < optionint; i++)
                inputDefs.enter_key("ARROW_DOWN", element);
            inputDefs.enter_key("ENTER", element);
        }
    }

    @When("^I add a citation to the incident$")
    public void add_citation() throws Throwable {
        pagename = "New Vehicle Incident";
        pagename = pagename.replaceAll(" ", "");
        validationDefs.iLandOnPage(pagename);
        inputDefs.iFillDataFromYamlOntoThePage("CITATION", "NEWVEHICLEINCIDENT");
    }

    @When("^I enter effective date and expiration date of the policy$")
    public void basic_information() throws Throwable {

        pagename = "Search or Create Policy";
        pagename = pagename.replaceAll(" ", "");
        validationDefs.iLandOnPage(pagename);
        inputDefs.iFillDataFromYamlOntoThePage("BASIC_INFORMATION", "SEARCHORCREATEPOLICY");
    }

    // new exposure------------------------------------------------------
    @Given("^I select a coverage type for a new exposure$")
    public void coverage_type() throws Throwable {
        pagename = "Save and Assign Claim";
        pagename = pagename.replaceAll(" ", "");
        validationDefs.iLandOnPage(pagename);
        clickDefs.click("saveandassignclaim.new_exposure");
        selectionElementStepDefs.hover_over_element("saveandassignclaim.choose_by_coverage_type");
        selectionElementStepDefs.hover_over_element("saveandassignclaim.coverage_type_letter_l");
        clickDefs.click("saveandassignclaim.liability_vehicle_damage");
    }

    public String getXLSheetNameFromClass() {
        return this.getClass().getSimpleName().replaceAll("StepDefinitions", "").toLowerCase();
    }

    // new matter------------------------------------------------------
    @Then("^I add (\\d+) (plaintiff|defense) (?:attorneys?|law firms?) on the matter using (.+) data from (.+) (?:yaml|sheet|json)$")
    public void iAddAttorneysUsingNew_Attorney_DataFromNewAttorneyYaml(int Count, String counsel, String inputDataKey, String pageName) throws Throwable {
        for (int i = 1; i <= Count; i++) {
            validationDefs.iLandOnPage("newmatter");


//			if(counselType=="attorney" || counselType=="attorneys"){
//				counselType = "attorney";
//			} else if (counselType=="law firm" || counselType=="law firms"){
//				counselType = "law_firm";
//			}
            clickDefs.click("newmatter.add_" + inputDataKey);
            selectionElementStepDefs.hover_over_element("newmatter." + inputDataKey + "_new_legal");
            clickDefs.click("newmatter." + inputDataKey);

            validationDefs.iLandOnPage(pageName);
            String key = pagename + "." + inputDataKey + "_" + i;
            inputDefs.iFillDataFromYamlOntoThePage(key.toUpperCase(), pagename.toUpperCase());
        }
    }

    @Then("^I add (\\d+) citations? to the incident using (.+) data from (.+) (?:yaml|sheet|json)$")
    public void iAddCitationsUsingCitation_DataFromNewVehicleIncidentYaml(int Count, String inputDataKey, String pagename) throws Throwable {
        for (int i = 1; i <= Count; i++) {
            pagename = "New Vehicle Incident";
            pagename = pagename.replaceAll(" ", "");
            validationDefs.iLandOnPage(pagename);
            inputDefs.iFillDataFromYamlOntoThePage("CITATION", "NEWVEHICLEINCIDENT");
        }
    }

    @Then("^I add (\\d+) policy level coverages? using (.+) data from (.+) (?:yaml|sheet|json)$")
    public void iAddCoverageUsingPolicy_Coverage_DataFromSearchOrCreatePolicyYaml(int Count, String inputDataKey, String pagename) throws Throwable {
        for (int i = 1; i <= Count; i++) {
            inputDefs.iFillDataFromYamlOntoThePage(inputDataKey + "_" + i, pagename);
        }
    }



    @Then("^I add (\\d+) new insured persons? on the policy using (.+) data from (.+) (?:yaml|sheet|json)$")
    public void iAddInsuredPersonUsingNew_Person_DataFromNewPersonYaml(int Count, String inputDataKey, String pagename) throws Throwable {
        for (int i = 1; i <= Count; i++) {

            clickDefs.click("searchorcreatepolicy.add_insured");
            clickDefs.click("searchorcreatepolicy.add_new_person");
            validationDefs.iLandOnPage(pagename);
            inputDefs.iFillDataFromYamlOntoThePage(inputDataKey + "_" + i, pagename);
        }
    }

    @Then("^I add (\\d+) new vehicles? using (.+) data from (.+) (?:yaml|sheet|json)$")
    public void iAddNewVehiclesUsingNew_Vehicle_DataFromNewVehicleYaml(int Count, String inputDataKey, String pagename) throws Throwable {
        for (int i = 1; i <= Count; i++) {

            clickDefs.click("searchorcreatepolicy.add_vehicle");
            pagename = "New Vehicle";
            pagename = pagename.replaceAll(" ", "");
            validationDefs.iLandOnPage(pagename);
            inputDefs.iFillDataFromYamlOntoThePage(inputDataKey + "_" + i, pagename);
            pagename = "Search or Create Policy";
            pagename = pagename.replaceAll(" ", "");
            validationDefs.iLandOnPage(pagename);
        }
    }

    @Then("^I add (\\d+) reserves? on the claim using (.+) data from (.+) (?:yaml|sheet|json)$")
    public void iAddReservesUsingAdd_Reserve_DataFromReservesYaml(int Count, String inputDataKey, String pagename) throws Throwable {
        for (int i = 1; i <= Count; i++) {

            validationDefs.iLandOnPage(pagename);
            String key = pagename + "." + inputDataKey + "_" + i;
            inputDefs.iFillDataFromYamlOntoThePage(key.toUpperCase(), pagename.toUpperCase());
        }
    }

    @Then("^I add (\\d+) vehicles? using (.+) data from (.+) (?:yaml|sheet|json)$")
    public void iAddVehiclesUsingVehicle_info_nDataFromVehicleinfoSheet(int vehicleCount, String inputDataKey, String pagename) throws Throwable {
        for (int i = 1; i <= vehicleCount; i++) {
//            validationDefs.iLandOnPage("vehicles");
            clickDefs.click("vehicles.add_pa_vehicle");
            waitStepDefs.iWaitForAjaxCallToBeCompleted();
//            validationDefs.iLandOnPage(pagename);
            inputDefs.iFillDataFromYamlOntoThePage(inputDataKey + "_" + i, pagename);
        }
    }

    @Given("^I create a claim using ([^\\s]+) data$")
    public void iCreateAClaimUsingData(String inputDataKey) throws Throwable {
       inputDefs.enter_text("NewClaim", "general.goto_page");
        inputDefs.enter_key("ENTER", "general.goto_page");
        validationDefs.ele_enable("fnolsearchorcreatepolicy.enter_loss_date");
        inputDefs.iFillDataFromYamlOntoThePage(inputDataKey, "fnolsearchorcreatepolicy");
        clickDefs.click("fnolsearchorcreatepolicy.next");
        validationDefs.ele_enable("fnolselectvehicleinvolved.involved_vehicle_0");
        inputDefs.iFillDataFromYamlOntoThePage(inputDataKey, "fnolselectvehicleinvolved");
        validationDefs.ele_enable("fnolbasicinformation.relation_to_insured");
        inputDefs.iFillDataFromYamlOntoThePage(inputDataKey, "fnolbasicinformation");
        validationDefs.ele_enable("fnollossdetails.loss_location");
        inputDefs.iFillDataFromYamlOntoThePage(inputDataKey, "fnollossdetails");
        validationDefs.ele_enable("fnolvehicledetails.loss_party_insured");
        inputDefs.iFillDataFromYamlOntoThePage(inputDataKey, "fnolvehicledetails");
        validationDefs.ele_enable("fnollossdetails.loss_location");
        clickDefs.click("fnollossdetails.next");
        validationDefs.ele_enable("fnolservices.appraisal_checkbox");
        clickDefs.click("fnolservices.next");
        validationDefs.ele_enable("fnolassignment.claim_assign");
        clickDefs.click("fnolassignment.finish");
        validationDefs.ele_enable("fnolclaimsaved.view_created_claim");
        validationDefs.ele_display("fnolclaimsaved.view_created_claim");
    }

    // Fnol step definition ---------------------------------------------------
    @Given("^I initiate a new claim for existing policy number (.*)$")
    public void new_claim_existing_policy(String policy_num) throws Throwable {
        clickDefs.click("general.claim_tab_dropdown");
        clickDefs.click("general.new_claim");
       inputDefs.enter_text(policy_num, "searchorcreatepolicy.policy_number");
        inputDefs.iFillDataFromYamlOntoThePage("SEARCH_EXISTING_POLICY", "SEARCHORCREATEPOLICY");
        //fn.new_claim_existing_policy(policy_num);
    }

    // UnverifiedPolicy step definition ---------------------------------------------------
    @When("^I initiate a new claim for unverified policy number (.*) and (.*)$")
    public void new_claim_unverified_policy(String policy_num, String loss_date) throws Throwable {

        clickDefs.click("general.claim_tab_dropdown");
        clickDefs.click("general.new_claim");
        selectionElementStepDefs.select_radio_button("searchorcreatepolicy.create_unverified_policy_radio");
        selectionElementStepDefs.select_option_from_dropdown_by_text("Personal Auto", "searchorcreatepolicy.type");
        inputDefs.enter_text(policy_num, "searchorcreatepolicy.policy_number_unverified");
        inputDefs.enter_text(loss_date, "searchorcreatepolicy.loss_date");
    }

    @When("^I provide the details of the person who reported the claim$")
    public void reported_by_unverified() throws Throwable {
        pagename = "Basic Information";
        pagename = pagename.replaceAll(" ", "");
        validationDefs.iLandOnPage(pagename);
        inputDefs.iFillDataFromYamlOntoThePage("REPORTED_BY_UNVERIFIED", "BASICINFORMATION");
    }

    // search claim------------------------------------------------------
    @Given("^I search for existing claim number (.*)$")
    public void search_by_claim_number(String claim_num) throws Throwable {
        clickDefs.click("general.claim_tab_dropdown");
       inputDefs.enter_text(claim_num, "general.claim_search");
        clickDefs.click("general.search_icon");
    }

    @When("^I select a claimant$")
    public void select_claimant() throws Throwable {
        pagename = "New Exposure";
        pagename = pagename.replaceAll(" ", "");
        validationDefs.iLandOnPage(pagename);
        inputDefs.iFillDataFromYamlOntoThePage("NEW_EXPOSURE_CLAIMANT", "NEWEXPOSURE");
    }

    @When("^I add an underwriting organization on the policy$")
    public void underwriting_organization() throws Throwable {
        pagename = "Search or Create Policy";
        pagename = pagename.replaceAll(" ", "");
        validationDefs.iLandOnPage(pagename);
        selectionElementStepDefs.select_option_from_dropdown_by_text("Acme Insurance Parent Co.", "searchorcreatepolicy.organization");
        selectionElementStepDefs.select_option_from_dropdown_by_text("Acme Auto", "searchorcreatepolicy.group");
    }

    @When("^I add a new vehicle incident$")
    public void vehicle_incident() throws Throwable {
        pagename = "New Exposure";
        pagename = pagename.replaceAll(" ", "");
        validationDefs.iLandOnPage(pagename);
        inputDefs.iFillDataFromYamlOntoThePage("NEW_INCIDENT", "NEWEXPOSURE");
//		nvi.involved_vehicle();
//		nvi.driver_of_involved_vehicle();
//		nvi.loan_information();
//		nvi.add_citation();
//		nvi.damage_description();
//		nvi.accident_details();
//		nvi.collision_details();
//		nvi.theft_details();
    }
    // new reserves------------------------------------------------------

    @When("^I add a new vehicle incident on the exposure$")
    public void vehicle_incident_exposure() throws Throwable {
        pagename = "New Exposure Vehicle";
        pagename = pagename.replaceAll(" ", "");
        validationDefs.iLandOnPage(pagename);
        inputDefs.iFillDataFromYamlOntoThePage("NEW_INCIDENT", "NEWEXPOSUREVEHICLE");
//		nvi.involved_vehicle();
//		nvi.driver_of_involved_vehicle();
//		nvi.loan_information();
//		nvi.add_citation();
//		nvi.damage_description();
//		nvi.accident_details();
//		nvi.collision_details();
//		nvi.theft_details();
    }

    @Then("^I verify that the claim is saved$")
    public void verify_claim() throws Throwable {
        pagename = "New Claim Saved";
        pagename = pagename.replaceAll(" ", "");
        validationDefs.iLandOnPage(pagename);
        clickDefs.click("newclaimsaved.view_newly_saved_claim");
        //predef.wait(3);
        //inputDefs.iFillDataFromYamlOntoThePage("PERSONAL_AUTO", "NEWCLAIMSAVED");
        //fn.verify_claim();
    }

    @When("^I verify that a new exposure is added$")
    public void verify_exposure_added() throws Throwable {
        pagename = "Save and Assign Claim";
        pagename = pagename.replaceAll(" ", "");
        validationDefs.iLandOnPage(pagename);
        clickDefs.click("saveandassignclaim.exposure1");
        pagename = "Exposure Detail";
        pagename = pagename.replaceAll(" ", "");
        validationDefs.iLandOnPage(pagename);
        inputDefs.iFillDataFromYamlOntoThePage("EXPOSURE_DETAIL", "NEWEXPOSURE");
    }

}