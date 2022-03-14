Feature: I want to buy products

Scenario: As a user I want to buy products
    Given I am a registered user
    And I am on the home page
    When I click Buy
    Then I should be on the purchases page
