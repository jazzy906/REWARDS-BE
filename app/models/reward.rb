class Reward < ApplicationRecord
    has_many :redemptions
    has_many :users, through: :redemptions
  
    validates :name, presence: true
    validates :points, numericality: { greater_than: 0 }
  end
  