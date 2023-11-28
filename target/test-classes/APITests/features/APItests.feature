Feature: Karate


# REST Service Test Demo
#  @apitest
#  Scenario: REST Service - GET
#    Given url 'https://reqres.in'
#    And path '/api/users?page=2'
#    When method GET
#    Then status 200
#    Then print response
#    Then match $.data[0].name == 'cerulean'
#
#
#  # SOAP Service Test Demo
#  @apitest
#  Scenario: SOAP POST 1
#    Given url 'http://www.dneonline.com/calculator.asmx'
#    When request read('../data/request.xml')
#    And header Content-Type = 'application/soap+xml; charset=utf-8'
#    When method post
#    Then status 200
#    And match /Envelope/Body/MultiplyResponse == read('../data/expected.xml')


  @restapitest
  Scenario: REST Service - GET
    Given url 'https://simple-grocery-store-api.glitch.me'
    And path '/products'
    When method GET
    Then status 200
    Then print response
    #Then match $.data[0].name == 'cerulean'
  # SOAP Service Test Demo 2
#  @apitest
#  Scenario Outline: SOAP POST 2
#    Given url 'https://www.dataaccess.com/webservicesserver/NumberConversion.wso'
#    When request
#    """
#      <?xml version="1.0" encoding="utf-8"?>
#      <soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
#          <soap:Body>
#              <NumberToWords xmlns="http://www.dataaccess.com/webservicesserver/">
#                  <ubiNum><request></ubiNum>
#              </NumberToWords>
#          </soap:Body>
#      </soap:Envelope>
#    """
#    And header Content-Type = 'text/xml; charset=utf-8'
#    When method post
#    Then status 200
#    And match /Envelope/Body/NumberToWordsResponse/NumberToWordsResult == '<response> '
#    Examples:
#      | request | response                      |
#      | 300     | three hundred                 |
#      | 500     | five hundred                  |
#      | 423     | four hundred and twenty three |
#      | 317     | three hundred and seventeen   |
#      | 219     | two hundred and nineteen      |
#      | 111     | one hundred and eleven        |
#      | 425     | four hundred and twenty five  |
#      | 315     | three hundred and fifteen     |
#      | 300     | three hundred                 |
#      | 500     | five hundred                  |
#      | 423     | four hundred and twenty three |
#      | 317     | three hundred and seventeen   |
#      | 219     | two hundred and nineteen      |
#      | 111     | one hundred and eleven        |
#      | 425     | four hundred and twenty five  |
#      | 315     | three hundred and fifteen     |
#      | 300     | three hundred                 |
#      | 500     | five hundred                  |
#      | 423     | four hundred and twenty three |
#      | 317     | three hundred and seventeen   |
#      | 219     | two hundred and nineteen      |
#      | 111     | one hundred and eleven        |
#      | 425     | four hundred and twenty five  |
#      | 315     | three hundred and fifteen     |
#      | 300     | three hundred                 |
#      | 500     | five hundred                  |
#      | 423     | four hundred and twenty three |
#      | 317     | three hundred and seventeen   |
#      | 219     | two hundred and nineteen      |
#      | 111     | one hundred and eleven        |
#      | 425     | four hundred and twenty five  |
#      | 315     | three hundred and fifteen     |
#      | 300     | three hundred                 |
#      | 500     | five hundred                  |
#      | 423     | four hundred and twenty three |
#      | 317     | three hundred and seventeen   |
#      | 219     | two hundred and nineteen      |
#      | 111     | one hundred and eleven        |
#      | 425     | four hundred and twenty five  |
#      | 315     | three hundred and fifteen     |
#      | 300     | three hundred                 |
#      | 500     | five hundred                  |
#      | 423     | four hundred and twenty three |
#      | 317     | three hundred and seventeen   |
#      | 219     | two hundred and nineteen      |
#      | 111     | one hundred and eleven        |
#      | 425     | four hundred and twenty five  |
#      | 315     | three hundred and fifteen     |
#      | 219     | two hundred and nineteen      |
#      | 111     | one hundred and eleven        |
#      | 425     | four hundred and twenty five  |
#      | 315     | three hundred and fifteen     |
#      | 300     | three hundred                 |
#      | 500     | five hundred                  |
#      | 423     | four hundred and twenty three |
#      | 317     | three hundred and seventeen   |
#      | 219     | two hundred and nineteen      |
#      | 111     | one hundred and eleven        |
#      | 425     | four hundred and twenty five  |
#      | 315     | three hundred and fifteen     |
#      | 300     | three hundred                 |
#      | 500     | five hundred                  |
#      | 423     | four hundred and twenty three |
#      | 317     | three hundred and seventeen   |
#      | 219     | two hundred and nineteen      |
#      | 111     | one hundred and eleven        |
#      | 425     | four hundred and twenty five  |
#      | 315     | three hundred and fifteen     |
#      | 300     | three hundred                 |
#      | 500     | five hundred                  |
#      | 423     | four hundred and twenty three |
#      | 317     | three hundred and seventeen   |
#      | 219     | two hundred and nineteen      |
#      | 111     | one hundred and eleven        |
#      | 425     | four hundred and twenty five  |
#      | 315     | three hundred and fifteen     |
#      | 300     | three hundred                 |
#      | 500     | five hundred                  |
#      | 423     | four hundred and twenty three |
#      | 317     | three hundred and seventeen   |
#      | 219     | two hundred and nineteen      |
#      | 111     | one hundred and eleven        |
#      | 425     | four hundred and twenty five  |
#      | 315     | three hundred and fifteen     |
#      | 300     | three hundred                 |
#      | 500     | five hundred                  |
#      | 423     | four hundred and twenty three |
#      | 317     | three hundred and seventeen   |
#      | 219     | two hundred and nineteen      |
#      | 111     | one hundred and eleven        |
#      | 425     | four hundred and twenty five  |
#      | 315     | three hundred and fifteen     |
#      | 423     | four hundred and twenty three |
#      | 317     | three hundred and seventeen   |
#      | 219     | two hundred and nineteen      |
#      | 111     | one hundred and eleven        |
#      | 425     | four hundred and twenty five  |
#      | 315     | three hundred and fifteen     |