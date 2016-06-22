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

ActiveRecord::Schema.define(version: 20160302020100) do

  create_table "browsers", :force => true, :comment => '操作系统类型' do |t|
    #t.column "id",   "int(11)",      :null => false, :comment => "AUTO_INCREMENT PRIMARY KEY by rails"
    t.column "code", "varchar(255)", :null => false, :comment => "内部引用代码"
    t.column "name", "varchar(255)",                 :comment => "显示名字"
  end

  add_index "browsers", ["code"], name: "index_browsers_on_code", unique: true, using: :btree

  create_table "origins", :force => true, :comment => '数据来源' do |t|
    #t.column "id",   "int(11)",      :null => false, :comment => "AUTO_INCREMENT PRIMARY KEY by rails"
    t.column "code", "varchar(255)", :null => false, :comment => "内部引用代码"
    t.column "name", "varchar(255)",                 :comment => "显示名字"
  end

  add_index "origins", ["code"], name: "index_origins_on_code", unique: true, using: :btree

  create_table "reports", :force => true, :comment => '报告' do |t|
    #t.column "id",              "int(11)",                       :null => false, :comment => "AUTO_INCREMENT PRIMARY KEY by rails"
    t.column "url",             "varchar(255)",                  :null => false, :comment => "钓鱼网站网址"
    t.column "loss",            "varchar(255)", :default => "0",                 :comment => "损失"
    t.column "region",          "varchar(255)",                                  :comment => ""
    t.column "origin_id",       "int(11)",                       :null => false, :comment => "数据来源引用"
    t.column "way_id",          "int(11)",                                       :comment => "传播方式引用"
    t.column "system_id",       "int(11)",                                       :comment => "操作系统类型引用"
    t.column "browser_id",      "int(11)",                                       :comment => "浏览器类型引用"
    t.column "disposer_id",     "int(11)",                                       :comment => "处理人引用"
    t.column "status_id",       "int(11)",      :default => 1,   :null => false, :comment => "状态引用"
    t.column "found_time",      "datetime",                      :null => false, :comment => "发现时间"
    t.column "report_time",     "datetime",                      :null => false, :comment => "报告时间"
    t.column "dispose_time",    "datetime",                                      :comment => "处理时间"
    t.column "finish_time",     "datetime",                                      :comment => "结束时间"
    t.column "screenshot",      "mediumblob",                                    :comment => "截图"
    t.column "screenshot_type", "varchar(255)",                                  :comment => ""
    t.column "created_at",      "datetime",                      :null => false, :comment => ""
    t.column "updated_at",      "datetime",                      :null => false, :comment => ""
  end

  add_index "reports", ["browser_id"], name: "fk_rails_c8ae57fdf1", using: :btree
  add_index "reports", ["disposer_id"], name: "fk_rails_1d127a16c7", using: :btree
  add_index "reports", ["origin_id"], name: "fk_rails_c44b45b8f2", using: :btree
  add_index "reports", ["status_id"], name: "fk_rails_53f7182c88", using: :btree
  add_index "reports", ["system_id"], name: "fk_rails_862054849d", using: :btree
  add_index "reports", ["way_id"], name: "fk_rails_b067cbe651", using: :btree

  create_table "roles", :force => true, :comment => '角色' do |t|
    #t.column "id",         "int(11)",      :null => false, :comment => "AUTO_INCREMENT PRIMARY KEY by rails"
    t.column "code",       "varchar(255)", :null => false, :comment => "内部引用代码"
    t.column "name",       "varchar(255)",                 :comment => "显示名字"
    t.column "created_at", "datetime",     :null => false, :comment => ""
    t.column "updated_at", "datetime",     :null => false, :comment => ""
  end

  add_index "roles", ["code"], name: "index_roles_on_code", unique: true, using: :btree

  create_table "statuses", :force => true, :comment => '处理状态' do |t|
    #t.column "id",     "int(11)",      :null => false, :comment => "AUTO_INCREMENT PRIMARY KEY by rails"
    t.column "code",   "varchar(255)", :null => false, :comment => "内部引用代码"
    t.column "name",   "varchar(255)",                 :comment => "显示名字"
    t.column "remark", "varchar(255)",                 :comment => "备注"
  end

  add_index "statuses", ["code"], name: "index_statuses_on_code", unique: true, using: :btree

  create_table "systems", :force => true, :comment => '操作系统类型' do |t|
    #t.column "id",   "int(11)",      :null => false, :comment => "AUTO_INCREMENT PRIMARY KEY by rails"
    t.column "code", "varchar(255)", :null => false, :comment => "内部引用代码"
    t.column "name", "varchar(255)",                 :comment => "显示名字"
  end

  add_index "systems", ["name"], name: "index_systems_on_name", unique: true, using: :btree

  create_table "users", :force => true, :comment => '用户' do |t|
    #t.column "id",         "int(11)",                         :null => false, :comment => "AUTO_INCREMENT PRIMARY KEY by rails"
    t.column "username",   "varchar(255)",                    :null => false, :comment => "用户名"
    t.column "password",   "varchar(255)",                    :null => false, :comment => "密码"
    t.column "name",       "varchar(255)",                                    :comment => "姓名"
    t.column "telephone",  "varchar(255)",                                    :comment => "电话"
    t.column "email",      "varchar(255)",                                    :comment => "邮箱"
    t.column "role_id",    "int(11)",                         :null => false, :comment => "角色引用"
    t.column "on_duty",    "tinyint(1)",   :default => false, :null => false, :comment => "是否值班"
    t.column "created_at", "datetime",                        :null => false, :comment => ""
    t.column "updated_at", "datetime",                        :null => false, :comment => ""
  end

  add_index "users", ["role_id"], name: "fk_rails_642f17018b", using: :btree
  add_index "users", ["username", "password"], name: "index_users_on_username_and_password", unique: true, using: :btree

  create_table "ways", :force => true, :comment => '传播方式' do |t|
    #t.column "id",   "int(11)",      :null => false, :comment => "AUTO_INCREMENT PRIMARY KEY by rails"
    t.column "code", "varchar(255)", :null => false, :comment => "内部引用代码"
    t.column "name", "varchar(255)",                 :comment => "显示名字"
  end

  add_index "ways", ["code"], name: "index_ways_on_code", unique: true, using: :btree

  create_table "whites", :force => true, :comment => '白名单' do |t|
    #t.column "id",          "int(11)",      :null => false, :comment => "AUTO_INCREMENT PRIMARY KEY by rails"
    t.column "url",         "varchar(255)", :null => false, :comment => "网址"
    t.column "disposer_id", "int(11)",      :null => false, :comment => "处理人"
    t.column "created_at",  "datetime",     :null => false, :comment => ""
    t.column "updated_at",  "datetime",     :null => false, :comment => ""
  end

  add_index "whites", ["disposer_id"], name: "fk_rails_315b1eb646", using: :btree
  add_index "whites", ["url"], name: "index_whites_on_url", unique: true, using: :btree

  add_foreign_key "reports", "browsers"
  add_foreign_key "reports", "origins"
  add_foreign_key "reports", "statuses"
  add_foreign_key "reports", "systems"
  add_foreign_key "reports", "users", column: "disposer_id"
  add_foreign_key "reports", "ways"
  add_foreign_key "users", "roles"
  add_foreign_key "whites", "users", column: "disposer_id"
end
