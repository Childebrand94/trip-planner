# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2023_12_07_212458) do
  create_table "comments", force: :cascade do |t|
    t.integer "parent_id", null: false
    t.integer "author_id", null: false
    t.text "body", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "debtors", force: :cascade do |t|
    t.integer "expense_id", null: false
    t.integer "debtor_id", null: false
    t.integer "amount_owed", null: false
    t.boolean "paid", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expenses", force: :cascade do |t|
    t.integer "trip_id", null: false
    t.integer "payer_id", null: false
    t.text "name", null: false
    t.integer "amount", null: false
    t.text "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "itinerary_item_types", force: :cascade do |t|
    t.text "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "itinerary_items", force: :cascade do |t|
    t.integer "trip_id", null: false
    t.text "event_name", null: false
    t.integer "type_id", null: false
    t.text "address", null: false
    t.datetime "start_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "end_date", null: false
  end

  create_table "itinerary_votes", force: :cascade do |t|
    t.integer "author_id", null: false
    t.integer "itinerary_item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trips", force: :cascade do |t|
    t.integer "creator_id", null: false
    t.text "location", null: false
    t.date "starting_date", null: false
    t.date "ending_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "lat", precision: 10, scale: 6
    t.decimal "long", precision: 10, scale: 6
    t.string "name", null: false
  end

  create_table "user_trip_roles", force: :cascade do |t|
    t.text "role", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_trips", force: :cascade do |t|
    t.string "user_id", null: false
    t.integer "trip_id", null: false
    t.integer "user_role", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.text "first_name", null: false
    t.text "last_name", null: false
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "comments", "comments", column: "parent_id"
  add_foreign_key "comments", "users", column: "author_id"
  add_foreign_key "debtors", "expenses"
  add_foreign_key "debtors", "users", column: "debtor_id"
  add_foreign_key "expenses", "trips"
  add_foreign_key "expenses", "users", column: "payer_id"
  add_foreign_key "itinerary_items", "itinerary_item_types", column: "type_id"
  add_foreign_key "itinerary_items", "trips"
  add_foreign_key "itinerary_votes", "itinerary_items"
  add_foreign_key "itinerary_votes", "users", column: "author_id"
  add_foreign_key "trips", "users", column: "creator_id"
  add_foreign_key "user_trips", "trips"
  add_foreign_key "user_trips", "user_trip_roles", column: "user_role"
  add_foreign_key "user_trips", "users"
end
