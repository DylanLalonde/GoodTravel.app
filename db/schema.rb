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


ActiveRecord::Schema.define(version: 2018_06_28_170903) do


  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.string "status"
    t.bigint "referrer_info_id"
    t.bigint "traveller_info_id"
    t.bigint "ngo_id"
    t.bigint "experience_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer "number_traveller"
    t.string "description"
    t.float "amount_donated"
    t.integer "amount_cents", default: 0, null: false
    t.time "start_time"
    t.index ["experience_id"], name: "index_bookings_on_experience_id"
    t.index ["ngo_id"], name: "index_bookings_on_ngo_id"
    t.index ["referrer_info_id"], name: "index_bookings_on_referrer_info_id"
    t.index ["traveller_info_id"], name: "index_bookings_on_traveller_info_id"
  end

  create_table "donations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "booking_id"
    t.integer "ngo_id"
    t.integer "amount_cents", default: 0, null: false
  end

  create_table "earnings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "booking_id"
    t.integer "referrer_info_id"
    t.integer "amount_cents", default: 0, null: false
  end

  create_table "experiences", force: :cascade do |t|
    t.string "name"
    t.string "smdescription"
    t.bigint "host_info_id"
    t.bigint "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category"
    t.string "photo"
    t.float "latitude"
    t.float "longitude"
    t.string "address"
    t.integer "featured_ngo"
    t.integer "price_cents", default: 0, null: false
    t.integer "duration"
    t.string "lgdescription"
    t.date "start_date"
    t.date "end_date"
    t.time "start_time"
    t.index ["host_info_id"], name: "index_experiences_on_host_info_id"
    t.index ["location_id"], name: "index_experiences_on_location_id"
  end

  create_table "host_infos", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.string "name"
    t.index ["user_id"], name: "index_host_infos_on_user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ngo_locations", force: :cascade do |t|
    t.bigint "ngo_id"
    t.bigint "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_ngo_locations_on_location_id"
    t.index ["ngo_id"], name: "index_ngo_locations_on_ngo_id"
  end

  create_table "ngos", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category"
    t.string "description"
    t.string "photo"
    t.string "address"
  end

  create_table "orders", force: :cascade do |t|
    t.string "state"
    t.string "booking_sku"
    t.integer "amount_cents", default: 0, null: false
    t.string "amount_currency", default: "EUR", null: false
    t.jsonb "payment"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "referrer_infos", force: :cascade do |t|
    t.integer "referral_code"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "location_id"
    t.index ["referral_code"], name: "index_referrer_infos_on_referral_code"
    t.index ["user_id"], name: "index_referrer_infos_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.bigint "experience_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["experience_id"], name: "index_reviews_on_experience_id"
  end

  create_table "traveller_infos", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_traveller_infos_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "photo"
    t.integer "referrer_info_id"
    t.integer "traveller_info_id"
    t.integer "host_info_id"
    t.integer "credit"
    t.string "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "experiences"
  add_foreign_key "bookings", "ngos"
  add_foreign_key "bookings", "referrer_infos"
  add_foreign_key "bookings", "traveller_infos"
  add_foreign_key "experiences", "host_infos"
  add_foreign_key "experiences", "locations"
  add_foreign_key "host_infos", "users"
  add_foreign_key "ngo_locations", "locations"
  add_foreign_key "ngo_locations", "ngos"
  add_foreign_key "orders", "users"
  add_foreign_key "referrer_infos", "users"
  add_foreign_key "reviews", "experiences"
  add_foreign_key "traveller_infos", "users"
end
