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

ActiveRecord::Schema.define(:version => 20091104130505) do

  create_table "coverages", :force => true do |t|
    t.integer  "coverage"
    t.integer  "coverage_years"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.text     "address"
    t.string   "state"
    t.string   "city"
    t.string   "postal_code"
    t.float    "height"
    t.float    "weight"
    t.boolean  "is_smoker"
    t.string   "email_address"
    t.integer  "coverage_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end