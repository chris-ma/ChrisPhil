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

ActiveRecord::Schema.define(version: 20150112054054) do

  create_table "answers", force: :cascade do |t|
    t.integer  "question_id"
    t.string   "content"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "embedcards", force: :cascade do |t|
    t.string   "provider_url"
    t.string   "description"
    t.string   "title"
    t.string   "author_name"
    t.integer  "height"
    t.integer  "width"
    t.string   "html"
    t.integer  "thumbnail_width"
    t.string   "provider_name"
    t.string   "duration"
    t.string   "thumbnail_url"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "media"
  end

  create_table "learnlists", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "public"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "lesson_learnlists", force: :cascade do |t|
    t.integer  "lesson_id"
    t.integer  "learnlist_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "lessons", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "public"
    t.integer  "length"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "questions", force: :cascade do |t|
    t.integer  "survey_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quizzes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "youtubes", force: :cascade do |t|
    t.string   "link"
    t.string   "title"
    t.string   "author"
    t.string   "duration"
    t.integer  "likes"
    t.integer  "dislikes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "uid"
  end

  add_index "youtubes", ["uid"], name: "index_youtubes_on_uid"

end
