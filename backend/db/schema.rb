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

ActiveRecord::Schema.define(version: 20160216163404) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "parent_id"
    t.string   "title"
    t.text     "details"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "html_tab_id"
    t.string   "html_tab_color"
    t.string   "html_color"
    t.integer  "homepage_position"
    t.string   "small_image_url"
    t.string   "banner_url"
  end

  add_index "categories", ["details"], name: "index_categories_on_details", using: :btree
  add_index "categories", ["parent_id"], name: "index_categories_on_parent_id", using: :btree
  add_index "categories", ["title"], name: "index_categories_on_title", using: :btree
  add_index "categories", ["user_id"], name: "index_categories_on_user_id", using: :btree

  create_table "chapters", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.string   "title",      null: false
    t.text     "details",    null: false
    t.integer  "duration"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "chapters", ["details"], name: "index_chapters_on_details", using: :btree
  add_index "chapters", ["title"], name: "index_chapters_on_title", using: :btree

  create_table "courses", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "author_id"
    t.string   "level"
    t.string   "title",                       null: false
    t.text     "details",                     null: false
    t.integer  "duration"
    t.integer  "position"
    t.boolean  "published",   default: false, null: false
    t.datetime "released_on"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "banner_url"
    t.boolean  "featured",    default: false, null: false
  end

  add_index "courses", ["details"], name: "index_courses_on_details", using: :btree
  add_index "courses", ["title"], name: "index_courses_on_title", using: :btree

  create_table "item_categories", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "categorizable_id"
    t.string   "categorizable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "item_categories", ["categorizable_id", "categorizable_type", "category_id"], name: "item_categories_index", unique: true, using: :btree
  add_index "item_categories", ["categorizable_type", "category_id"], name: "item_type_categories_index", using: :btree

  create_table "item_tags", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "item_tags", ["taggable_id", "taggable_type", "tag_id"], name: "item_tags_index", unique: true, using: :btree
  add_index "item_tags", ["taggable_type", "tag_id"], name: "item_type_tags_index", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "title"
    t.integer  "user_id"
    t.integer  "tagable_id"
    t.string   "tagable_type"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tags", ["tagable_type", "tagable_id"], name: "index_tags_on_tagable_type_and_tagable_id", using: :btree
  add_index "tags", ["title"], name: "index_tags_on_title", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "username"
    t.integer  "role",                   default: 0,       null: false
    t.json     "tokens"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree

  create_table "videos", force: :cascade do |t|
    t.integer  "chapter_id"
    t.string   "video_url"
    t.string   "title"
    t.text     "details"
    t.text     "transcript"
    t.text     "faqs"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "videos", ["chapter_id"], name: "index_videos_on_chapter_id", using: :btree
  add_index "videos", ["details"], name: "index_videos_on_details", using: :btree
  add_index "videos", ["faqs"], name: "index_videos_on_faqs", using: :btree
  add_index "videos", ["title"], name: "index_videos_on_title", using: :btree
  add_index "videos", ["transcript"], name: "index_videos_on_transcript", using: :btree

end
