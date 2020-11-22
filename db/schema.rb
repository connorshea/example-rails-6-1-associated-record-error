# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_21_220748) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "game_purchase_platforms", force: :cascade do |t|
    t.bigint "game_purchase_id", null: false
    t.bigint "platform_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_purchase_id", "platform_id"], name: "index_game_purchase_platforms_on_game_purchase_and_platform", unique: true
    t.index ["game_purchase_id"], name: "index_game_purchase_platforms_on_game_purchase_id"
    t.index ["platform_id"], name: "index_game_purchase_platforms_on_platform_id"
  end

  create_table "game_purchases", force: :cascade do |t|
    t.text "comments"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "platforms", force: :cascade do |t|
    t.text "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "game_purchase_platforms", "game_purchases", on_delete: :cascade
  add_foreign_key "game_purchase_platforms", "platforms", on_delete: :cascade
end
