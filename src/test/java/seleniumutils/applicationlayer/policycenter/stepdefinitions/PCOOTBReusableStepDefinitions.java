package seleniumutils.applicationlayer.policycenter.stepdefinitions;

import baseinitializers.StepImplementationBase;
import env.DriverUtil;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import stepimplementation.*;

import java.util.HashMap;


public class PCOOTBReusableStepDefinitions extends StepImplementationBase {
    public PCOOTBReusableStepDefinitions(DriverUtil driverUtil) {
        super(driverUtil);
        this.driverUtil = driverUtil;
    }
    private final String comp_cnt_name = "contacts.comp_verify_name";
    // transaction -----------------------------------------------------------
    String access_new_submission = "mysummary.search_bar";
    HashMap<String, String> cancel_info = new HashMap<String, String>();
    private final String contact_name = "contacts.contact_name";
    private final String create_company = "contacts.create_company";
    private final String create_person = "contacts.create_person";
    private final String expand_company = "contacts.expand_company";
    private final String expand_element = "contacts.expand_contact";
    private final String person_cnt_fname = "contacts.person_verify_fname";
    private final String person_cnt_lname = "contacts.person_verify_lname";
    private final String person_first_name = "contacts.person_first_name";
    private final String person_last_name = "contacts.person_last_name";
    private final String policy_expand = "policysearch.policy_expand";
    private final String policy_number = "policysearch.policy_number";
    private final String policy_search = "policysearch.policy_search";
    private final String search_account_state = "account.search_company_state";
    private final String search_contact_state = "contacts.search_contact_state";

    String policy_type;
    ClickElementStepDefs clickDefs = new ClickElementStepDefs(driverUtil);
    InputElementStepDefs inputDefs = new InputElementStepDefs(driverUtil);
    NavigationStepDefs navigationDefs = new NavigationStepDefs(driverUtil);
    SelectionElementStepDefs selectionElementStepDefs = new SelectionElementStepDefs(driverUtil);
    ValidationStepDefs validationDefs = new ValidationStepDefs(driverUtil);
    WaitStepDefs waitStepDefs = new WaitStepDefs(driverUtil);


    HashMap<String, String> ptype = new HashMap<String, String>();
    HashMap<String, String> reinstate_info = new HashMap<String, String>();


    // Account ---------------------------------------------------
    String search_btn = "contacts.search_btn";
    String search_element = "contacts.search_link";
    String search_tbl = "contacts.table_contact_name";
    String select_contact = "contacts.select_contact_type";
    String transaction_type;


    @Then("^I add (\\d+) drivers? using (.+) data from (.+) (?:yaml|sheet|json)$")
    public void iAddDriversUsingDriver_info_nDataFromDriverinfoSheet(int driverCount, String inputDataKey, String pagename) throws Throwable {
        for (int i = 1; i <= driverCount; i++) {
            validationDefs.iLandOnPage("drivers");
            validationDefs.ele_enable("drivers.paquote");
            clickDefs.click("drivers.add_pa_driver");
            clickDefs.click("drivers.add_new_person");
            validationDefs.iLandOnPage("newdriver");
            inputDefs.iFillDataFromYamlOntoThePage(inputDataKey + "_" + i, pagename);
            clickDefs.click("newdriver.driver_ok");
            validationDefs.ele_enable("drivers.paquote");
            validationDefs.iLandOnPage("drivers");
        }
    }

    @When("^I access account information page to search for a matching (.*)$")
    public void access_acct_page(String account) throws Throwable {
        clickDefs.click("account.expand_account");
        clickDefs.click("account.search_account_link");
    }


    // Contact ---------------------------------------------------

    @When("^I access new contact page to create a (.*) contact$")
    public void access_new_contact(String contact_type) throws Throwable {
        clickDefs.click(expand_element);
        selectionElementStepDefs.hover_over_element(expand_company);
        contact_type = contact_type.substring(1, contact_type.length() - 1);
        if (contact_type.equalsIgnoreCase("Company")) {
            clickDefs.click(create_company);
        } else {
            clickDefs.click(create_person);
        }
    }

    @When("^I confirm policy cancellation$")
    public void confirm_cancellation() throws Throwable {
        validationDefs.ele_enable("cancelpolicy.bind_options");
        clickDefs.click("cancelpolicy.bind_options");
        clickDefs.click("cancelpolicy.cancel_now_label");
        waitStepDefs.wait("2");
        navigationDefs.handle_alert();
    }

    @When("^I select the option (.*) on clicking Create New Account and fill in account details$")
    public void fill_in_acct_info(String contact_type) throws Throwable {
        contact_type = contact_type.substring(1, contact_type.length() - 1);
        if (contact_type.equalsIgnoreCase("Company")) {
            clickDefs.click("account.company_label");
            inputDefs.iFillDataFromYamlOntoThePage("CREATE_COMPANY_ACCOUNT", "ACCOUNT");
        } else {
            clickDefs.click("account.person_acct_label");
            inputDefs.iFillDataFromYamlOntoThePage("CREATE_PERSON_ACCT", "ACCOUNT");

        }
    }

    @When("^I enter all the (.*) contact information to create a new contact$")
    public void fill_in_cnt_info(String contact_type) throws Throwable {
        contact_type = contact_type.substring(1, contact_type.length() - 1);
        if (contact_type.equalsIgnoreCase("Company")) {
            inputDefs.iFillDataFromYamlOntoThePage("CREATE_COMPANY_CONTACT", "CONTACTS");
        } else {
            inputDefs.iFillDataFromYamlOntoThePage("CREATE_PERSON_CONTACT", "CONTACTS");
        }
    }

    public String getXLSheetNameFromClass() {
        return this.getClass().getSimpleName().replaceAll("StepDefinitions", "").toLowerCase();
    }

    public String get_policy_type() {
        return policy_type;
    }

    public void set_policy_type(String ptype) {
        policy_type = ptype;
    }

    public String get_transaction_type() {
        return transaction_type;
    }

    public void set_transaction_type(String trans_type) {
        transaction_type = trans_type;
    }

    @Then("^I add drivers using (.+) data from (.+) sheet$")
    public void iAddDriversUsingAnyKeyFromDriverinfoSheet(String inputDataKey, String sheetname) throws Throwable {
        String[] drivers = inputDataKey.trim().split(",");
        for (String s : drivers) {
            validationDefs.ele_enable("drivers.quote");
            validationDefs.iLandOnPage("drivers");
            clickDefs.click("drivers.add_driver");
            validationDefs.ele_enable("driverinfo.driver_lastname");
            validationDefs.iLandOnPage(sheetname);
            inputDefs.iFillDataFromYamlOntoThePage(s, sheetname);
            validationDefs.ele_enable("drivers.quote");
            validationDefs.iLandOnPage("drivers");
        }
    }

    @Then("^I add vehicles using (.+) data from (.+) sheet$")
    public void iAddVehiclesUsingAnyKeyInVehicleinfoSheet(String inputDataKey, String sheetname) throws Throwable {
        String[] vehicles = inputDataKey.trim().split(",");
        for (String vehicle : vehicles) {
            validationDefs.ele_enable("vehicles.quote");
            validationDefs.iLandOnPage("vehicles");
            clickDefs.click("vehicles.add_vehicle");
            validationDefs.ele_enable("vehicleinfo.vehicle_vin");
            validationDefs.iLandOnPage(sheetname);
            inputDefs.iFillDataFromYamlOntoThePage(vehicle, sheetname);
            validationDefs.ele_enable("vehicles.quote");
            validationDefs.iLandOnPage("vehicles");
        }
    }

    @Given("^I create a policy using ([^\\s]+) data$")
    public void iCreateAPolicyUsingHappy_pathData(String inputDataKey) throws Throwable {
        this.iSearchForInTheSearchBar("NewSubmission", "mysummary.search_bar");
        validationDefs.ele_enable("newsubmissions.producer_organization");
        validationDefs.iLandOnPage("newsubmissions");
        inputDefs.iFillDataFromYamlOntoThePage(inputDataKey, "newsubmissions");
        validationDefs.ele_enable("offerings.quote");
        validationDefs.iLandOnPage("offerings");
        inputDefs.iFillDataFromYamlOntoThePage(inputDataKey, "Offerings");
        validationDefs.ele_enable("qualification.quote");
        validationDefs.iLandOnPage("qualification");
        inputDefs.iFillDataFromYamlOntoThePage(inputDataKey, "qualification");
        validationDefs.ele_enable("policyinfo.quote");
        validationDefs.iLandOnPage("policyinfo");
        inputDefs.iFillDataFromYamlOntoThePage(inputDataKey, "policyinfo");
        validationDefs.ele_enable("policylinedetails.quote");
        validationDefs.iLandOnPage("policylinedetails");
        inputDefs.iFillDataFromYamlOntoThePage(inputDataKey, "policylinedetails");
        validationDefs.ele_enable("locations.quote");
        validationDefs.iLandOnPage("locations");
        inputDefs.iFillDataFromYamlOntoThePage(inputDataKey, "locations");
        validationDefs.ele_enable("vehicles.quote");
        validationDefs.iLandOnPage("vehicles");
        inputDefs.iFillDataFromYamlOntoThePage(inputDataKey, "vehicles");
        validationDefs.ele_enable("vehicleinfo.vehicle_vin");
        validationDefs.iLandOnPage("vehicleinfo");
        inputDefs.iFillDataFromYamlOntoThePage(inputDataKey, "vehicleinfo");
        validationDefs.ele_enable("vehicles.quote");
        validationDefs.iLandOnPage("vehicles");
        clickDefs.click("vehicles.next");
        validationDefs.ele_enable("stateinfo.quote");
        validationDefs.iLandOnPage("stateinfo");
        clickDefs.click("stateinfo.next");
        validationDefs.ele_enable("drivers.quote");
        validationDefs.iLandOnPage("drivers");
        inputDefs.iFillDataFromYamlOntoThePage(inputDataKey, "drivers");
        validationDefs.ele_enable("driverinfo.driver_lastname");
        validationDefs.iLandOnPage("driverinfo");
        inputDefs.iFillDataFromYamlOntoThePage(inputDataKey, "driverinfo");
        validationDefs.ele_enable("drivers.quote");
        validationDefs.iLandOnPage("drivers");
        clickDefs.click("drivers.next");
        validationDefs.ele_enable("coveredvehicles.quote");
        validationDefs.iLandOnPage("coveredvehicles");
        inputDefs.iFillDataFromYamlOntoThePage(inputDataKey, "coveredvehicles");
        validationDefs.ele_enable("modifiers.quote");
        validationDefs.iLandOnPage("modifiers");
        inputDefs.iFillDataFromYamlOntoThePage(inputDataKey, "modifiers");
        validationDefs.ele_enable("riskanalysis.quote");
        validationDefs.iLandOnPage("riskanalysis");
        inputDefs.iFillDataFromYamlOntoThePage(inputDataKey, "riskanalysis");
        validationDefs.ele_enable("policyreview.quote");
        validationDefs.iLandOnPage("policyreview");

        clickDefs.click("submissionwizard.line_setup");
        clickDefs.click("submissionwizard.policy_review");

        clickDefs.click("policyreview.quote");
        validationDefs.ele_enable("quote.print_quote");
        validationDefs.iLandOnPage("quote");
        inputDefs.iFillDataFromYamlOntoThePage(inputDataKey, "quote");
        validationDefs.ele_enable("forms.bind_options");
        validationDefs.iLandOnPage("forms");
        inputDefs.iFillDataFromYamlOntoThePage(inputDataKey, "forms");
        validationDefs.ele_enable("payment.bind_options");
        validationDefs.iLandOnPage("payment");
        inputDefs.iFillDataFromYamlOntoThePage(inputDataKey, "payment");
        waitStepDefs.wait("2");
        navigationDefs.handle_alert();
        validationDefs.ele_enable("submissionbound.view_policy");
        validationDefs.iLandOnPage("submissionbound");
        //   predef.iGetElementTextAndWriteToFile("submissionbound.policy_number", "output", "commercial_auto");

    }

    @When("^I search for \"([^\"]*)\" in the (.*) text box$")
    public void iSearchForInTheSearchBar(String searchString, String searchBar) throws Throwable {
        validationDefs.ele_enable(searchBar);
        inputDefs.enter_text(searchString, searchBar);
        Thread.sleep(500);
        inputDefs.enter_key("ENTER", searchBar);
    }

    @Given("^I navigate to policycenter with (.+) login$")
    public void iNavigateToPolicycenterAsSuper_user(String user) throws Throwable {
        navigationDefs.navigate_toURL("policycenter.login_page");
        inputDefs.iFillDataFromYamlOntoThePage(user, "policycenter");
    }

    @Given("^I fill \"([^\"]*)\" into input field (.+)")
    public void iSearchForInTheInformationBar(String text, String element) throws Throwable {
        inputDefs.enter_text(text, element);
        inputDefs.enter_key("TAB", element);
        inputDefs.enter_key("TAB", element);
    }

    @When("^I initiate policy cancellation by pressing Start Cancellation Widget$")
    public void initiate_cancellation() throws Throwable {
        clickDefs.click("cancelpolicy.start_cancellation");
        validationDefs.ele_enable("cancelpolicy.bind_options");
    }

    @When("^I enter the policy effective and description to initiate (.*) transaction$")
    public void initiate_policy_change(String transaction_type) throws Throwable {
        transaction_type = transaction_type.substring(1, transaction_type.length() - 1);
        if (transaction_type.equalsIgnoreCase("New Submission")) {
        } else {
            validationDefs.ele_enable("changepolicy.policy_change_next");
            validationDefs.iLandOnPage("changepolicy");
            inputDefs.iFillDataFromYamlOntoThePage("INITIAL_POLICY_CHANGE", "CHANGEPOLICY");
        }
    }


    // Policy Cancel ---------------------------------------------------

    @When("^I verify the ([^ ]+)( from memory)? is (.*) successfully$")
    public void readPolicyAndVerifyCancel(String dataKey, String source, String transaction) throws Throwable {
        transaction = transaction.substring(1, transaction.length() - 1);
        String policyNumber;
        if (source == null) {
            dataKey = dataKey.substring(dataKey.lastIndexOf(".") + 1);
            policyNumber = inputDefs.getDataFromFile(dataKey, null);
        } else {
            policyNumber = inputDefs.iRetrieveDataFromMemory(dataKey);
        }
        if (transaction.equalsIgnoreCase("cancelled")) {
            validationDefs.ele_enable("cancelpolicy.verify_cancel_bound");
            validationDefs.iLandOnPage("cancelpolicy");
            clickDefs.click(policy_expand);
            inputDefs.enter_text(policyNumber, policy_number);
            clickDefs.click(policy_search);
            validationDefs.ele_enable("cancelpolicy.cancel_confirmation");
            validationDefs.check_element_text("cancelpolicy.cancel_number", cancel_info.get("cancel_number"));
            validationDefs.check_element_text("cancelpolicy.cancel_status", "Cancellation");
        } else if (transaction.equalsIgnoreCase("reinstated")) {
            validationDefs.ele_enable("reinstatepolicy.verify_reinstate_bound");
            validationDefs.iLandOnPage("reinstatepolicy");
            clickDefs.click(policy_expand);
            inputDefs.enter_text(policyNumber, policy_number);
            clickDefs.click(policy_search);
            validationDefs.ele_enable("reinstatepolicy.reinstate_confirmation");
            validationDefs.check_element_text("reinstatepolicy.reinstate_number", reinstate_info.get("reinstate_number"));
            validationDefs.check_element_text("reinstatepolicy.reinstate_status", "Reinstatement");
        } else {
            validationDefs.ele_enable("cancelpolicy.verify_cancel_bound");
            validationDefs.iLandOnPage("cancelpolicy");
            clickDefs.click(policy_expand);
            inputDefs.enter_text(policyNumber, policy_number);
            clickDefs.click(policy_search);
            validationDefs.ele_enable("cancelpolicy.cancel_confirmation");
            validationDefs.check_element_text("cancelpolicy.cancel_status", "Cancellation");
            validationDefs.check_element_text("cancelpolicy.cancel_number", cancel_info.get("cancel_number"));
        }
    }

    @When("^I read (.*) policy from (.*) file$")
    public void read_policy(String dataKey, String fileName) throws Throwable {
        clickDefs.click(policy_expand);
        String policy_num = inputDefs.getDataFromFile(dataKey, fileName);
        inputDefs.enter_text(policy_num, policy_number);
        clickDefs.click(policy_search);
    }

    @When("^I read (.*) policy from memory")
    public void read_policy_from_memory(String dataKey) throws Throwable {
        clickDefs.click(policy_expand);
        String policy_num = inputDefs.iRetrieveDataFromMemory(dataKey);
        inputDefs.enter_text(policy_num, policy_number);
        clickDefs.click(policy_search);
    }

    @When("^I review the policy premium and cost change information for (.*) policy$")
    public void review_cancellation_info(String transaction) throws Throwable {
        transaction = transaction.substring(1, transaction.length() - 1);
        String cancel_number;
        if (transaction.equalsIgnoreCase("cancelled")) {
            validationDefs.ele_enable("cancelpolicy.cancel_quoted");
            clickDefs.click("cancelpolicy.cost_change_detail");
            cancel_number = validationDefs.getText("cancelpolicy.cancel_quoted_number").split(" ")[1];
            cancel_info.put("cancel_number", cancel_number);
        } else {
            String reinstate_number;
            validationDefs.ele_enable("reinstatepolicy.reinstate");
            clickDefs.click("reinstatepolicy.reinstate_cost_detail");
            reinstate_number = validationDefs.getText("reinstatepolicy.reinstate_quoted_number").split(" ")[1];
            reinstate_info.put("reinstate_number", reinstate_number);
        }
    }

    @Then("^I schedule policy cancellation$")
    public void schedule_cancellation() throws Throwable {
        clickDefs.click("cancelpolicy.bind_options");
        clickDefs.click("cancelpolicy.schedule_cancel_now_label");
        waitStepDefs.wait("2");
        navigationDefs.handle_alert();
    }

    @When("^I search for a (.*) account having name (.*)$")
    public void search_account(String contact_type, String contact_name) throws Throwable {
        contact_type = contact_type.substring(1, contact_type.length() - 1);
        if (contact_type.equalsIgnoreCase("Company")) {
            inputDefs.enter_text(contact_name, "account.company_name");
            selectionElementStepDefs.select_option_from_dropdown_by_text("Georgia", search_account_state);
            clickDefs.click("account.search_btn");
        } else {
            inputDefs.enter_text(contact_name.split(" ")[0], "account.person_fname");
            inputDefs.enter_text(contact_name.split(" ")[1], "account.person_lname");
            clickDefs.click("account.search_btn");
        }
    }

    @When("^I search for a (.*) contact having name as (.*)$")
    public void search_contact(String contact_type, String company_name) throws Throwable {
        clickDefs.click(expand_element);
        clickDefs.click(search_element);
        contact_type = contact_type.substring(1, contact_type.length() - 1);
        if (contact_type.equalsIgnoreCase("Company")) {
            selectionElementStepDefs.select_option_from_dropdown_by_text(contact_type, select_contact);
            inputDefs.enter_text(company_name, contact_name);
            selectionElementStepDefs.select_option_from_dropdown_by_text("Georgia", search_contact_state);
            clickDefs.click(search_btn);
        } else {
            selectionElementStepDefs.select_option_from_dropdown_by_text(contact_type, select_contact);
            inputDefs.enter_text(company_name.split(" ")[0], person_first_name);
            inputDefs.enter_text(company_name.split(" ")[1], person_last_name);
            clickDefs.click(search_btn);
        }
    }

    @When("^I search for (.*) policy having (.*)$")
    public void search_policy(String policy_type, String policy_num) throws Throwable {
        clickDefs.click(policy_expand);
        policy_type = policy_type.substring(1, policy_type.length() - 1);
        if (policy_type.equalsIgnoreCase("Personal Auto")) {
            inputDefs.enter_text(policy_num, policy_number);
            clickDefs.click(policy_search);
        } else {
            inputDefs.enter_text(policy_num, policy_number);
            clickDefs.click(policy_search);
        }
    }

    @When("^I select the cancellation source and (.*) reason for cancellation$")
    public void select_cancellation_reason(String reason) throws Throwable {
        inputDefs.iFillDataFromYamlOntoThePage("SELECT_CANCEL_REASON", "CANCELPOLICY");
    }

    @When("^I select a (.*) transaction for (.*) product on a (.*)$")
    public void select_policy_type(String transaction_type, String policy_type, String contact_type) throws Throwable {
        transaction_type = transaction_type.substring(1, transaction_type.length() - 1);
        policy_type = policy_type.substring(1, policy_type.length() - 1);
        ptype.put("type", policy_type);
        set_policy_type(policy_type);
        set_transaction_type(transaction_type);
        select_transaction(policy_type, transaction_type);
    }

    public void select_transaction(String policy_type, String transaction_type) throws Throwable {
        if (policy_type.equalsIgnoreCase("Personal Auto") && transaction_type.equalsIgnoreCase("New Submission")) {
            inputDefs.enter_text(transaction_type, access_new_submission);
            inputDefs.enter_key("ENTER", access_new_submission);
            inputDefs.iFillDataFromYamlOntoThePage("PA_HAPPY_PATH", "NEWSUBMISSIONS");
        } else if (policy_type.equalsIgnoreCase("Commercial Auto") && transaction_type.equalsIgnoreCase("New Submission")) {
            inputDefs.enter_text(transaction_type, access_new_submission);
            inputDefs.enter_key("ENTER", access_new_submission);
            inputDefs.iFillDataFromYamlOntoThePage("HAPPY_PATH", "NEWSUBMISSIONS");
        } else if (transaction_type.equalsIgnoreCase("Policy Change")) {
            validationDefs.ele_enable("changepolicy.change_policy");
            inputDefs.iFillDataFromYamlOntoThePage("HAPPY_PATH", "CHANGEPOLICY");
        } else if (transaction_type.equalsIgnoreCase("Cancel Policy")) {
            validationDefs.ele_enable("changepolicy.change_policy");
            inputDefs.iFillDataFromYamlOntoThePage("HAPPY_PATH", "CANCELPOLICY");
        } else if (transaction_type.equalsIgnoreCase("Reinstate Policy")) {
            validationDefs.ele_enable("reinstatepolicy.reinstate_policy");
            inputDefs.iFillDataFromYamlOntoThePage("HAPPY_PATH", "REINSTATEPOLICY");
        }
    }

    @Then("^I should see the (.*) displayed correctly on searching (.*) account$")
    public void verify_account(String contact_name, String contact_type) throws Throwable {
        String element = "account.table_comp_acct_name";
        validationDefs.ele_enable(element);
        validationDefs.check_element_text(element, contact_name);
    }

    @Then("^I should have a (.*) search option to create an (.*)")
    public void verify_acct_creation(String contact_type, String contact_name) throws Throwable {
        contact_type = contact_type.substring(1, contact_type.length() - 1);
        if (contact_type.equalsIgnoreCase("Company")) {
            inputDefs.enter_text(contact_name, "account.company_name");
            clickDefs.click("account.search_btn");
            clickDefs.click("account.expand_acct_btn");
            validationDefs.ele_enable("account.company_label");
        } else {
            inputDefs.enter_text(contact_name.split(" ")[0], "account.person_fname");
            inputDefs.enter_text(contact_name.split(" ")[1], "account.person_lname");
            clickDefs.click("account.search_btn");
            clickDefs.click("account.expand_acct_btn");
            validationDefs.ele_enable("account.person_acct_label");
        }
    }

    @Then("^A new (.*) is created successfully")
    public void verify_acct_creation(String acct_name) throws Throwable {
        //      predef.check_element_has_text("account.acct_name", acct_name);
        validationDefs.check_element_text("account.acct_name", acct_name);
    }

    // Policy Change ---------------------------------------------------

    @When("^I verify the (.*) policy of policy type (.*) is (.*) successfully$")
    public void verify_cancellation(String policyNumber, String pol_type, String transaction) throws Throwable {
        pol_type = pol_type.substring(1, pol_type.length() - 1);
        transaction = transaction.substring(1, transaction.length() - 1);
        if (transaction.equalsIgnoreCase("cancelled")) {
            validationDefs.ele_enable("cancelpolicy.verify_cancel_bound");
            validationDefs.iLandOnPage("cancelpolicy");
            clickDefs.click(policy_expand);
            inputDefs.enter_text(policyNumber, policy_number);
            clickDefs.click(policy_search);
            validationDefs.ele_enable("cancelpolicy.cancel_confirmation");
            validationDefs.check_element_text("cancelpolicy.cancel_number", cancel_info.get("cancel_number"));
            validationDefs.check_element_text("cancelpolicy.cancel_status", "Cancellation");
        } else if (transaction.equalsIgnoreCase("reinstated")) {
            validationDefs.ele_enable("reinstatepolicy.verify_reinstate_bound");
            validationDefs.iLandOnPage("reinstatepolicy");
            clickDefs.click(policy_expand);
            inputDefs.enter_text(policyNumber, policy_number);
            clickDefs.click(policy_search);
            validationDefs.ele_enable("reinstatepolicy.reinstate_confirmation");
            validationDefs.check_element_text("reinstatepolicy.reinstate_number", reinstate_info.get("reinstate_number"));
            validationDefs.check_element_text("reinstatepolicy.reinstate_status", "Reinstatement");
        } else {
            validationDefs.ele_enable("cancelpolicy.verify_cancel_bound");
            validationDefs.iLandOnPage("cancelpolicy");
            clickDefs.click(policy_expand);
            inputDefs.enter_text(policyNumber, policy_number);
            clickDefs.click(policy_search);
            validationDefs.ele_enable("cancelpolicy.cancel_confirmation");
            validationDefs.check_element_text("cancelpolicy.cancel_status", "Cancellation");
            validationDefs.check_element_text("cancelpolicy.cancel_number", cancel_info.get("cancel_number"));
        }
    }

}