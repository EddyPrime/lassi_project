Feature: Superadmin can see all users and vendors of Lassizon
        As a Superadmin
        I want to have a profile page
        So I can see users and vendors of Lassizon

Scenario: Show Users and Vendors
Given I am Superadmin
And I am on the home page
When I click Profile Page
Then I should see the list of users on Lassizon
