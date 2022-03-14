Feature: Vendor can logout

Scenario: Logout success
Given I am on the home page
And I am a registered vendor
When I click Logout
And I should be on the home page
And I should see 'Sign In'
