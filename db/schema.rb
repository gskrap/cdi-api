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

ActiveRecord::Schema.define(version: 20200627225710) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dance_classes", force: :cascade do |t|
    t.string   "name",                     null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.datetime "start_time"
    t.integer  "location_id"
    t.datetime "end_time"
    t.string   "notes",       default: ""
  end

  create_table "emergency_contacts", force: :cascade do |t|
    t.string  "first_name",   null: false
    t.string  "last_name",    null: false
    t.string  "relationship", null: false
    t.string  "email",        null: false
    t.string  "phone",        null: false
    t.integer "user_id"
  end

  create_table "group_dance_classes", force: :cascade do |t|
    t.integer  "group_id",       null: false
    t.integer  "dance_class_id", null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "group_students", force: :cascade do |t|
    t.integer  "group_id",   null: false
    t.integer  "student_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name",                            null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "dance_classes_count", default: 0
  end

  create_table "teacher_dance_classes", force: :cascade do |t|
    t.integer  "teacher_id",     null: false
    t.integer  "dance_class_id", null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer  "role",                                 null: false
    t.string   "first_name",                           null: false
    t.string   "last_name",                            null: false
    t.string   "password_digest",                      null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "auth_token",           default: ""
    t.datetime "date_of_birth"
    t.string   "email"
    t.string   "phone"
    t.integer  "emergency_contact_id"
    t.integer  "gender",               default: 0
    t.boolean  "alumni",               default: false
    t.string   "bio"
    t.boolean  "archived",             default: false
    t.string   "imgUrl"
    t.index ["auth_token"], name: "index_users_on_auth_token", unique: true, using: :btree
  end

end
