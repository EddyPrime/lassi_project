Feature: Guest can create a new account
As a guest
I want to sign up
So I can be a user

Scenario: Create a new user account
Given I am on the sign up page
When I fill in "user[name]" with "Test"
And I fill in "user[surname]" with "User"
And I fill in "user[data]" with "010101"
And I fill in "user[email]" with "user@test.com"
And I fill in "user[password]" with "miaomiao"
And I fill in "user[password_confirmation]" with "miaomiao"
And I click Sign up
Then I should be on the home page
And I should not see 'Sign In'

Scenario: Create a new vendor account
Given I am on the sign up page
Given I am on the sign up page
When I fill in "user[name]" with "Test"
And I fill in "user[surname]" with "Vendor"
And I fill in "user[data]" with "010101"
And I fill in "user[email]" with "vendor@test.com"
And I fill in "user[password]" with "miaomiao"
And I fill in "user[password_confirmation]" with "miaomiao"
And I click Sign up
Then I should be on the home page
And I should not see 'Sign In'


Scenario: Can't create an account (email required)
Given I am on the sign up page
When I fill in "user[name]" with "Test"
And I fill in "user[surname]" with "User"
And I fill in "user[data]" with "010101"
And I fill in "user[password]" with "miaomiao"
And I fill in "user[password_confirmation]" with "miaomiao"
And I click Sign up
#Then I should be on the sign up page
#And I should see "Email can't be blank"
Then I should see 'Sign In'

Scenario: Open the sign up page
Given I am on the home page
When I click Sign In
Then I should be on the login page

