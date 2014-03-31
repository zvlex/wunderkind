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

ActiveRecord::Schema.define(version: 20140329182934) do

  create_table "ages", force: true do |t|
    t.string   "age_ge"
    t.string   "age_en"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "authentications", force: true do |t|
    t.integer  "customer_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "token"
    t.string   "token_secret"
  end

  create_table "banners", force: true do |t|
    t.string   "title"
    t.string   "url"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "img_url_file_name"
    t.string   "img_url_content_type"
    t.integer  "img_url_file_size"
    t.datetime "img_url_updated_at"
  end

  create_table "brands", force: true do |t|
    t.string   "title_ge"
    t.string   "title_en"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "carts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "title_ge"
    t.string   "title_en"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", force: true do |t|
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
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "address"
    t.string   "town"
    t.integer  "payment_zone_id"
    t.string   "zip_code"
    t.string   "pid"
  end

  add_index "customers", ["email"], name: "index_customers_on_email", unique: true, using: :btree
  add_index "customers", ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true, using: :btree

  create_table "images", force: true do |t|
    t.integer  "product_id"
    t.string   "product_img"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "product_img_file_name"
    t.string   "product_img_content_type"
    t.integer  "product_img_file_size"
    t.datetime "product_img_updated_at"
  end

  create_table "line_items", force: true do |t|
    t.integer  "product_id"
    t.integer  "cart_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity",   default: 1
    t.integer  "order_id"
  end

  add_index "line_items", ["order_id"], name: "index_line_items_on_order_id", using: :btree

  create_table "logs", force: true do |t|
    t.integer  "customer_id"
    t.string   "description"
    t.string   "h_code"
    t.string   "transaction_code"
    t.string   "g_xml"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_products", force: true do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.string   "title"
    t.string   "model"
    t.integer  "quantity"
    t.decimal  "total",        precision: 8, scale: 2
    t.decimal  "delivery_tax", precision: 8, scale: 2
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "per_price",    precision: 8, scale: 2
  end

  create_table "orders", force: true do |t|
    t.string   "invoice"
    t.string   "store_name"
    t.string   "store_url"
    t.integer  "customer_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "payment_address"
    t.integer  "payment_zone_id"
    t.integer  "pay_type_id"
    t.string   "comment"
    t.decimal  "total",           precision: 10, scale: 2
    t.string   "ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "zip_code"
    t.string   "phone"
    t.string   "pid"
    t.decimal  "delivery_town",   precision: 10, scale: 0
    t.string   "status"
  end

  create_table "payment_methods", force: true do |t|
    t.string   "method_name_ge"
    t.string   "method_name_en"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description_ge"
    t.text     "description_en"
    t.string   "img_link"
  end

  create_table "payment_zones", force: true do |t|
    t.string   "zone_name_ge"
    t.string   "zone_name_en"
    t.integer  "country_id"
    t.decimal  "delivery_price", precision: 10, scale: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prefixes", force: true do |t|
    t.string   "prefix_ge"
    t.string   "prefix_en"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.integer  "prefix_id"
    t.string   "title_ge"
    t.string   "title_en"
    t.text     "description_ge"
    t.text     "description_en"
    t.string   "model"
    t.decimal  "price",           precision: 8, scale: 2
    t.integer  "brand_id"
    t.integer  "category_id"
    t.integer  "sub_category_id"
    t.boolean  "in_stock"
    t.integer  "sex_id"
    t.integer  "quantity"
    t.decimal  "discount",        precision: 8, scale: 2, default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "point"
    t.integer  "age_id"
  end

  create_table "rails_admin_histories", force: true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      limit: 2
    t.integer  "year",       limit: 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], name: "index_rails_admin_histories", using: :btree

  create_table "sexes", force: true do |t|
    t.string   "sex_ge"
    t.string   "sex_en"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "static_pages", force: true do |t|
    t.string   "title_ge"
    t.string   "title_en"
    t.text     "content_ge"
    t.text     "content_en"
    t.boolean  "status",     default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "store_infos", force: true do |t|
    t.string   "store_name"
    t.string   "store_owner"
    t.string   "store_address"
    t.string   "store_email"
    t.string   "store_phone"
    t.string   "meta_title"
    t.string   "meta_description"
    t.string   "meta_keywords"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sub_categories", force: true do |t|
    t.string   "title_ge"
    t.string   "title_en"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "sub_img_file_name"
    t.string   "sub_img_content_type"
    t.integer  "sub_img_file_size"
    t.datetime "sub_img_updated_at"
  end

  create_table "transactions", force: true do |t|
    t.integer  "customer_id"
    t.integer  "order_id"
    t.integer  "status"
    t.integer  "payment_method"
    t.integer  "payment_type"
    t.string   "ucode"
    t.string   "description"
    t.decimal  "amount",         precision: 8, scale: 2
    t.string   "bonus_xp",                               default: "0"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
