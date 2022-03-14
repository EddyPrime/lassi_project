Feature: Superadmin can see his position

Scenario: As a Superadmin I want to see my position on the map
Given I am Superadmin
And I am on the home page
And I click Profile Page
Then I should see the map with my position


