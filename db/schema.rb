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

ActiveRecord::Schema.define(version: 20140714151024) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boats", force: true do |t|
    t.integer  "user_id",    null: false
    t.string   "type_of",    null: false
    t.integer  "length",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "harbors", force: true do |t|
    t.string "name",        null: false
    t.string "state",       null: false
    t.text   "description"
  end

  create_table "moorings", force: true do |t|
    t.integer  "harbor_id",  null: false
    t.integer  "user_id",    null: false
    t.string   "state",      null: false
    t.integer  "price",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "latitude",   null: false
    t.decimal  "longitude",  null: false
  end

  create_table "reservations", force: true do |t|
    t.integer  "boat_id",    null: false
    t.integer  "mooring_id", null: false
    t.date     "check_in",   null: false
    t.date     "check_out",  null: false
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
