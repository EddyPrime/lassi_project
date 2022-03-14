Feature: I want to delete a product

Scenario: As a vendor I want to delete a product
    Given I am on the home page
    And I am a registered vendor
    And I click Destroy
    Then I should be on the products page
