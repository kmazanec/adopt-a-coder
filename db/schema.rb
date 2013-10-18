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

ActiveRecord::Schema.define(version: 20131018192626) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applications", force: true do |t|
    t.integer  "candidate_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "complete",     default: false
  end

  create_table "campaigns", force: true do |t|
    t.integer  "candidate_id"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "total"
    t.integer  "goal"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "donations", force: true do |t|
    t.string   "token"
    t.integer  "amount"
    t.integer  "donor_id"
    t.integer  "campaign_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "media", force: true do |t|
    t.string   "url"
    t.string   "type"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nominations", force: true do |t|
    t.integer  "campaign_id"
    t.integer  "donor_id"
    t.integer  "candidate_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: true do |t|
    t.string   "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "responses", force: true do |t|
    t.integer  "question_id"
    t.integer  "application_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "name"
    t.string   "phone"
    t.string   "password_digest"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.string   "twitter"
    t.string   "facebook"
    t.string   "linked_in"
    t.string   "codeacademy"
    t.string   "github"
    t.string   "blog"
    t.string   "personal_url"
    t.text     "currently_working_on"
    t.text     "biography"
    t.text     "mission"
    t.integer  "profile_photo_id"
    t.integer  "profile_video_id"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
