class GamePurchase < ApplicationRecord
  has_many :game_purchase_platforms
  has_many :platforms, through: :game_purchase_platforms, source: :platform

  validates :comments,
    length: { maximum: 2000 }
end
