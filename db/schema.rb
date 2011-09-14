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

ActiveRecord::Schema.define(:version => 20110802224436) do

  create_table "papers", :force => true do |t|
    t.string   "title"
    t.string   "author"
    t.string   "coauthor"
    t.text     "resume"
    t.string   "key_words"
    t.integer  "paper_type"
    t.string   "artefact_file_name"
    t.string   "artefact_content_type"
    t.integer  "artefact_file_size"
    t.datetime "artefact_updated_at"
    t.integer  "culture_circle"
    t.integer  "registration_id",       :null => false
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "registrations", :force => true do |t|
    t.string   "name"
    t.string   "credential_name"
    t.string   "rg"
    t.string   "cpf"
    t.date     "dob"
    t.string   "zip_code"
    t.string   "address"
    t.string   "address_number"
    t.string   "address_complement"
    t.string   "district"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "phone"
    t.string   "mobile"
    t.string   "email"
    t.integer  "how_known"
    t.string   "unit"
    t.string   "unit_zip_code"
    t.string   "unit_address"
    t.string   "unit_address_number"
    t.string   "unit_address_complement"
    t.string   "unit_district"
    t.string   "unit_city"
    t.string   "unit_state"
    t.string   "unit_phone"
    t.string   "unit_fax"
    t.boolean  "disabilities"
    t.boolean  "send_any_work"
    t.boolean  "student"
    t.integer  "status"
    t.integer  "mode_of_payment"
    t.string   "total_hours_mandatory"
    t.float    "value"
    t.integer  "notificator_status"
    t.string   "disability_desc"
    t.string   "segment"
    t.string   "employee_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "perishable_token"
    t.string   "persistence_token"
    t.string   "email"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
