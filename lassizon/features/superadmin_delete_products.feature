Feature: Superadmin can delete a product
        As a Superadmin
        I want to have a profile page
        So I can delete a product

Scenario: Delete product
Given I am Superadmin
And I am on the home page
Then I should see the products
And I click Destroy
Then I should be on the products page

