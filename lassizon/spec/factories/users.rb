FactoryBot.define do
require 'faker'
  factory :user do
    name        {Faker::Name.first_name}
    surname     {Faker::Name.last_name}
    data        {Faker::Date.birthday(min_age:18,max_age:99)}
    email       {Faker::Internet.safe_email}
    password    {"password"}
    position    {Faker::Nation.capital_city}
    uid         {Faker::Name.first_name}
    roles       {:user}
  end

end
