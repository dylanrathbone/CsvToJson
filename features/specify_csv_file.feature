Feature: convert csv to JSON

  Users of the csv to json tool should be able to specify the csv file that they would like converted.
  That file should then be transformed into JSON and output to the user.

  The tool should also provide some level of validation to ensure that the csv file is of a valid format.

  Scenario: A user provides a small valid .csv file which is processed successfully
    Given a the valid csv file "test_data.csv"
    Then the user should receive the message "JSON document successfully generated from file"
    And standard output for the test data should display the valid json:
    """
    [
      {
        "item_id": 111010,
        "description": "Coffee",
        "price": "$1.25"
      }
    ]
    """