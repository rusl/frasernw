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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110905071031) do

  create_table "attendances", :force => true do |t|
    t.integer   "specialist_id"
    t.integer   "clinic_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "capacities", :force => true do |t|
    t.integer   "specialist_id"
    t.integer   "procedure_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "clinics", :force => true do |t|
    t.string   "name"
    t.string   "address1"
    t.string   "address2"
    t.string   "postalcode"
    t.string   "city"
    t.string   "province"
    t.string   "phone1"
    t.string   "fax"
    t.text     "status"
    t.text     "interest"
    t.integer  "waittime"
    t.integer  "specialization_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "referral_criteria"
    t.text     "referral_process"
    t.string   "responds_via"
  end

  create_table "favorites", :force => true do |t|
    t.integer   "user_id"
    t.integer   "specialist_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "focuses", :force => true do |t|
    t.integer  "clinic_id"
    t.integer  "procedure_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hospitals", :force => true do |t|
    t.string    "name"
    t.string    "address1"
    t.string    "address2"
    t.string    "postalcode"
    t.string    "city"
    t.string    "province"
    t.string    "phone1"
    t.string    "fax"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "privileges", :force => true do |t|
    t.integer   "specialist_id"
    t.integer   "hospital_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "procedures", :force => true do |t|
    t.string    "name"
    t.integer   "specialization_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "specialists", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "address1"
    t.string   "address2"
    t.string   "postalcode"
    t.string   "city"
    t.string   "province"
    t.string   "phone1"
    t.string   "fax"
    t.text     "status"
    t.text     "interest"
    t.integer  "waittime"
    t.integer  "specialization_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "direct_phone"
    t.string   "moa_name"
    t.string   "moa_phone"
    t.string   "moa_email"
    t.text     "red_flags"
    t.string   "responds_via"
    t.string   "referral_criteria"
  end

  create_table "specializations", :force => true do |t|
    t.string    "name"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string    "username"
    t.string    "email"
    t.string    "persistence_token"
    t.string    "crypted_password"
    t.string    "password_salt"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "name"
    t.string    "role"
  end

  create_table "versions", :force => true do |t|
    t.string   "item_type",  :null => false
    t.integer  "item_id",    :null => false
    t.string   "event",      :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], :name => "index_versions_on_item_type_and_item_id"

end
