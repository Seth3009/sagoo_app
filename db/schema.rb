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

ActiveRecord::Schema.define(version: 20180505034035) do

  create_table "additional_incomes", force: :cascade do |t|
    t.date     "add_month"
    t.string   "name"
    t.decimal  "amount"
    t.integer  "employee_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "additional_incomes", ["employee_id"], name: "index_additional_incomes_on_employee_id"

  create_table "attendances", force: :cascade do |t|
    t.date     "att_month"
    t.integer  "day_count"
    t.integer  "group_roster_id"
    t.integer  "employee_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "attendances", ["employee_id"], name: "index_attendances_on_employee_id"
  add_index "attendances", ["group_roster_id"], name: "index_attendances_on_group_roster_id"

  create_table "detail_kasbons", force: :cascade do |t|
    t.date     "tanggal_bayar"
    t.decimal  "jumlah_bayar"
    t.decimal  "sisa"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "kasbon_id"
  end

  add_index "detail_kasbons", ["kasbon_id"], name: "index_detail_kasbons_on_kasbon_id"

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
    t.string   "gp"
  end

  create_table "golongans", force: :cascade do |t|
    t.string   "nama"
    t.decimal  "gaji"
    t.text     "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "group_rosters", force: :cascade do |t|
    t.integer  "roster_id"
    t.decimal  "amount"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "golongan_id"
  end

  add_index "group_rosters", ["golongan_id"], name: "index_group_rosters_on_golongan_id"
  add_index "group_rosters", ["roster_id"], name: "index_group_rosters_on_roster_id"

  create_table "kasbons", force: :cascade do |t|
    t.string   "nama"
    t.date     "tanggal_pinjam"
    t.decimal  "jumlah_pinjam"
    t.string   "tanggal_bayar"
    t.decimal  "jumlah_bayar"
    t.decimal  "sisa"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "employee_id"
  end

  add_index "kasbons", ["employee_id"], name: "index_kasbons_on_employee_id"

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
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "golongan_id"
  end

  add_index "position_groups", ["golongan_id"], name: "index_position_groups_on_golongan_id"

  create_table "potongan_employees", force: :cascade do |t|
    t.date     "pot_month"
    t.integer  "employee_id"
    t.integer  "kasbon_id"
    t.decimal  "amount",        default: 0.0
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "nama_potongan"
  end

  add_index "potongan_employees", ["employee_id"], name: "index_potongan_employees_on_employee_id"
  add_index "potongan_employees", ["kasbon_id"], name: "index_potongan_employees_on_kasbon_id"

  create_table "potongans", force: :cascade do |t|
    t.string   "nama"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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

  create_table "roster_groups", force: :cascade do |t|
    t.integer  "roster_id"
    t.integer  "resto_id"
    t.decimal  "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "roster_groups", ["resto_id"], name: "index_roster_groups_on_resto_id"
  add_index "roster_groups", ["roster_id"], name: "index_roster_groups_on_roster_id"

  create_table "rosters", force: :cascade do |t|
    t.string   "hari"
    t.string   "detail"
    t.text     "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "tipe"
  end

  create_table "salaries", force: :cascade do |t|
    t.date     "salary_period"
    t.integer  "employee_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "salaries", ["employee_id"], name: "index_salaries_on_employee_id"

  create_table "take_homes", force: :cascade do |t|
    t.integer  "employee_id"
    t.date     "pay_month"
    t.decimal  "salary"
    t.decimal  "add_income"
    t.decimal  "sal_cut"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "take_homes", ["employee_id"], name: "index_take_homes_on_employee_id"

end
