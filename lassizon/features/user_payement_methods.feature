Feature: User can add payment methods
        As a User
        I want to have a profile page
        So that I can add payment method

Scenario: Add payment method
Given I am a registered user
And I am on the home page
And I click Profile Page
And I click Payement Methods
Then I should be on the payement methods page
When I fill in "payement_method_number" with "123456789"
And I click Add Payement Method
Then I should be on the payement methods page

