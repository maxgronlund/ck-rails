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

ActiveRecord::Schema.define(version: 20150916070729) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "category_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string   "city_name"
    t.integer  "city_state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string   "country_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string   "job_name"
    t.string   "job_hash_id"
    t.text     "job_description"
    t.integer  "job_salary"
    t.integer  "job_category"
    t.integer  "job_creator"
    t.integer  "job_country"
    t.integer  "job_state"
    t.integer  "job_city"
    t.datetime "job_start"
    t.datetime "job_valid"
    t.boolean  "job_is_fake"
    t.string   "job_status"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "payments", force: :cascade do |t|
    t.string   "payment_hash_id"
    t.integer  "payment_job"
    t.string   "payment_status"
    t.integer  "payment_price"
    t.integer  "payment_days"
    t.integer  "payment_creator"
    t.boolean  "payment_approval"
    t.datetime "payment_approved_at"
    t.string   "payment_method"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "states", force: :cascade do |t|
    t.string   "state_name"
    t.integer  "state_country"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "user_name"
    t.string   "user_hash_id"
    t.string   "user_email"
    t.string   "password_digest"
    t.string   "user_avatar"
    t.text     "user_address"
    t.string   "user_phone"
    t.integer  "user_country"
    t.integer  "user_state"
    t.integer  "user_city"
    t.string   "user_role"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end