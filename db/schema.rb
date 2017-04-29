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

ActiveRecord::Schema.define(version: 20170424165508) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_users", force: :cascade do |t|
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
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "banners", force: :cascade do |t|
    t.string   "banner_image_file_name"
    t.string   "banner_image_content_type"
    t.integer  "banner_image_file_size"
    t.datetime "banner_image_updated_at"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "community_groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contact_infos", force: :cascade do |t|
    t.string   "address_type"
    t.string   "name"
    t.string   "address_one"
    t.string   "address_two"
    t.string   "address_three"
    t.string   "area"
    t.string   "city"
    t.integer  "pincode"
    t.string   "phone"
    t.integer  "mobile_one",                   limit: 8
    t.integer  "mobile_two",                   limit: 8
    t.string   "email"
    t.string   "member_type"
    t.string   "spouse_name"
    t.boolean  "committee_member"
    t.boolean  "post"
    t.date     "admission_date"
    t.integer  "community_group_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "display_picture_file_name"
    t.string   "display_picture_content_type"
    t.integer  "display_picture_file_size"
    t.datetime "display_picture_updated_at"
  end

  add_index "contact_infos", ["community_group_id"], name: "index_contact_infos_on_community_group_id", using: :btree

  add_foreign_key "contact_infos", "community_groups"
end
