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

ActiveRecord::Schema.define(version: 20150724135006) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "practices", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "profile_pic"
    t.text     "bio"
    t.text     "city"
    t.text     "province"
    t.text     "postal_code"
  end

  create_table "practices_professionals", id: false, force: :cascade do |t|
    t.integer "practice_id"
    t.integer "professional_id"
  end

  add_index "practices_professionals", ["practice_id", "professional_id"], name: "practices_professionals_joins", using: :btree

  create_table "professionals", force: :cascade do |t|
    t.string "name"
    t.string "phone_number"
    t.string "email"
    t.text   "bio"
  end

  create_table "professionals_users", id: false, force: :cascade do |t|
    t.integer "professional_id"
    t.integer "user_id"
  end

  add_index "professionals_users", ["professional_id", "user_id"], name: "index_professionals_users_on_professional_id_and_user_id", using: :btree

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
    t.string   "profile_pic"
    t.string   "user_name"
    t.text     "bio"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
