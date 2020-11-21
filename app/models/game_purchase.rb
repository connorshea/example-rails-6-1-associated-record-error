class GamePurchase < ApplicationRecord
  has_many :game_purchase_platforms
  has_many :platforms, through: :game_purchase_platforms, source: :platforms

  belongs_to :user

  validates :comments,
    length: { maximum: 2000 }
end
