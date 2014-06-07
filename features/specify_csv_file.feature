Feature: convert csv to JSON

  Users of the csv to json tool should be able to specify the csv file that they would like converted.
  That file should then be transformed into JSON and output to the user.

  The tool should also provide some level of validation to ensure that the csv file is of a valid format.

  Scenario: A user provides a small .csv file containing stock data which is processed successfully
    Given the valid csv file "test_data.csv"
    Then the user should receive the message "JSON document successfully generated from file"
    And standard output should display the valid json for the stock data:
    """
    [
      {
        "item_id": 111010,
        "description": "Coffee",
        "price": "$1.25",
        "cost": "$0.80",
        "price_type": "system",
        "quantity_on_hand": 100000,
        "modifiers": [
          {
            "name": "Small",
            "price": "-$0.25"
          },
          {
            "name": "Medium",
            "price": "$0.00"
          },
          {
            "name": "Large",
            "price": "$0.30"
          }
        ]
      },
      {
        "item_id": 111011,
        "description": "Latte",
        "price": "$1.35",
        "cost": "$0.80",
        "price_type": "system",
        "quantity_on_hand": 100000,
        "modifiers": [
          {
            "name": "Medium",
            "price": "$0.60"
          }
        ]
      }
    ]
    """

  Scenario: A user provides a large .csv file containing stock data which is processed successfully
    Given the valid csv file "stock_data.csv"
    Then the user should receive the message "JSON document successfully generated from file"
    And standard output should display the valid json for the stock data:
    """
    [
      {
        "item_id": 111010,
        "description": "Coffee",
        "price": "$1.25",
        "cost": "$0.80",
        "price_type": "system",
        "quantity_on_hand": 100000,
        "modifiers": [
          {
            "name": "Small",
            "price": "-$0.25"
          },
          {
            "name": "Medium",
            "price": "$0.00"
          },
          {
            "name": "Large",
            "price": "$0.30"
          }
        ]
      },
      {
        "item_id": 111784,
        "description": "Delivery",
        "price": null,
        "cost": null,
        "price_type": "open",
        "quantity_on_hand": null,
        "modifiers": [

        ]
      },
      {
        "item_id": 111022,
        "description": "Bagel",
        "price": "$3.45",
        "cost": "$2.00",
        "price_type": "system",
        "quantity_on_hand": 9855,
        "modifiers": [
          {
            "name": "Cream Cheese",
            "price": "$1.00"
          }
        ]
      },
      {
        "item_id": 2847224,
        "description": "Orange Juice 48",
        "price": "$68.57",
        "cost": null,
        "price_type": "system",
        "quantity_on_hand": 0,
        "modifiers": [
          {
            "name": "Small",
            "price": "$0.00"
          },
          {
            "name": "Medium",
            "price": "$1.00"
          },
          {
            "name": "Large",
            "price": "$2.50"
          }
        ]
      },
      {
        "item_id": 2847225,
        "description": "Milk 49",
        "price": "$70.00",
        "cost": 49,
        "price_type": "system",
        "quantity_on_hand": 510,
        "modifiers": [

        ]
      },
      {
        "item_id": 2847226,
        "description": "Ciabatta 50",
        "price": "$71.43",
        "cost": null,
        "price_type": "system",
        "quantity_on_hand": 0,
        "modifiers": [

        ]
      },
      {
        "item_id": 2847227,
        "description": "baguette 51",
        "price": "$0.00",
        "cost": null,
        "price_type": "open",
        "quantity_on_hand": 0,
        "modifiers": [

        ]
      },
      {
        "item_id": 2847228,
        "description": "Sour Dough Boule 52",
        "price": "$74.29",
        "cost": null,
        "price_type": "system",
        "quantity_on_hand": 0,
        "modifiers": [

        ]
      },
      {
        "item_id": 2847244,
        "description": "Whole Coffee Cake 68",
        "price": "$0.00",
        "cost": null,
        "price_type": "open",
        "quantity_on_hand": 0,
        "modifiers": [

        ]
      },
      {
        "item_id": 2847229,
        "description": "Country Wht Boule 53",
        "price": "$75.71",
        "cost": null,
        "price_type": "system",
        "quantity_on_hand": 0,
        "modifiers": [

        ]
      },
      {
        "item_id": 2847230,
        "description": "Semolina Batard 54",
        "price": "$77.14",
        "cost": null,
        "price_type": "system",
        "quantity_on_hand": 0,
        "modifiers": [

        ]
      },
      {
        "item_id": 2847231,
        "description": "Multigrain Batard 55",
        "price": "$78.57",
        "cost": null,
        "price_type": "system",
        "quantity_on_hand": 0,
        "modifiers": [

        ]
      },
      {
        "item_id": 2847232,
        "description": "Focaccia 56",
        "price": "$80.00",
        "cost": 56,
        "price_type": "system",
        "quantity_on_hand": 440,
        "modifiers": [

        ]
      },
      {
        "item_id": 2847233,
        "description": "Rolls 57",
        "price": "$81.43",
        "cost": null,
        "price_type": "system",
        "quantity_on_hand": 0,
        "modifiers": [
          {
            "name": "Jelly",
            "price": "$.75"
          },
          {
            "name": "Peanut Butter",
            "price": "$1.12"
          }
        ]
      }
    ]
    """

  Scenario: A user provides an invalid file for JSON transformation
    Given the invalid csv file "test_data"
    Then the user should receive the message "Filename entered is not of a valid type"

  Scenario: A user provides a file for JSON transformation that does not exist
    Given the invalid csv file "non_existent.csv"
    Then the user should receive the message "File specified does not exist"