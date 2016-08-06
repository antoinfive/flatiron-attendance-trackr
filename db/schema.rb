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

ActiveRecord::Schema.define(version: 20160806012337) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendance_records", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "schedule_id"
    t.datetime "date"
    t.boolean  "arrived"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["schedule_id"], name: "index_attendance_records_on_schedule_id", using: :btree
    t.index ["user_id"], name: "index_attendance_records_on_user_id", using: :btree
  end

  create_table "cohorts", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "holidays", force: :cascade do |t|
    t.string   "name"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_cohorts", force: :cascade do |t|
    t.integer  "instructor_id"
    t.integer  "cohort_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["cohort_id"], name: "index_user_cohorts_on_cohort_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "github_username"
    t.string   "email"
    t.integer  "cohort_id"
    t.boolean  "instructor",      default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["cohort_id"], name: "index_users_on_cohort_id", using: :btree
  end

  add_foreign_key "user_cohorts", "cohorts"
end
