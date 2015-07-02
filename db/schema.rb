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

ActiveRecord::Schema.define(version: 20150624042300) do

  create_table "batches", force: :cascade do |t|
    t.datetime "month"
    t.datetime "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "campus", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "faculties", force: :cascade do |t|
    t.string   "name"
    t.integer  "campu_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "faculties", ["campu_id"], name: "index_faculties_on_campu_id"

  create_table "graduations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "batch_id"
    t.integer  "programme_id"
    t.integer  "campu_id"
    t.integer  "faculty_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "graduations", ["batch_id"], name: "index_graduations_on_batch_id"
  add_index "graduations", ["campu_id"], name: "index_graduations_on_campu_id"
  add_index "graduations", ["faculty_id"], name: "index_graduations_on_faculty_id"
  add_index "graduations", ["programme_id"], name: "index_graduations_on_programme_id"
  add_index "graduations", ["user_id"], name: "index_graduations_on_user_id"

  create_table "jobs", force: :cascade do |t|
    t.string   "title"
    t.string   "company"
    t.string   "city"
    t.string   "country"
    t.string   "current"
    t.datetime "from"
    t.datetime "to"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "jobs", ["user_id"], name: "index_jobs_on_user_id"

  create_table "programmes", force: :cascade do |t|
    t.string   "name"
    t.integer  "faculty_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "programmes", ["faculty_id"], name: "index_programmes_on_faculty_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                   default: "",   null: false
    t.string   "encrypted_password",      default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",           default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "name"
    t.string   "student_id"
    t.string   "city"
    t.string   "country"
    t.boolean  "is_graduate",             default: true
    t.string   "id_number"
    t.string   "avatar"
    t.string   "location_privacy_otpion"
    t.string   "content_privacy_otpion"
    t.string   "job_privacy_otpion"
    t.string   "social_privacy_otpion"
    t.string   "location_privacy_option"
    t.string   "content_privacy_option"
    t.string   "job_privacy_option"
    t.string   "social_privacy_option"
    t.string   "phone"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["id_number"], name: "index_users_on_id_number", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
