Feature: I want to search products

Scenario: As a guest I want to search products
    Given I am on the home page
    And I fill in "search" with "test"
    When I click Search
    Then I should see the products

Scenario: As a user I want to search products
    Given I am on the home page
    And I fill in "search" with "test"
    When I click Search
    Then I should see the products

Scenario: As a vendor I want to search products
    Given I am on the home page
    And I fill in "search" with "test"
    When I click Search
    Then I should see the products
