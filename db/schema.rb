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

ActiveRecord::Schema[7.1].define(version: 2024_01_12_194239) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.bigint "author_id", null: false
    t.bigint "parent_id"
    t.bigint "itinerary_item_id", null: false
    t.text "body", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_comments_on_author_id"
    t.index ["itinerary_item_id"], name: "index_comments_on_itinerary_item_id"
    t.index ["parent_id"], name: "index_comments_on_parent_id"
  end

  create_table "debtors", force: :cascade do |t|
    t.bigint "expense_id", null: false
    t.bigint "user_id", null: false
    t.decimal "amount_owed", precision: 10, scale: 2, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expense_id"], name: "index_debtors_on_expense_id"
    t.index ["user_id"], name: "index_debtors_on_user_id"
  end

  create_table "expense_categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expenses", force: :cascade do |t|
    t.bigint "trip_id", null: false
    t.bigint "payer_id", null: false
    t.bigint "expense_category_id", null: false
    t.string "name", null: false
    t.decimal "amount", precision: 10, scale: 2, null: false
    t.boolean "paid", default: false, null: false
    t.date "date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expense_category_id"], name: "index_expenses_on_expense_category_id"
    t.index ["payer_id"], name: "index_expenses_on_payer_id"
    t.index ["trip_id"], name: "index_expenses_on_trip_id"
  end

  create_table "invites", force: :cascade do |t|
    t.string "email", null: false
    t.integer "sender_id", null: false
    t.integer "recipient_id"
    t.string "token", null: false
    t.integer "trip_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "itinerary_item_types", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "itinerary_items", force: :cascade do |t|
    t.bigint "creator_id", null: false
    t.bigint "trip_id", null: false
    t.bigint "item_type_id", null: false
    t.string "event_name", null: false
    t.string "address", null: false
    t.datetime "start_time", null: false
    t.datetime "end_time", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_itinerary_items_on_creator_id"
    t.index ["item_type_id"], name: "index_itinerary_items_on_item_type_id"
    t.index ["trip_id"], name: "index_itinerary_items_on_trip_id"
  end

  create_table "itinerary_votes", force: :cascade do |t|
    t.bigint "itinerary_item_id", null: false
    t.bigint "user_id", null: false
    t.boolean "up_vote", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["itinerary_item_id"], name: "index_itinerary_votes_on_itinerary_item_id"
    t.index ["user_id"], name: "index_itinerary_votes_on_user_id"
  end

  create_table "notes", force: :cascade do |t|
    t.text "body", null: false
    t.boolean "completed", default: false
    t.bigint "trip_id", null: false
    t.bigint "author_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_notes_on_author_id"
    t.index ["trip_id"], name: "index_notes_on_trip_id"
  end

  create_table "trip_images", force: :cascade do |t|
    t.string "path", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trips", force: :cascade do |t|
    t.bigint "trip_image_id", null: false
    t.string "name", null: false
    t.string "location", null: false
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.decimal "latitude", precision: 10, scale: 6
    t.decimal "longitude", precision: 10, scale: 6
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_image_id"], name: "index_trips_on_trip_image_id"
  end

  create_table "user_trip_roles", force: :cascade do |t|
    t.string "role", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_trips", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "trip_id", null: false
    t.bigint "user_trip_role_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_user_trips_on_trip_id"
    t.index ["user_id", "trip_id"], name: "index_user_trips_on_user_id_and_trip_id", unique: true
    t.index ["user_id"], name: "index_user_trips_on_user_id"
    t.index ["user_trip_role_id"], name: "index_user_trips_on_user_trip_role_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "display_name", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.text "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "email_confirmed", default: false
    t.string "confirm_token"
  end

  add_foreign_key "comments", "comments", column: "parent_id"
  add_foreign_key "comments", "itinerary_items"
  add_foreign_key "comments", "users", column: "author_id"
  add_foreign_key "debtors", "expenses"
  add_foreign_key "debtors", "users"
  add_foreign_key "expenses", "expense_categories"
  add_foreign_key "expenses", "trips"
  add_foreign_key "expenses", "users", column: "payer_id"
  add_foreign_key "itinerary_items", "itinerary_item_types", column: "item_type_id"
  add_foreign_key "itinerary_items", "trips"
  add_foreign_key "itinerary_items", "users", column: "creator_id"
  add_foreign_key "itinerary_votes", "itinerary_items"
  add_foreign_key "itinerary_votes", "users"
  add_foreign_key "notes", "trips"
  add_foreign_key "notes", "users", column: "author_id"
  add_foreign_key "trips", "trip_images"
  add_foreign_key "user_trips", "trips"
  add_foreign_key "user_trips", "user_trip_roles"
  add_foreign_key "user_trips", "users"
end
