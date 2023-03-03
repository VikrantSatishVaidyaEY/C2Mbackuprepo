Feature: Afinis2


#Bank Contacts API
  Scenario Outline: Validate G2M findbyBankIDAndReason API
    Given I want to test the "findByBankIdAndReason" webservice
    When url 'https://api.afinis.org/v1/banks/<bankId>/contact?reason=<contactReason>&apikey=' + APIKEY
    When I use "GET" method with bank id as <bankId> and contact reason as <contactReason>
    Then I validate <statusCode> status code
    Then I Validate customer details <name> <phoneNumber> and <email>
    And Print the response
    Examples:
    |bankId   |contactReason|name            |phoneNumber   |email                     |statusCode|
    |061103852| ACH_FRAUD   |'John Q. Public'|'555-123-5678'|'John.Public@TestBank.com'| 200      |
    |061103853| ACH_FRAUD   |null            |null          | null                     | 404      |
    |061103852|  WIRE_FRAUD |null            |null          |null                      | 400      |





    # ACH Credit Payment Initiation API
  Scenario Outline: G2M Service ACH Payments Initiation Credit API
    Given I want to test the "AFINIS_INITIATE_PAYMENT_CREDIT" webservice
    And Read request from ACH_Payment_Initiation_Credit_Req.json file
    And Add request header Content-Type with value 'application/json'
    When I use "POST" method
    Then I validate <statusCode> status code
    Then I validate error code equals <errorCode>
    And Print the response
  Examples:
    |creditorAccountIdentification |errorCode|statusCode|
    |        '2345678911'          |  null   | 200  |
    |                              |["2001"] | 400  |

# ACH Debit Payment Initiation API

  Scenario Outline: G2M Service ACH Payments Initiation Debit API
    Given I want to test the "AFINIS_INITIATE_PAYMENT_DEBIT" webservice
    And Read request from ACH_Payment_Initiation_Debit_Req.json file
    And Add request header Content-Type with value 'application/json'
    When I use "POST" method
    Then I validate <statusCode> status code
    Then I validate error code equals <errorCode>
    And Print the response
    Examples:
      |debitAccountIdentification |errorCode|statusCode|
      |        '1111111122'          |  null   | 200  |
      |                              |["2001"] | 400  |


#Real Time Billing Account Validation
  Scenario Outline: G2M Real Time Billing Account Validation  API
    Given I want to test the "REAL_TIME_BILLING_ACCOUNT_VALIDATION" webservice
    And request
    """
    {
    "creditor": {
        "name": "<name>",
        "postalAddress": {
            "streetName": "<streetName>",
            "postCode": "<postCode>",
            "townName": "<townName>",
            "countrySubDivision": "<countrySubDivison>",
            "country": "US"
        }
    },
    "debtor": {
    	"schemeName": "CUST",
        "identification": "<identification>"
    }
}
    """
    And Add request header Content-Type with value 'application/json'
    When I use "POST" method
    Then I validate 200 status code
    Then I validate account status equals <accountStatus> and reason equals <reason>
    And Print the response
    Examples:
    |name               |streetName        |postCode|townName     |countrySubDivison|identification|accountStatus|reason|
    |Horizon            |1010 Fairview Way |54321   |Lovely Vista |      CA         | H35799010    |     'Valid' | null |
    |Sun Studio Internet|5656 Recording Way|33445   |Rocking      |      TN         | GOLD867980   |   'Invalid' |'AC04'|
    |Horizon            |1010 Fairview Way |54321   |Lovely Vista |      CA         | H6785901     |  'Invalid'  |'BE01'|
    |Sun Studio Internet|5656 Recording Way|33445   |Rocking      |      TN         | MOLD67487352 |   'Invalid' |'AC01'|
    |Sun Studio Internet|5656 Recording Way|33445   |Rocking      |      TN         | GOLD5867490  |   'Invalid' |'AC06'|
    |Horizon            |PO Box 12345      |54321   |Lovely Vista |      CA         | H6785901     |  'Invalid'  |'BE04'|
    |Horizon            |1010 Fairview Way |54321   |Lovely Vista |      CA         | H45577668    |   'Invalid' |'NARR'|



#Credit Account Validation csv file
@karate
  Scenario Outline: G2M Service Credit Account Validation  API with csv file
    Given I want to test the "AFINIS_POST_CREDIT_ACCOUNT_VALIDATION" webservice
    And Add request header Content-Type with value 'application/json'
    And request
    """
    {
      "creditorAccount": {
      "identification": "<accountNumber>"
    },
      "creditorAgent": {
      "memberIdentification": "<memeberIdentification>",
      "clearingSystemIdentification": "United States Routing Number"
    },
  "cashAccountType": "<accountType>"
  }
    """
    When I use "POST" method
    Then I validate <statusCode> status code
    Then I validate account status equals <accountStatus>
    Then print response
    Examples:
    |read(karate.properties['user.dir'] + '/src/test/resources/APITests/data/CreditAccountValidationData.csv')|


#Credit Account Validation

  Scenario Outline: G2M Service Credit Account Validation
    Given I want to test the "AFINIS_POST_CREDIT_ACCOUNT_VALIDATION" webservice
    And Add request header Content-Type with value 'application/json'
    And request
    """
    {
      "creditorAccount": {
      "identification": "<accountNumber>"
    },
      "creditorAgent": {
      "memberIdentification": "<memeberIdentification>",
      "clearingSystemIdentification": "United States Routing Number"
    },
  "cashAccountType": "<accountType>"
  }
    """
    When I use "POST" method
    Then I validate <statusCode> status code
    Then I validate account status equals <accountStatus>
    Then print response
    Examples:
      |memeberIdentification|accountType|accountNumber|statusCode|accountStatus|
      |       061103852     |Current    |11101011     | 200      |'Enabled'    |
      |       061103852     |Current    |11101013     | 200      |'Enabled'    |
      |       061103852     |Current    |11101015     | 200      |'Enabled'    |
      |       061103852     |Savings    |11101016     | 200      |'Enabled'    |
      |       061103852     |Current    |11101017     | 200      |'Disabled'   |
      |       061103852     |Savings    |11101019     | 404      |null         |



  #Debit Transaction Status APIs by Transaction Id and Instruction Id

 Scenario Outline: G2M Service Get Transaction Status by Transaction Id and Instruction Id API
    Given url 'https://api.afinis.org/v1/payments/ach/status/<transactionStatusFilter>/<id>?apikey=' + APIKEY
    When I use "GET" method
    Then I validate <statusCode> status code
    Then I validate status equals <transactionStatus>
    Then print response
   Examples:
   |transactionStatusFilter|id             |transactionStatus|statusCode|
   |transactionId          |061058945234561| 'RCVD'          |  200     |
   |transactionId          |061058945234562| 'PDNG'          |  200     |
   |transactionId          |061058945234563| 'ACSP'          |  200     |
   |transactionId          |061058945234564| 'OHLD'          |  200     |
   |transactionId          |061058945234565| 'FAIL'          |  200     |
   |transactionId          |061058945234567| 'FAIL'          |  200     |
   |transactionId          |061058942234562| 'RJCT'          |  200     |
   |transactionId          |061058942234563| 'ACWC'          |  200     |
   |instructionId          |5234561        | 'RCVD'          |  200     |
   |instructionId          |5234562        | 'PDNG'          |  200     |
   |instructionId          |5234563        | 'ACSP'          |  200     |
   |instructionId          |5234564        | 'OHLD'          |  200     |
   |instructionId          |5234565        | 'FAIL'          |  200     |
   |instructionId          |2234562        | 'RJCT'          |  200     |
   |instructionId          |2234563        | 'ACWC'          |  200     |




























 #Credit and Debit Account Validation

  Scenario: G2M Service Credit Account Validation  API
    Given I want to test the "AFINIS_POST_CREDIT_ACCOUNT_VALIDATION" webservice
    And Add request header Content-Type with value 'application/json'
    And request
    """
    {
      "creditorAccount": {
      "identification": "11101015"
    },
      "creditorAgent": {
      "memberIdentification": "061103852",
      "clearingSystemIdentification": "United States Routing Number"
    },
  "cashAccountType": "Current"
  }
    """
    When I use "POST" method
    Then I validate 200 status code
    And Print the response


  Scenario: G2M Service Debit Account Validation  API
    Given I want to test the "AFINIS_POST_DEBIT_ACCOUNT_VALIDATION" webservice
    And Add request header Content-Type with value 'application/json'
    And request
    """
  {
    "debtorAccount": {
    "identification": "11101012"
    },
    "debtorAgent": {
    "memberIdentification": "061103852",
    "clearingSystemIdentification": "United States Routing Number"
    },
  "cashAccountType": "Savings"
  }
    """
    When I use "POST" method
    Then I validate 200 status code
    And Print the response



#Orcestration
  Scenario: Initiate Credit Payment and validate status
    Given I want to test the "AFINIS_INITIATE_PAYMENT_CREDIT" webservice
    And Read request from ACH_Payment_Initiation_Credit_Req.json file
    And Add request header Content-Type with value 'application/json'
    When I use "POST" method
    Then I validate 200 status code
    And Print the response
    Given I want to test the "AFINIS_GET_TRANSACTION_STATUS_INSTRUCTION_ID" webservice
    When I use "GET" method
    Then I validate 200 status code
    And Print the response





 # ACH Payment Initiation API

  Scenario: Validate G2M Service ACH Payments Initiation Credit API
    Given I want to test the "AFINIS_INITIATE_PAYMENT_CREDIT" webservice
    And Read request from ACH_Payment_Initiation_Credit_Req.json file
    And Add request header Content-Type with value 'application/json'
    When I use "POST" method
    Then I validate 200 status code
    And Print the response








   # Given url 'https://api.asig.org/v1/payments/ach/credit/status?apikey=X6H7FQ8vJb4gZPtkx27E11sYd7EBQTst'
     # used to override default setting
    #* configure charset = null
    #And header Content-Type = 'application/json'
    #And request
