Feature: Vendor can see his position

Scenario: As a Vendor I want to see my position
Given I am a registered vendor
And I am on the home page
And I click Profile Page
Then I should see the map with my position
