# frozen_string_literal: true

FactoryBot.define do
  factory :spending do
    description { Faker::Lorem.sentence }
    amount { Faker::Number.decimal(l_digits: 2) }
    category { Spending.categories.keys.sample }
    sequence :user_id
  end
end
