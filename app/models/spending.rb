# frozen_string_literal: true

class Spending < ApplicationRecord
  belongs_to :user
  enum category: {
    Traveling: 'traveling',
    Clothing: 'clothing',
    Groceries: 'groceries',
    Taxi: 'taxi',
    Shops: 'shops',
    Other: 'other'
  }

  validates :name, presence: true
  validates :category, presence: true
  validates :amount, presence: true, numericality: { only_integer: true }
end
