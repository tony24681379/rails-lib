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

ActiveRecord::Schema.define(version: 20160727043022) do

  create_table "dailies", force: :cascade do |t|
    t.date     "date"
    t.integer  "machine_id"
    t.integer  "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "daily_problems", force: :cascade do |t|
    t.date     "date"
    t.string   "machine_id"
    t.string   "user_id"
    t.string   "problem_detail"
    t.integer  "situation"
    t.string   "maintainer_id"
    t.string   "comment"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "libraries", force: :cascade do |t|
    t.string   "branch"
    t.integer  "floor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "machines", id: false, force: :cascade do |t|
    t.string   "branch",         limit: 255, null: false
    t.string   "place",          limit: 255, null: false
    t.string   "maintain_group", limit: 255, null: false
    t.integer  "floor",                      null: false
    t.string   "machine_id",     limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "machines", ["machine_id"], name: "index_machines_on_machine_id", unique: true

  create_table "maintain_groups", id: false, force: :cascade do |t|
    t.text     "group",                  null: false
    t.string   "user_id",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "maintain_groups", ["group"], name: "index_maintain_groups_on_group", unique: true

  create_table "maintain_states", force: :cascade do |t|
    t.string   "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "problem_categories", force: :cascade do |t|
    t.text     "problem"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_states", force: :cascade do |t|
    t.string   "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "username",               limit: 255
    t.string   "account",                limit: 255
    t.integer  "extension_number"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
