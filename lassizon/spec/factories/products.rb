FactoryBot.define do
require 'faker'
  factory :product do
    productId {Faker::IDNumber.valid }
    user_id {Faker::IDNumber.valid}
    price {Faker::Number.decimal(l_digits: 5)}
    product_type {Faker::String.random(length: 3..8)}
    name {Faker::String.random(length: 3..8)}

  end
end
