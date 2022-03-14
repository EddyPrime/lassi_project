Feature: I want to insert a new product

Scenario: As a vendor I want to insert a new product
    Given I am on the home page
    And I am a registered vendor
    And I fill in "product[name]" with "Pippo"
    And I fill in "product[product_type]" with "Pluto"
    And I fill in "product[price]" with "19,98"
    And I click Add Product
    Then I should see the products
