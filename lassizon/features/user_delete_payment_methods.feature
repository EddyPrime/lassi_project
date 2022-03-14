Feature: User can delete payment methods
        As a User
        I want to have a profile page
        So that I can delete payment method

Scenario: Delete payment method
Given I am logged as user
And I am on the home page
And I click Profile Page
And I click Payement Methods
Then I should be on the payement methods page
And I click Destroy
Then I should be on the payement methods page
