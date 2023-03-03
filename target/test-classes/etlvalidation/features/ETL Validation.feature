Feature: Extract, Transform, Validate

  @webscrape
  Scenario: Scenario to extract data from web repository, manipulate it and compare it against a pre-existing source data
    Given I start an etl validation session
    When I read data from "https://markets.cboe.com/us/futures/market_statistics/historical_data/" url as csv file and store it in target dataset
    And I get the trade with the maximum volatility from target dataset
    Then I write "target" dataset to "files/source/expected.csv" file in csv format
    And I expect the test to pass

  @etlcomparison
  Scenario: Scenario to extract data from web repository, manipulate it and compare it against a pre-existing source data
    Given I start an etl validation session
    When I read data from "files/source/expected.csv" csv file and store it in source dataset
    And I read data from "https://markets.cboe.com/us/futures/market_statistics/historical_data/" url as csv file and store it in target dataset
    And I get the trade with the maximum volatility from target dataset
    And I write "target" dataset to "files/target/actual.csv" file in csv format
    When I assert if the columns match between source and target
    And I compare source and target data side by side having primary key "Trade Date,Futures" and store it in "result" dataset
    And I write "result" dataset to "comparison/comparison_report.csv" file in csv format
    But I expect the test to fail