FactoryBot.define do
require 'faker'
  factory :purchase do
    user_id     { Faker::IDNumber.valid }
    product_id  { Faker::IDNumber.valid }
    price       { Faker::Number.decimal(l_digits: 4) }
    description { Faker::Name.name }
  end
end
