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

ActiveRecord::Schema.define(version: 20150729044124) do

  create_table "announcements", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "content",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "batches", force: :cascade do |t|
    t.integer  "month",      limit: 4
    t.integer  "year",       limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "bootsy_image_galleries", force: :cascade do |t|
    t.integer  "bootsy_resource_id",   limit: 4
    t.string   "bootsy_resource_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bootsy_images", force: :cascade do |t|
    t.string   "image_file",       limit: 255
    t.integer  "image_gallery_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "campus", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.datetime "date"
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "faculties", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "campu_id",   limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "faculties", ["campu_id"], name: "index_faculties_on_campu_id", using: :btree

  create_table "graduations", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "batch_id",     limit: 4
    t.integer  "programme_id", limit: 4
    t.integer  "campu_id",     limit: 4
    t.integer  "faculty_id",   limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "graduations", ["batch_id"], name: "index_graduations_on_batch_id", using: :btree
  add_index "graduations", ["campu_id"], name: "index_graduations_on_campu_id", using: :btree
  add_index "graduations", ["faculty_id"], name: "index_graduations_on_faculty_id", using: :btree
  add_index "graduations", ["programme_id"], name: "index_graduations_on_programme_id", using: :btree
  add_index "graduations", ["user_id"], name: "index_graduations_on_user_id", using: :btree

  create_table "jobs", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.string   "company",    limit: 255
    t.string   "city",       limit: 255
    t.string   "country",    limit: 255
    t.string   "current",    limit: 255
    t.datetime "from"
    t.datetime "to"
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "jobs", ["user_id"], name: "index_jobs_on_user_id", using: :btree

  create_table "programmes", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "faculty_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "programmes", ["faculty_id"], name: "index_programmes_on_faculty_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                   limit: 255, default: "",   null: false
    t.string   "encrypted_password",      limit: 255, default: "",   null: false
    t.string   "reset_password_token",    limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",           limit: 4,   default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",      limit: 255
    t.string   "last_sign_in_ip",         limit: 255
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.string   "name",                    limit: 255
    t.string   "student_id",              limit: 255
    t.string   "city",                    limit: 255
    t.string   "country",                 limit: 255
    t.boolean  "is_graduate",             limit: 1,   default: true
    t.string   "id_number",               limit: 255
    t.string   "avatar",                  limit: 255
    t.string   "location_privacy_option", limit: 255
    t.string   "job_privacy_option",      limit: 255
    t.string   "social_privacy_option",   limit: 255
    t.string   "phone",                   limit: 255
    t.string   "facebook",                limit: 255
    t.string   "twitter",                 limit: 255
    t.string   "linkedin",                limit: 255
    t.string   "instagram",               limit: 255
    t.string   "contact_privacy_option",  limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["id_number"], name: "index_users_on_id_number", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
