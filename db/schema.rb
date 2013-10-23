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

ActiveRecord::Schema.define(version: 20131023003129) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applications", force: true do |t|
    t.integer  "candidate_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "complete",     default: false
    t.datetime "submitted_at"
  end

  add_index "applications", ["candidate_id"], name: "index_applications_on_candidate_id", using: :btree

  create_table "campaigns", force: true do |t|
    t.integer  "candidate_id"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "total"
    t.integer  "goal"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "current_campaign", default: false
  end

  add_index "campaigns", ["candidate_id"], name: "index_campaigns_on_candidate_id", using: :btree

  create_table "donations", force: true do |t|
    t.string   "token"
    t.integer  "amount"
    t.integer  "donor_id"
    t.integer  "campaign_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "donations", ["campaign_id"], name: "index_donations_on_campaign_id", using: :btree
  add_index "donations", ["donor_id"], name: "index_donations_on_donor_id", using: :btree

  create_table "media", force: true do |t|
    t.string   "url"
    t.string   "type"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "media", ["user_id"], name: "index_media_on_user_id", using: :btree

  create_table "nominations", force: true do |t|
    t.integer  "campaign_id"
    t.integer  "donor_id"
    t.integer  "candidate_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "nominations", ["campaign_id"], name: "index_nominations_on_campaign_id", using: :btree
  add_index "nominations", ["candidate_id"], name: "index_nominations_on_candidate_id", using: :btree
  add_index "nominations", ["donor_id"], name: "index_nominations_on_donor_id", using: :btree

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

  add_index "responses", ["application_id"], name: "index_responses_on_application_id", using: :btree
  add_index "responses", ["question_id"], name: "index_responses_on_question_id", using: :btree

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

  add_index "users", ["email"], name: "index_users_on_email", using: :btree

end
