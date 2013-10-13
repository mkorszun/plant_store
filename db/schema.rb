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

ActiveRecord::Schema.define(version: 20131013120459) do

  create_table "global_kinds", force: true do |t|
    t.string   "name"
    t.string   "latin_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "global_treatments", force: true do |t|
    t.string   "watering"
    t.string   "insolation"
    t.integer  "temperature_min"
    t.integer  "temperature_max"
    t.string   "humidity"
    t.text     "comment"
    t.integer  "global_kind_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "global_treatments", ["global_kind_id"], name: "index_global_treatments_on_global_kind_id"

  create_table "kinds", force: true do |t|
    t.text     "name"
    t.text     "latin_name"
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "kinds", ["user_id"], name: "index_kinds_on_user_id"

  create_table "plants", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",        null: false
    t.integer  "global_kind_id"
  end

  add_index "plants", ["global_kind_id"], name: "index_plants_on_global_kind_id"
  add_index "plants", ["user_id"], name: "index_plants_on_user_id"

  create_table "treatments", force: true do |t|
    t.integer  "temperature_min"
    t.integer  "temperature_max"
    t.text     "comment"
    t.integer  "kind_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "treatments", ["kind_id"], name: "index_treatments_on_kind_id"

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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end