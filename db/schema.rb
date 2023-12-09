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

ActiveRecord::Schema[7.1].define(version: 2023_12_09_205015) do
  create_table "comments", force: :cascade do |t|
    t.integer "author_id", null: false
    t.integer "parent_id"
    t.text "body", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_comments_on_author_id"
    t.index ["parent_id"], name: "index_comments_on_parent_id"
  end

  create_table "debtors", force: :cascade do |t|
    t.integer "expense_id", null: false
    t.integer "debtor_id", null: false
    t.integer "amount_owed", null: false
    t.boolean "paid", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["debtor_id"], name: "index_debtors_on_debtor_id"
    t.index ["expense_id"], name: "index_debtors_on_expense_id"
  end

  create_table "expenses", force: :cascade do |t|
    t.integer "trip_id", null: false
    t.integer "payer_id", null: false
    t.string "name", null: false
    t.integer "amount", null: false
    t.string "description", null: false
    t.datetime "date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["payer_id"], name: "index_expenses_on_payer_id"
    t.index ["trip_id"], name: "index_expenses_on_trip_id"
  end

  create_table "itinerary_item_types", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "itinerary_items", force: :cascade do |t|
    t.integer "trip_day_id", null: false
    t.integer "item_type_id", null: false
    t.string "event_name", null: false
    t.string "address", null: false
    t.datetime "start_time", null: false
    t.datetime "end_time", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_type_id"], name: "index_itinerary_items_on_item_type_id"
    t.index ["trip_day_id"], name: "index_itinerary_items_on_trip_day_id"
  end

  create_table "itinerary_votes", force: :cascade do |t|
    t.integer "itinerary_item_id", null: false
    t.integer "user_id", null: false
    t.boolean "up_vote", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["itinerary_item_id"], name: "index_itinerary_votes_on_itinerary_item_id"
    t.index ["user_id"], name: "index_itinerary_votes_on_user_id"
  end

  create_table "trip_days", force: :cascade do |t|
    t.integer "trip_id", null: false
    t.date "date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_trip_days_on_trip_id"
  end

  create_table "trips", force: :cascade do |t|
    t.integer "creator_id", null: false
    t.string "name", null: false
    t.string "location", null: false
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.decimal "latitude", precision: 10, scale: 6
    t.decimal "longitude", precision: 10, scale: 6
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_trips_on_creator_id"
  end

  create_table "user_trip_roles", force: :cascade do |t|
    t.string "role", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_trips", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "trip_id", null: false
    t.integer "user_trip_role_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_user_trips_on_trip_id"
    t.index ["user_id"], name: "index_user_trips_on_user_id"
    t.index ["user_trip_role_id"], name: "index_user_trips_on_user_trip_role_id"
  end

  create_table "users", force: :cascade do |t|
    t.text "first_name", null: false
    t.text "last_name", null: false
    t.text "email", null: false
    t.text "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "comments", "comments", column: "parent_id"
  add_foreign_key "comments", "users", column: "author_id"
  add_foreign_key "debtors", "expenses"
  add_foreign_key "debtors", "users", column: "debtor_id"
  add_foreign_key "expenses", "trips"
  add_foreign_key "expenses", "users", column: "payer_id"
  add_foreign_key "itinerary_items", "item_types"
  add_foreign_key "itinerary_items", "trip_days"
  add_foreign_key "itinerary_votes", "itinerary_items"
  add_foreign_key "itinerary_votes", "users"
  add_foreign_key "trip_days", "trips"
  add_foreign_key "trips", "users", column: "creator_id"
  add_foreign_key "user_trips", "trips"
  add_foreign_key "user_trips", "user_trip_roles"
  add_foreign_key "user_trips", "users"
end
