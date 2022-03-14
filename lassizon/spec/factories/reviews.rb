FactoryBot.define do
  require 'faker'
  factory :review do
    product_id  { Faker::IDNumber.valid }
    user_id     { Faker::IDNumber.valid }
    value       { Faker::Number.between(from: 0, to: 5) }
  end
end
