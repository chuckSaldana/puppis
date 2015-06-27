Feature: Puppis should recognize buttons

  Scenario: I should be able to view the text of a button
    Given I am testing buttons
    Then I should see the first button has the text "Button with accessibility label"

  Scenario: I should be able to find a button based on class
    Given I am testing buttons
    Then I should be able to find a button identified by class

  Scenario: I should be able to find a button based on marked
    Given I am testing buttons
    Then I should be able to find a button identified by marked

  Scenario: I should be able to find a button based on label
    Given I am testing buttons
    Then I should be able to find a button identified by label

  Scenario: I should be able to find a button based on index
    Given I am testing buttons
    Then I should be able to find a button identified by index

  Scenario: I should be able to find a button based on query
    Given I am testing buttons
    Then I should be able to find a button identified by query

  Scenario: I should be able to touch buttons
    Given I am testing buttons
    When I touch a button
    Then I should see the button was touched
