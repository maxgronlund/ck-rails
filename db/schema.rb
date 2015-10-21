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

ActiveRecord::Schema.define(version: 20151019062836) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "article_tags_rels", force: :cascade do |t|
    t.integer  "article_id"
    t.integer  "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "articles", force: :cascade do |t|
    t.string   "article_hash_id"
    t.string   "article_title"
    t.string   "article_img_link"
    t.text     "article_body"
    t.string   "banner"
    t.integer  "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "category_name"
    t.integer  "job_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "categories", ["job_id"], name: "index_categories_on_job_id", using: :btree

  create_table "cities", force: :cascade do |t|
    t.string   "city_name"
    t.integer  "state_id"
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
    t.integer  "user_id"
    t.string   "flag"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "payment_logs", force: :cascade do |t|
    t.integer  "payment_id"
    t.string   "payment_state"
    t.integer  "issuer"
    t.datetime "issued_at"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "payment_logs", ["payment_id"], name: "index_payment_logs_on_payment_id", using: :btree

  create_table "payments", force: :cascade do |t|
    t.string   "payment_hash_id"
    t.integer  "payment_job"
    t.string   "payment_status"
    t.integer  "payment_price"
    t.integer  "payment_days"
    t.integer  "payment_creator"
    t.boolean  "payment_approval"
    t.datetime "payment_approved_at"
    t.datetime "payment_paid_at"
    t.string   "payment_method"
    t.integer  "job_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "payments", ["job_id"], name: "index_payments_on_job_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "role_code"
    t.string   "role_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "salaries", force: :cascade do |t|
    t.integer  "salary_code"
    t.string   "salary_string"
    t.integer  "job_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "salaries", ["job_id"], name: "index_salaries_on_job_id", using: :btree

  create_table "skills", force: :cascade do |t|
    t.string   "skill_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "states", force: :cascade do |t|
    t.string   "state_name"
    t.integer  "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string   "tag_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_details", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "userdetail_bio"
    t.text     "userdetail_phone"
    t.integer  "userdetail_experience"
    t.integer  "userdetail_rating"
    t.integer  "userdetail_major"
    t.string   "curriculumvitae"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "user_educations", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "education"
    t.integer  "year"
    t.text     "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_experiences", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "instance"
    t.string   "position"
    t.datetime "exp_start"
    t.datetime "exp_end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_skill_rels", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "skill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "user_name"
    t.string   "user_hash_id"
    t.string   "user_email"
    t.string   "password_digest"
    t.string   "avatar"
    t.text     "user_address"
    t.string   "user_phone"
    t.integer  "user_country"
    t.integer  "user_state"
    t.integer  "user_city"
    t.string   "user_role"
    t.string   "flag"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
