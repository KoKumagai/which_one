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

ActiveRecord::Schema.define(version: 20160112081234) do

  create_table "comments", force: :cascade do |t|
    t.integer  "survey_id",  null: false
    t.integer  "user_id",    null: false
    t.string   "content",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["survey_id"], name: "index_comments_on_survey_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "pictures", force: :cascade do |t|
    t.integer  "survey_id",    null: false
    t.integer  "picture_type", null: false
    t.string   "uri"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "pictures", ["picture_type"], name: "index_pictures_on_picture_type"
  add_index "pictures", ["survey_id"], name: "index_pictures_on_survey_id"

  create_table "surveys", force: :cascade do |t|
    t.integer  "user_id",         null: false
    t.string   "first_word",      null: false
    t.string   "second_word",     null: false
    t.string   "comparison_word", null: false
    t.integer  "sentence_type",   null: false
    t.integer  "category",        null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "surveys", ["user_id"], name: "index_surveys_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name",                              null: false
    t.string   "email",                             null: false
    t.string   "password_digest",                   null: false
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.string   "remember_digest"
    t.string   "activation_digest"
    t.boolean  "activated",         default: false, null: false
    t.datetime "activated_at"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "users", ["name"], name: "index_users_on_name", unique: true

  create_table "votes", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "survey_id",  null: false
    t.integer  "vote_type",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "votes", ["user_id", "survey_id"], name: "index_votes_on_user_id_and_survey_id"

end
