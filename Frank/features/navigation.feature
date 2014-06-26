Feature: Navigating between screens

Scenario: Moving from the 'Episodes' screen to the 'Episode' screen
Given I launch the app
Then I should be on the 'Episodes' screen

When I navigate to "The Pod Delusion - Episode 231"
Then I should be on the Episode screen