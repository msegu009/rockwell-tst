# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180415184033) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.date "day"
    t.string "num_of_males"
    t.string "num_of_females"
    t.boolean "atmosphere"
    t.integer "expected_spend"
    t.string "transaction_id"
    t.bigint "table_id"
    t.bigint "server_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["server_id"], name: "index_bookings_on_server_id"
    t.index ["table_id"], name: "index_bookings_on_table_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "clubs", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "floors", force: :cascade do |t|
    t.string "name"
    t.bigint "club_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_floors_on_club_id"
  end

  create_table "servers", force: :cascade do |t|
    t.string "name"
    t.string "photo"
    t.string "instagram"
    t.bigint "club_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_servers_on_club_id"
  end

  create_table "tables", force: :cascade do |t|
    t.string "name"
    t.integer "min_price"
    t.boolean "available_today"
    t.bigint "floor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["floor_id"], name: "index_tables_on_floor_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "email"
    t.string "password_digest"
    t.string "stripe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bookings", "servers"
  add_foreign_key "bookings", "tables"
  add_foreign_key "bookings", "users"
  add_foreign_key "floors", "clubs"
  add_foreign_key "servers", "clubs"
  add_foreign_key "tables", "floors"
end
