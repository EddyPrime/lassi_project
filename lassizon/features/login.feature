Feature: Guest can login
As a Guest
I want to LOGIN WITH EMAIL
so that I can INTERACT WITH THE SYSTEM

Scenario: Login success
Given I am a registered user
And I click Logout
And I click Sign In
And I insert my credentials
And I click Log in
Then I should see 'Logout'

Scenario: Login failed
Given I am on the login page
When I fill in "user_email" with "edomatteo@gmail.com"
And I fill in "user_password" with "miaomiao"
And I click Log in
Then I should be on the login page
