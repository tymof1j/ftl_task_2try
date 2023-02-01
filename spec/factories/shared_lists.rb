# frozen_string_literal: true

FactoryBot.define do
  factory :shared_list do
    association :owner_id
    association :viewer_id
  end
end
