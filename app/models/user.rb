class User < ApplicationRecord
    has_many :redemptions
    has_many :rewards, through: :redemptions
  
    validates :name, presence: true
    validates :points, numericality: { greater_than_or_equal_to: 0 }
  end
  