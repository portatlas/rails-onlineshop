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

ActiveRecord::Schema.define(version: 20160527205221) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "category_products", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "category_products", ["category_id"], name: "index_category_products_on_category_id", using: :btree
  add_index "category_products", ["product_id"], name: "index_category_products_on_product_id", using: :btree

  create_table "order_statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.decimal  "total_value",     precision: 7, scale: 2
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "order_status_id"
    t.integer  "user_id"
  end

  add_index "orders", ["order_status_id"], name: "index_orders_on_order_status_id", using: :btree
  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "product_orders", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "number_of_items"
    t.decimal  "total_price",     precision: 7, scale: 2
    t.integer  "order_id"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.decimal  "unit_price",      precision: 7, scale: 2, null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name",                                null: false
    t.decimal  "price",       precision: 7, scale: 2, null: false
    t.text     "description",                         null: false
    t.string   "brand"
    t.integer  "stock_count",                         null: false
    t.float    "discount"
    t.string   "img_url"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",        null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "first_name",      null: false
    t.string   "last_name",       null: false
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
