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

ActiveRecord::Schema.define(version: 20171228044329) do

  create_table "employees", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.string   "acc_no"
    t.string   "pob"
    t.date     "dob"
    t.date     "work_started"
    t.date     "work_end"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.decimal  "salary"
    t.text     "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "position_groups", force: :cascade do |t|
    t.string   "name"
    t.text     "note"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "position_groups", ["group_id"], name: "index_position_groups_on_group_id"

  create_table "restos", force: :cascade do |t|
    t.date     "started"
    t.date     "ended"
    t.integer  "employee_id"
    t.integer  "position_group_id"
    t.integer  "location_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "restos", ["employee_id"], name: "index_restos_on_employee_id"
  add_index "restos", ["location_id"], name: "index_restos_on_location_id"
  add_index "restos", ["position_group_id"], name: "index_restos_on_position_group_id"

  create_table "rosters", force: :cascade do |t|
    t.string   "hari"
    t.string   "detail"
    t.text     "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
