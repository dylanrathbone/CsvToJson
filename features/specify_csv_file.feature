Feature: convert csv to JSON

  Users of the csv to json tool should be able to specify the csv file that they would like coverted. The tool should also
  provide some level of validation to ensure that the csv file is of a valid format

  Scenario: Specify a valid csv file for coversion
    When I provide a "valid csv" file I should receive a file "valid message"
    Then the file should be converted to JSON and I should be displayed the "result"
