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

ActiveRecord::Schema.define(version: 20150107030508) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: true do |t|
    t.string   "user_id",    default: "f"
    t.string   "problem_id", default: "f"
    t.text     "comment"
    t.integer  "rating",     default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "group_users", force: true do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "no_of_members", default: 1
  end

  create_table "messages", force: true do |t|
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ticket_id"
  end

  create_table "problems", force: true do |t|
    t.string   "user_id",           null: false
    t.string   "name"
    t.text     "statement"
    t.text     "input_format"
    t.text     "output_format"
    t.text     "constraints"
    t.text     "smaple_input"
    t.text     "sample_output"
    t.integer  "time_limit"
    t.integer  "memory_limit"
    t.integer  "source_limit"
    t.string   "difficuilty_level"
    t.integer  "no_of_attempts"
    t.integer  "no_of_solved"
    t.integer  "no_of_comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "submissions", force: true do |t|
    t.string   "user_id"
    t.string   "problem_id"
    t.string   "status"
    t.float    "execution_time"
    t.integer  "memory"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",        null: false
    t.string   "encrypted_password",     default: "",        null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,         null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.integer  "age"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "college"
    t.string   "languages_known"
    t.integer  "no_of_followers",        default: 0
    t.integer  "no_of_following",        default: 0
    t.string   "phone_no"
    t.integer  "problems_accepted",      default: 0
    t.integer  "total_submissions",      default: 0
    t.integer  "wrong_submissions",      default: 0
    t.integer  "compile_count",          default: 0
    t.integer  "runtime_count",          default: 0
    t.integer  "tle_count",              default: 0
    t.string   "user_type",              default: "GENERAL"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
