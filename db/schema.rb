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

ActiveRecord::Schema.define(version: 20151124171912) do

  create_table "anime_programs", force: :cascade do |t|
    t.integer  "pid",          limit: 4
    t.integer  "tid",          limit: 4
    t.datetime "st_time"
    t.integer  "st_offset",    limit: 4
    t.datetime "ed_time"
    t.integer  "story",        limit: 4
    t.string   "sub_title",    limit: 255
    t.text     "prog_comment", limit: 65535
    t.integer  "flag",         limit: 4
    t.integer  "deleted",      limit: 4
    t.integer  "warn",         limit: 4
    t.integer  "ch_id",        limit: 4
    t.integer  "revision",     limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "anime_staff_relates", force: :cascade do |t|
    t.integer  "tid",           limit: 4
    t.integer  "staff_id",      limit: 4
    t.integer  "staff_roll_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "anime_staff_rolls", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "name_yomi",  limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "anime_staffs", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "name_yomi",  limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "option",     limit: 255
  end

  create_table "anime_sub_titles", force: :cascade do |t|
    t.integer  "tid",        limit: 4
    t.integer  "story",      limit: 4
    t.string   "sub_title",  limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "anime_titles", force: :cascade do |t|
    t.integer  "tid",             limit: 4
    t.string   "title",           limit: 255
    t.string   "short_title",     limit: 255
    t.string   "title_yomi",      limit: 255
    t.string   "title_en",        limit: 255
    t.text     "comment",         limit: 65535
    t.integer  "cat",             limit: 4
    t.integer  "title_flag",      limit: 4
    t.integer  "first_year",      limit: 4
    t.integer  "first_month",     limit: 4
    t.integer  "first_end_year",  limit: 4
    t.integer  "first_end_month", limit: 4
    t.integer  "first_chid",      limit: 4
    t.string   "keywords",        limit: 255
    t.integer  "user_point",      limit: 4
    t.integer  "user_point_rank", limit: 4
    t.datetime "last_update"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "animes", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "url",        limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
