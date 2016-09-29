# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160924213847) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachinary_files", force: :cascade do |t|
    t.string   "attachinariable_type"
    t.integer  "attachinariable_id"
    t.string   "scope"
    t.string   "public_id"
    t.string   "version"
    t.integer  "width"
    t.integer  "height"
    t.string   "format"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["attachinariable_type", "attachinariable_id", "scope"], name: "by_scoped_parent", using: :btree
  end

  create_table "cook_places", force: :cascade do |t|
    t.integer  "cook_id"
    t.integer  "place_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cook_id"], name: "index_cook_places_on_cook_id", using: :btree
    t.index ["place_id"], name: "index_cook_places_on_place_id", using: :btree
  end

  create_table "cook_specialities", force: :cascade do |t|
    t.integer  "speciality_id"
    t.integer  "cook_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["cook_id"], name: "index_cook_specialities_on_cook_id", using: :btree
    t.index ["speciality_id"], name: "index_cook_specialities_on_speciality_id", using: :btree
  end

  create_table "cooks", force: :cascade do |t|
    t.string   "last_name"
    t.string   "first_name"
    t.integer  "age"
    t.text     "bio"
    t.integer  "review_count"
    t.float    "stars"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_cooks_on_user_id", using: :btree
  end

  create_table "dishes", force: :cascade do |t|
    t.string   "name"
    t.string   "kind_of_dish"
    t.string   "speciality"
    t.text     "description"
    t.boolean  "veggie"
    t.boolean  "cooked"
    t.boolean  "be_reheated"
    t.string   "portion_size"
    t.integer  "portion_count"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "cook_id"
    t.decimal  "price",         precision: 12, scale: 3
    t.datetime "exp_date"
    t.datetime "collect_date"
    t.index ["cook_id"], name: "index_dishes_on_cook_id", using: :btree
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "dish_id"
    t.integer  "order_id"
    t.decimal  "unit_price",  precision: 12, scale: 3
    t.integer  "quantity"
    t.decimal  "total_price", precision: 12, scale: 3
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.index ["dish_id"], name: "index_order_items_on_dish_id", using: :btree
    t.index ["order_id"], name: "index_order_items_on_order_id", using: :btree
  end

  create_table "order_statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.decimal  "subtotal",        precision: 12, scale: 3
    t.decimal  "charge",          precision: 12, scale: 3
    t.decimal  "total_amount",    precision: 12, scale: 3
    t.integer  "order_status_id"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.index ["order_status_id"], name: "index_orders_on_order_status_id", using: :btree
  end

  create_table "places", force: :cascade do |t|
    t.string   "name"
    t.string   "full_address"
    t.string   "zip_code"
    t.string   "city"
    t.string   "kind_of_place"
    t.boolean  "reception_desk"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "specialities", force: :cascade do |t|
    t.string   "name"
    t.string   "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "cook_places", "cooks"
  add_foreign_key "cook_places", "places"
  add_foreign_key "cook_specialities", "cooks"
  add_foreign_key "cook_specialities", "specialities"
  add_foreign_key "cooks", "users"
  add_foreign_key "dishes", "cooks"
  add_foreign_key "order_items", "dishes"
  add_foreign_key "order_items", "orders"
  add_foreign_key "orders", "order_statuses"
end
