Feature: Vendor can delete his account
        As a Vendor
        I want to have a profile page
        So that I can delete my account

Scenario: Deleting my account
Given I am a registered vendor
And I am on the home page
Then I click Profile Page
Then I click Destroy
Then I should be on the products page
And I should see 'Sign In'
