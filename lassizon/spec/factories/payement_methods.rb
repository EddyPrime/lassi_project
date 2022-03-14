FactoryBot.define do
require 'faker'
  factory :payement_method do
    user_id {Faker::IDNumber.valid}
    number {Faker::Number.number(digits: 8)}
  end
end
