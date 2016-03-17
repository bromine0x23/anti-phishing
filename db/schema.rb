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

ActiveRecord::Schema.define(version: 20160302020000) do

  create_table "browsers", force: :cascade do |t|
    t.string "code", limit: 255
    t.string "name", limit: 255
  end

  add_index "browsers", ["code"], name: "index_browsers_on_code", unique: true, using: :btree

  create_table "origins", force: :cascade do |t|
    t.string "code", limit: 255
    t.string "name", limit: 255
  end

  add_index "origins", ["code"], name: "index_origins_on_code", unique: true, using: :btree

  create_table "permissions", force: :cascade do |t|
    t.string   "code",       limit: 255
    t.string   "name",       limit: 255
    t.string   "remark",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "permissions", ["code"], name: "index_permissions_on_code", unique: true, using: :btree

  create_table "reports", force: :cascade do |t|
    t.string   "url",          limit: 255,        null: false
    t.string   "loss",         limit: 255
    t.string   "region",       limit: 255
    t.integer  "origin_id",    limit: 4,          null: false
    t.integer  "way_id",       limit: 4
    t.integer  "system_id",    limit: 4
    t.integer  "browser_id",   limit: 4
    t.integer  "disposer_id",  limit: 4,          null: false
    t.integer  "status_id",    limit: 4,          null: false
    t.datetime "found_time"
    t.datetime "report_time"
    t.datetime "dispose_time"
    t.datetime "finish_time"
    t.binary   "screenshot",   limit: 4294967295
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "reports", ["browser_id"], name: "fk_rails_c8ae57fdf1", using: :btree
  add_index "reports", ["disposer_id"], name: "index_reports_on_disposer_id", using: :btree
  add_index "reports", ["origin_id"], name: "fk_rails_c44b45b8f2", using: :btree
  add_index "reports", ["status_id"], name: "fk_rails_53f7182c88", using: :btree
  add_index "reports", ["system_id"], name: "fk_rails_862054849d", using: :btree
  add_index "reports", ["way_id"], name: "fk_rails_b067cbe651", using: :btree

  create_table "role_permissions", force: :cascade do |t|
    t.integer  "role_id",       limit: 4
    t.integer  "permission_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "role_permissions", ["permission_id"], name: "fk_rails_439e640a3f", using: :btree
  add_index "role_permissions", ["role_id"], name: "fk_rails_60126080bd", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "code",       limit: 255
    t.string   "name",       limit: 255
    t.string   "remark",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "roles", ["code"], name: "index_roles_on_code", unique: true, using: :btree

  create_table "statuses", force: :cascade do |t|
    t.string "code",   limit: 255
    t.string "name",   limit: 255
    t.string "remark", limit: 255
  end

  add_index "statuses", ["code"], name: "index_statuses_on_code", unique: true, using: :btree

  create_table "systems", force: :cascade do |t|
    t.string "code", limit: 255
    t.string "name", limit: 255
  end

  add_index "systems", ["name"], name: "index_systems_on_name", unique: true, using: :btree

  create_table "user_roles", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "role_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "user_roles", ["role_id"], name: "fk_rails_3369e0d5fc", using: :btree
  add_index "user_roles", ["user_id"], name: "fk_rails_318345354e", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",   limit: 255
    t.string   "password",   limit: 255
    t.string   "name",       limit: 255
    t.string   "telephone",  limit: 255
    t.string   "email",      limit: 255
    t.boolean  "on_duty",                default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "users", ["username", "password"], name: "index_users_on_username_and_password", unique: true, using: :btree

  create_table "ways", force: :cascade do |t|
    t.string "code", limit: 255
    t.string "name", limit: 255
  end

  add_index "ways", ["name"], name: "index_ways_on_name", unique: true, using: :btree

  add_foreign_key "reports", "browsers"
  add_foreign_key "reports", "origins"
  add_foreign_key "reports", "statuses"
  add_foreign_key "reports", "systems"
  add_foreign_key "reports", "users", column: "disposer_id"
  add_foreign_key "reports", "ways"
  add_foreign_key "role_permissions", "permissions"
  add_foreign_key "role_permissions", "roles"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
end
