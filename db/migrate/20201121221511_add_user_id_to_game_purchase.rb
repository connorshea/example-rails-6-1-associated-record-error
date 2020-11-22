class AddUserIdToGamePurchase < ActiveRecord::Migration[6.0]
  def change
    change_table :game_purchases do |t|
      t.references :user, null: true, foreign_key: true
    end
  end
end
