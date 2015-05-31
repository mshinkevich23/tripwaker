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

ActiveRecord::Schema.define(version: 20150214134238) do

  create_table "users", force: true do |t|
    t.string   "uid",          null: false
    t.string   "provider",     null: false
    t.string   "name"
    t.string   "email"
    t.string   "place"
    t.string   "picture"
    t.string   "link"
    t.text     "interests"
    t.text     "languages"
    t.boolean  "active_local"
    t.string   "day0"
    t.string   "day1"
    t.string   "day2"
    t.string   "day3"
    t.string   "day4"
    t.string   "day5"
    t.string   "day6"
    t.string   "day7"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
