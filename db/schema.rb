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

ActiveRecord::Schema.define(version: 20140717174819) do

  create_table "consumable_properties", force: true do |t|
    t.string   "name"
    t.string   "manufacturer"
    t.string   "designer"
    t.text     "description"
    t.datetime "date_ordered"
    t.datetime "date_supplied"
    t.string   "unit_weight"
    t.string   "length"
    t.string   "drawing"
    t.integer  "consumable_subcategory_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "consumable_properties", ["consumable_subcategory_id"], name: "index_consumable_properties_on_consumable_subcategory_id"

  create_table "consumable_subcategories", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "consumable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "consumable_subcategories", ["consumable_id"], name: "index_consumable_subcategories_on_consumable_id"

  create_table "consumable_uses", force: true do |t|
    t.text     "project"
    t.text     "comment"
    t.integer  "consumable_subcategory_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "consumable_uses", ["consumable_subcategory_id"], name: "index_consumable_uses_on_consumable_subcategory_id"

  create_table "consumables", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "line_items", force: true do |t|
    t.integer  "product_id"
    t.integer  "request_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity"
    t.integer  "order_id"
  end

  create_table "manufacturers", force: true do |t|
    t.string   "name"
    t.string   "country"
    t.integer  "part_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "manufacturers", ["part_id"], name: "index_manufacturers_on_part_id"

  create_table "orders", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "date_needed"
  end

  create_table "part_line_items", force: true do |t|
    t.integer  "part_id"
    t.integer  "part_request_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity",        default: 1
  end

  create_table "part_requests", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "part_subcategories", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "consumable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "part_subcategories", ["consumable_id"], name: "index_part_subcategories_on_consumable_id"

  create_table "parts", force: true do |t|
    t.string   "title"
    t.string   "number"
    t.string   "image_url"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "product_id"
  end

  create_table "products", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "properties", force: true do |t|
    t.string   "name"
    t.string   "value"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "properties", ["product_id"], name: "index_properties_on_product_id"

  create_table "requests", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stores", force: true do |t|
    t.string   "name"
    t.string   "location"
    t.string   "store_keeper"
    t.string   "quantity"
    t.integer  "part_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "time_received"
  end

  add_index "stores", ["part_id"], name: "index_stores_on_part_id"

  create_table "subcategories", force: true do |t|
    t.integer  "product_id"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subcategories", ["product_id"], name: "index_subcategories_on_product_id"

  create_table "suppliers", force: true do |t|
    t.string   "name"
    t.string   "country"
    t.integer  "part_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "suppliers", ["part_id"], name: "index_suppliers_on_part_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "uses", force: true do |t|
    t.integer  "part_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "uses", ["part_id"], name: "index_uses_on_part_id"

end
