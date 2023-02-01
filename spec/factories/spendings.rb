# frozen_string_literal: true

FactoryBot.define do
  factory :spending do
    name { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    amount { Faker::Number.number(digits: 6) }
    category { Spending.categories.keys.sample }
    sequence :user_id
  end
end
