Feature: Specify a csv file

  Users of the csv to json tool should be able to specify the csv file that they would like coverted. The tool should also
  provide some level of validation to ensure that the csv file is of a valid format

  Scenario: Specify a valid csv file
    When I provide a valid csv
    Then the file should be validated
    Then I should receive the message "Success file imported"


  Scenario: Specify an invalid csv file
    When I provide an invalid csv
    Then the file should be validated
    Then I should receive the message "file import failed!"