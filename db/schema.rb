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

ActiveRecord::Schema.define(:version => 20120301032805) do

  create_table "airports", :force => true do |t|
    t.string   "city"
    t.string   "code"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
  end

  add_index "airports", ["city"], :name => "index_airports_on_city"
  add_index "airports", ["code"], :name => "index_airports_on_code"

  create_table "flights", :force => true do |t|
    t.integer  "departure_airport_id"
    t.integer  "arrival_airport_id"
    t.string   "number"
    t.time     "departs_at"
    t.integer  "distance"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "flights", ["arrival_airport_id"], :name => "index_flights_on_arrival_airport_id"
  add_index "flights", ["departs_at"], :name => "index_flights_on_departs_at"
  add_index "flights", ["departure_airport_id"], :name => "index_flights_on_departure_airport_id"
  add_index "flights", ["distance"], :name => "index_flights_on_distance"
  add_index "flights", ["number"], :name => "index_flights_on_number"

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
