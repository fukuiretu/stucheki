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

ActiveRecord::Schema.define(version: 20140906092358) do

  create_table "cheki_events", force: true do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.integer  "cheki_status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.integer  "service_type"
    t.string   "title"
    t.string   "tag"
    t.datetime "started_at"
    t.datetime "ended_at"
    t.string   "place"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "service_event_id"
  end

  create_table "information", force: true do |t|
    t.string   "message"
    t.integer  "disable"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", force: true do |t|
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "screen_name"
    t.string   "screen_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
