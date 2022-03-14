Feature: User can logout

Scenario: Logout success
Given I am on the home page
And I am logged in
When I click Logout
Then I should be on the home page
And I should see 'Sign In'

