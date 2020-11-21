class Platform < ApplicationRecord
  has_many :game_purchase_platforms
  has_many :game_purchases, through: :game_purchase_platforms, source: :game_purchase

  validates :name,
    presence: true,
    length: { maximum: 120 }
end
