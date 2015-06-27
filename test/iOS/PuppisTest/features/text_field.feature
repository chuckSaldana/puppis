Feature: Puppis should recognize text fields

  Scenario: I should be able to find a text field based on class
    Given I am testing inputs
    Then I should be able to find a text field identified by class

  Scenario: I should be able to find a text field based on marked
    Given I am testing inputs
    Then I should be able to find a text field identified by marked

  Scenario: I should be able to find a text field based on label
    Given I am testing inputs
    Then I should be able to find a text field identified by label

  Scenario: I should be able to find a text field based on index
    Given I am testing inputs
    Then I should be able to find a text field identified by index

  Scenario: I should be able to find a text field based on query
    Given I am testing inputs
    Then I should be able to find a text field identified by query

  Scenario: I should be able to set the value of a text field
    Given I am testing inputs
    When I set the value fo the first text field to "some text"
    Then the value of the field should be set

