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

ActiveRecord::Schema.define(version: 20170419081429) do

  create_table "balls", force: :cascade do |t|
    t.integer  "number",             limit: 4
    t.string   "color",              limit: 255
    t.string   "title",              limit: 255
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
    t.decimal  "price",                          precision: 10, scale: 2
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
  end

  create_table "balls_carts", id: false, force: :cascade do |t|
    t.integer "ball_id", limit: 4
    t.integer "cart_id", limit: 4
  end

  add_index "balls_carts", ["ball_id"], name: "index_balls_carts_on_ball_id", using: :btree
  add_index "balls_carts", ["cart_id"], name: "index_balls_carts_on_cart_id", using: :btree

  create_table "balls_orders", id: false, force: :cascade do |t|
    t.integer "ball_id",  limit: 4
    t.integer "order_id", limit: 4
  end

  add_index "balls_orders", ["ball_id"], name: "index_balls_orders_on_ball_id", using: :btree
  add_index "balls_orders", ["order_id"], name: "index_balls_orders_on_order_id", using: :btree

  create_table "carts", force: :cascade do |t|
    t.decimal  "total",                  precision: 10, scale: 2
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "user_id",    limit: 255
  end

  create_table "carts_sticks", id: false, force: :cascade do |t|
    t.integer "stick_id", limit: 4, null: false
    t.integer "cart_id",  limit: 4, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.decimal  "price",                    precision: 10, scale: 2
    t.string   "ship_street",  limit: 255
    t.string   "ship_city",    limit: 255
    t.string   "ship_state",   limit: 255
    t.string   "ship_zip",     limit: 255
    t.decimal  "shipping",                 precision: 10, scale: 2
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "user_id",      limit: 255
    t.string   "sale_id",      limit: 255
    t.string   "payment_type", limit: 255
  end

  create_table "orders_balls", id: false, force: :cascade do |t|
    t.integer "order_id", limit: 4
    t.integer "ball_id",  limit: 4
  end

  add_index "orders_balls", ["ball_id"], name: "index_orders_balls_on_ball_id", using: :btree
  add_index "orders_balls", ["order_id"], name: "index_orders_balls_on_order_id", using: :btree

  create_table "orders_sticks", id: false, force: :cascade do |t|
    t.integer "stick_id", limit: 4, null: false
    t.integer "order_id", limit: 4, null: false
  end

  create_table "sticks", force: :cascade do |t|
    t.string   "title",              limit: 255
    t.string   "color",              limit: 255
    t.decimal  "length",                         precision: 10
    t.decimal  "weight",                         precision: 10
    t.decimal  "price",                          precision: 10
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.string   "street",                 limit: 255
    t.string   "city",                   limit: 255
    t.string   "state",                  limit: 255
    t.string   "zip",                    limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
