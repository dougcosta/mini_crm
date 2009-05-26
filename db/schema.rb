# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090519145440) do

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "home_page"
    t.integer  "main_contact_id"
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "changer_id"
    t.string   "creator_type"
    t.string   "changer_type"
  end

  create_table "contacts", :force => true do |t|
    t.string   "name"
    t.date     "since"
    t.string   "email"
    t.string   "email1"
    t.string   "email2"
    t.string   "home_page"
    t.text     "description"
    t.string   "address"
    t.string   "address2"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "changer_id"
    t.string   "creator_type"
    t.string   "changer_type"
  end

  create_table "events", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "contact_id"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "changer_id"
    t.string   "creator_type"
    t.string   "changer_type"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "login"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "crypted_password", :limit => 40
  end

end
