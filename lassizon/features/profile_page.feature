Feature: I want to see my profile page

Scenario: As a user I want to see my profile page
    Given I am on the home page
    And I am logged in
    When I click Profile Page
    Then I should see 'Hi!'

Scenario: As a vendor I want to see my profile page
    Given I am on the home page
    And I am logged in
    When I click Profile Page
    Then I should see 'Hi!'
