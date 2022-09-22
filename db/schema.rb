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

ActiveRecord::Schema.define(version: 2017_05_26_171324) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachinary_files", force: :cascade do |t|
    t.string "attachinariable_type"
    t.bigint "attachinariable_id"
    t.string "scope"
    t.string "public_id"
    t.string "version"
    t.integer "width"
    t.integer "height"
    t.string "format"
    t.string "resource_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attachinariable_type", "attachinariable_id", "scope"], name: "by_scoped_parent"
  end

  create_table "carts", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cook_places", id: :serial, force: :cascade do |t|
    t.integer "cook_id"
    t.integer "place_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cook_id"], name: "index_cook_places_on_cook_id"
    t.index ["place_id"], name: "index_cook_places_on_place_id"
  end

  create_table "cook_specialities", id: :serial, force: :cascade do |t|
    t.integer "speciality_id"
    t.integer "cook_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cook_id"], name: "index_cook_specialities_on_cook_id"
    t.index ["speciality_id"], name: "index_cook_specialities_on_speciality_id"
  end

  create_table "cooks", id: :serial, force: :cascade do |t|
    t.integer "age"
    t.text "bio"
    t.integer "review_count"
    t.float "stars"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_cooks_on_user_id"
  end

  create_table "dishes", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "kind_of_dish"
    t.string "speciality"
    t.text "description"
    t.boolean "veggie"
    t.boolean "cooked"
    t.boolean "be_reheated"
    t.string "portion_size"
    t.integer "portion_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cook_id"
    t.decimal "price", precision: 12, scale: 3
    t.datetime "exp_date"
    t.datetime "collect_date"
    t.boolean "gluten_free"
    t.boolean "halal"
    t.boolean "kosher"
    t.index ["cook_id"], name: "index_dishes_on_cook_id"
  end

  create_table "order_items", id: :serial, force: :cascade do |t|
    t.integer "dish_id"
    t.integer "order_id"
    t.decimal "unit_price", precision: 12, scale: 3
    t.integer "quantity"
    t.decimal "total_price", precision: 12, scale: 3
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cart_id"
    t.index ["cart_id"], name: "index_order_items_on_cart_id"
    t.index ["dish_id"], name: "index_order_items_on_dish_id"
    t.index ["order_id"], name: "index_order_items_on_order_id"
  end

  create_table "orders", id: :serial, force: :cascade do |t|
    t.decimal "subtotal", precision: 12, scale: 3
    t.decimal "charge", precision: 12, scale: 3
    t.decimal "total_amount", precision: 12, scale: 3
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "email"
  end

  create_table "places", id: :serial, force: :cascade do |t|
    t.string "full_address"
    t.string "zip_code"
    t.string "city"
    t.string "kind_of_place"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.boolean "active"
    t.text "comments"
  end

  create_table "specialities", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :serial, force: :cascade do |t|
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
    t.string "provider"
    t.string "uid"
    t.string "picture"
    t.string "first_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cook_places", "cooks"
  add_foreign_key "cook_places", "places"
  add_foreign_key "cook_specialities", "cooks"
  add_foreign_key "cook_specialities", "specialities"
  add_foreign_key "cooks", "users"
  add_foreign_key "dishes", "cooks"
  add_foreign_key "order_items", "carts"
  add_foreign_key "order_items", "dishes"
  add_foreign_key "order_items", "orders"
end
