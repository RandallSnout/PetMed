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

ActiveRecord::Schema.define(version: 20161028024258) do

  create_table "addresses", force: :cascade do |t|
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text     "note"
    t.integer  "pet_id"
    t.integer  "vet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["pet_id"], name: "index_comments_on_pet_id"
  add_index "comments", ["vet_id"], name: "index_comments_on_vet_id"

  create_table "pets", force: :cascade do |t|
    t.string   "name"
    t.string   "sex"
    t.string   "species"
    t.float    "age"
    t.string   "color"
    t.integer  "user_id"
    t.string   "pin"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "breed"
  end

  add_index "pets", ["user_id"], name: "index_pets_on_user_id"

  create_table "records", force: :cascade do |t|
    t.string   "fixed"
    t.string   "allergy"
    t.string   "behavior"
    t.integer  "pet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "records", ["pet_id"], name: "index_records_on_pet_id"

  create_table "shots", force: :cascade do |t|
    t.integer  "pet_id"
    t.integer  "records_id"
    t.string   "vaccine"
    t.date     "start"
    t.date     "expiration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "shots", ["pet_id"], name: "index_shots_on_pet_id"
  add_index "shots", ["records_id"], name: "index_shots_on_records_id"

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "address_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "vet_id"
    t.string   "phone_number"
  end

  add_index "users", ["address_id"], name: "index_users_on_address_id"
  add_index "users", ["vet_id"], name: "index_users_on_vet_id"

  create_table "vets", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "office_name"
    t.string   "password_digest"
    t.integer  "address_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "phone_number"
  end

  add_index "vets", ["address_id"], name: "index_vets_on_address_id"

end
