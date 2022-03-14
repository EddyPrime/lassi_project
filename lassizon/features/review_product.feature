Feature: I want to review a product

Scenario: As a user I want to review a product
    Given I am a registered user
    And I am on the home page
    When I fill in "review_value" with "3"
    And I click Add Review
    Then I should be on the products page
