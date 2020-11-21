class User < ApplicationRecord
  has_many :game_purchases

  validates :name,
    presence: true

  validates :username,
    presence: true,
    length: { maximum: 20 },
    uniqueness: true
end
