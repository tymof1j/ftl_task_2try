# frozen_string_literal: true

class User < ApplicationRecord
  has_many :spendings
  has_one :owner, class_name: 'SharedList', foreign_key: 'owner_id'
  has_many :viewers, class_name: 'SharedList', foreign_key: 'viewer_id'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
