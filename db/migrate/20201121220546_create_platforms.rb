class CreatePlatforms < ActiveRecord::Migration[6.1]
  def change
    create_table :platforms do |t|
      t.text :name, null: false
      t.timestamps
    end
  end
end
