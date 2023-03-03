Feature: Demo ETL Test

  Scenario: ETL Test in NGTP - json comparisons
    Given I start an etl validation session
    Given I read data from "src/test/resources/etlvalidation/data/inputdata/transaction_core.json" json file
    Given I read data from "src/test/resources/etlvalidation/data/inputdata/transaction_core_b.json" json file
    And I navigate to "http://localhost:4040"
    Given I compare transaction_core and transaction_core_b data by column having primary key "transaction_unique_identifier" and store it in "result" dataset
    Given I write "result" dataset to "target/output/result.csv" file in csv format


  Scenario Outline: CSV to CSV mock comparison - sample with custom date formatting, threshold customizations and join transformations
    Given I start an etl validation session
    When I read data from "src/test/resources/etlvalidation/data/inputdata/<source>.csv" csv file
    And I read data from "src/test/resources/etlvalidation/data/inputdata/<target>.csv" csv file using options "delimiter:|"
    And I navigate to "http://localhost:4040"
    When I apply transformation.apply.join transformation on <source>,<target> datasets and call it combined
    And I print "10" rows of "combined" dataset onto the screen
    When I apply transformation.apply.rounding transformation on <source> dataset
    When I compare <source> and <target> data by column having primary key "id" and store it in "result" dataset ignoring date formats for date field
    And I write "result" dataset to "target/output/result.csv" file in csv format with advanced options "delimiter:;"
    And I expect the test to fail

    Examples:
    |source         |target         |
    |leasewave_short|infolease_short|

  @etl
  Scenario Outline: Infolease vs Leasewave mock comparison - 150k records
    Given I start an etl validation session
    When I read data from "src/test/resources/etlvalidation/data/inputdata/<source>.csv" csv file
    And I read data from "src/test/resources/etlvalidation/data/inputdata/<target>.csv" csv file
    And I navigate to "http://localhost:4040"
    When I apply transformation.apply.rounding transformation on <source> dataset
    Given I compare <source> and <target> data by column having primary key "ID" and store it in "result" dataset
    And I write "result" dataset to "target/output/result.csv" file in csv format

    Examples:
      |source         |target         |
      |leasewave      |infolease      |