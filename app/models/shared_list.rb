# frozen_string_literal: true

class SharedList < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  belongs_to :viewer, class_name: 'User'

  validates :viewer_id, presence: true
  validates :owner_id, presence: true
end
