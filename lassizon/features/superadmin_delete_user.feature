Feature: Superadmin can delete a user
        As a Superadmin
        I want to have a profile page
        So I can delete a user

Scenario: Delete User
Given I am Superadmin
And I am on the home page
And I click Profile Page
And I should see the list of users on Lassizon
Then I click Delete

