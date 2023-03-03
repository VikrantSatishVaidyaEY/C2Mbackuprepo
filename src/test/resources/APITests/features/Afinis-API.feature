Feature: Afinis

#Bank Contacts API
  Scenario: G2M Service findbyBankIDAndReason API
    Given url 'https://api.afinis.org/v1/banks/061103852/contact?reason=ACH_FRAUD&apikey=CNOzZUjTfm8EpXCI3AGG4CKK3oGUr9W4'
    When method GET
    Then status 200
    Then print  response

#Bank Contacts API
  Scenario: G2M findbyBankIDAndReason API
    Given I want to test the "findByBankIdAndReason" webservice
    When I use "GET" method
    Then I validate 200 status code
    And Print the response






#Account Validation APIs
# Debit account validation

  Scenario: G2M Service validateDebtorAccount API
    Given url 'https://api.afinis.org/v1/accounts/validate/achPaymentDebitAcceptance?apikey=Q6vnRnDGMGT6pMkn0UXMHiO176pn7CH9'
  * configure charset = null
  And header Content-Type = 'application/json'
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
    When method POST
    Then status 200
    Then print response


  # Credit account validation

  Scenario: G2M Service validateCreditorAccount API
    Given url 'https://api.afinis.org/v1/accounts/validate/achPaymentCreditAcceptance?apikey=Q6vnRnDGMGT6pMkn0UXMHiO176pn7CH9'
    * configure charset = null
    And header Content-Type = 'application/json'
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
    When method POST
    Then status 200
    Then print response

 # ACH Payment Initiation API

  Scenario: G2M Service ACH Payments Initiation Credit API
    Given url 'https://api.asig.org/v1/payments/ach/credit?apikey=CNOzZUjTfm8EpXCI3AGG4CKK3oGUr9W4'
    # used to override default setting
    * configure charset = null
    And request
    """
   {
  "paymentInformation": {
    "paymentInformationIdentification": "1001ABCUSDO1_20181212",
    "debtor": {
      "identification": "1234567891",
      "name": "Company ABC"
    },
    "debtorAccount": {
      "identification": "111010151"
    },
    "creditTransferTransactionInformation": [
      {
        "paymentIdentification": {
          "instructionIdentification": "ABC0928",
          "endToEndIdentification": "ABC13609-15-18"
        },
        "paymentTypeInformation": {
          "localInstrument": "WEB",
          "sequenceType": "OOFF",
          "categoryPurpose": {
            "proprietary": "Payment"
          }
        },
        "discretionaryData": "957abc",
        "requestedExecutionDate": "2018-12-12",
        "settlementTimeIndication": "2018-12-12T13:00:00",
        "instructedAmount": {
          "amount": 100.01,
          "currency": "USD"
        },
        "creditorAgent": {
          "clearingSystemIdentification": "USABA",
          "memberIdentification": "061103852"
        },
        "creditor": {
          "name": "John Smith"
        },
        "creditorAccount": {
          "identification": "2345678911",
          "type": "CACC"
        },
        "remittanceInformation": [
          {
            "unstructured": [
              {
                "lineNumber": 1,
                "value": "Addenda 1"
              }
            ]
          }
        ]
      }
    ]
  }
}
    """
  And print request
    And header Content-Type = 'application/json'
    #Given header Content-Type = 'application/json'
    When method post
    And match header content-type contains 'application/json'
    Then status 200
    Then print response


 # ACH Payment Initiation API

  Scenario: G2M Service ACH Payments Initiation Debit API
    Given url 'https://api.asig.org/v1/payments/ach/debit?apikey=X6H7FQ8vJb4gZPtkx27E11sYd7EBQTst'
    # used to override default setting
    * configure charset = null
    And header Content-Type = 'application/json'
    And request
    """
  {
  "paymentInformation": {
    "paymentInformationIdentification": "1001ABCUSDO1_20181212",
    "creditor": {
      "identification": "1234567891",
      "name": "XYZ Supply Co."
    },
    "creditorAccount": {
      "identification": "2345678911"
    },
    "directDebitTransactionInformation": [
      {
        "paymentIdentification": {
          "instructionIdentification": "ABC0928",
          "endToEndIdentification": "ABC13609-15-18"
        },
        "paymentTypeInformation": {
          "localInstrument": "WEB",
          "sequenceType": "OOFF",
          "categoryPurpose": {
            "proprietary": "Payment"
          }
        },
        "discretionaryData": "957abc",
        "requestedCollectionDate": "2018-12-12",
        "settlementTimeIndication": "2018-12-12T13:00:00",
        "instructedAmount": {
          "amount": 100.01,
          "currency": "USD"
        },
        "debtorAgent": {
          "clearingSystemIdentification": "USABA",
          "memberIdentification": "061103852"
        },
        "debtor": {
          "name": "John Q. Public"
        },
        "debtorAccount": {
          "identification": "1111111122",
          "type": "CACC"
        },
        "remittanceInformation": [
          {
            "unstructured": [
              {
                "lineNumber": 1,
                "value": "Addenda 1"
              }
            ]
          }
        ]
      }
    ]
  }
}
    """
    When method POST
    * print 'headers:', karate.prevRequest.headers
    Then status 200
    Then print response



#Transaction Status APIs
  Scenario: G2M Service ACH Payment Status Credit  API
    Given url 'https://api.asig.org/v1/payments/ach/credit/status?apikey=X6H7FQ8vJb4gZPtkx27E11sYd7EBQTst'
     # used to override default setting
    * configure charset = null
    And header Content-Type = 'application/json'
    And request
    """
     {
    "paymentInformation": {
        "debtor": {
            "identification": "1111111111"
        },
        "dateFrom": "2019-09-01",
        "dateTo": "2019-09-25",
          "minimumAmount": {
            "amount": 0.11,
            "currency": "USD"
        },
        "maximumAmount": {
            "amount": 4.11,
            "currency": "USD"
        },
        "creditorAccount": {
            "identification": "11101015"
        },
        "creditorAgent": {
            "clearingSystemIdentification": "USABA",
            "memberIdentification": "061103852"
        }
    }
}
    """
    When method POST
    * print 'headers:', karate.prevRequest.headers
    Then status 200
    Then print response


#Transaction Status APIs
  Scenario: G2M Service ACH Payment Status Debit  API
    Given url 'https://api.asig.org/v1/payments/ach/debit/status?apikey=X6H7FQ8vJb4gZPtkx27E11sYd7EBQTst'
    # used to override default setting
    * configure charset = null
    And header Content-Type = 'application/json'
    And request
    """
     {
        "paymentInformation": {
                "creditor": {
                  "identification": "1111111111"
                },
          "dateFrom": "2019-09-01",
          "dateTo": "2019-09-25",
          "minimumAmount": {
            "amount": 5.55,
            "currency": "USD"
          },
          "maximumAmount": {
            "amount": 50.55,
            "currency": "USD"
          },
          "debtorAccount": {
            "identification": "11101016"
          },
          "debtorAgent": {
            "clearingSystemIdentification": "USABA",
            "memberIdentification": "061103852"
          }
        }
      }
    """
    When method POST
    * print 'headers:', karate.prevRequest.headers
    Then status 200
    Then print response


   #Transaction Status APIs GetTransactionStatusByTransactionId
  Scenario: G2M Service Get Transaction Status by transaction id API
    Given url 'https://api.asig.org/v1/payments/ach/status/transactionId/061058944234363?apikey=X6H7FQ8vJb4gZPtkx27E11sYd7EBQTst'
    When method GET
    Then status 200
    Then print response


  #Transaction Status APIs GetTransactionStatusByInstructionId

  Scenario: G2M Service Get Transaction Status by instruction id API
    Given url 'https://api.asig.org/v1/payments/ach/status/instructionId/5234569?apikey=X6H7FQ8vJb4gZPtkx27E11sYd7EBQTst'
    When method GET
    Then status 200
    Then print response



  #Transaction Status APIs ACH Payment Status Debit
  Scenario: G2M Service ACH Payment Status Debit  API
    Given url 'https://api.asig.org/v1/payments/ach/debit/status?apikey=X6H7FQ8vJb4gZPtkx27E11sYd7EBQTst'
    # used to override default setting
    * configure charset = null
    And header Content-Type = 'application/json'
    And request
    """
     {
        "paymentInformation": {
                "creditor": {
                  "identification": "1111111111"
                },
          "dateFrom": "2019-09-01",
          "dateTo": "2019-09-25",
          "minimumAmount": {
            "amount": 5.55,
            "currency": "USD"
          },
          "maximumAmount": {
            "amount": 50.55,
            "currency": "USD"
          },
          "debtorAccount": {
            "identification": "11101016"
          },
          "debtorAgent": {
            "clearingSystemIdentification": "USABA",
            "memberIdentification": "061103852"
          }
        }
      }
    """
    When method POST
    * print 'headers:', karate.prevRequest.headers
    Then status 200
    Then print response


#Sandbox doesnot provide dynamic transaction ID
  Scenario: Initiate Credit Payment and validate status
    Given url AFINIS_INITIATE_PAYMENT_CREDIT + APIKEY
      # used to override default setting
    And configure charset = null
    And def requestJson = read(karate.properties['user.dir'] + '/src/test/resources/achCreditTransactionRequest.json')
    And request requestJson
    And header Content-Type = 'application/json'
      #Given header Content-Type = 'application/json'
    When method post
    Then status 200
    Then print response
    Given url AFINIS_GET_TRANSACTION_STATUS_INSTRUCTION_ID + '5234561?apikey=' + APIKEY
    When method GET
    Then status 200
    Then print response






   # Given url 'https://api.asig.org/v1/payments/ach/credit/status?apikey=X6H7FQ8vJb4gZPtkx27E11sYd7EBQTst'
     # used to override default setting
    #* configure charset = null
    #And header Content-Type = 'application/json'
    #And request
