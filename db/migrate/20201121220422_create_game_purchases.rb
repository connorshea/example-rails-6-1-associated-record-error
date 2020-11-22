class CreateGamePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :game_purchases do |t|
      t.text :comments
      t.timestamps
    end
  end
end
