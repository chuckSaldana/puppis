Feature: Puppis should recognize buttons

  Scenario: I should be able to view the text of a button
    Given I am testing buttons
    Then I should see the first button has the text "Button with accessibility label"