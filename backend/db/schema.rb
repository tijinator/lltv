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

ActiveRecord::Schema.define(version: 20151215160205) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "parent_id"
    t.string   "name"
    t.integer  "rank"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "categories", ["name"], name: "index_categories_on_name", using: :btree
  add_index "categories", ["parent_id"], name: "index_categories_on_parent_id", using: :btree
  add_index "categories", ["rank"], name: "index_categories_on_rank", using: :btree
  add_index "categories", ["user_id"], name: "index_categories_on_user_id", using: :btree

  create_table "chapters", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title",                              null: false
    t.text     "description",                        null: false
    t.text     "image_url"
    t.text     "video_url"
    t.integer  "rank"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "ancestry"
    t.boolean  "published",          default: false, null: false
  end

  add_index "chapters", ["ancestry"], name: "index_chapters_on_ancestry", using: :btree
  add_index "chapters", ["description"], name: "index_chapters_on_description", using: :btree
  add_index "chapters", ["title"], name: "index_chapters_on_title", using: :btree

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
    t.string   "name"
    t.integer  "user_id"
    t.integer  "tagable_id"
    t.string   "tagable_type"
    t.integer  "rank"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "tags", ["tagable_type", "tagable_id"], name: "index_tags_on_tagable_type_and_tagable_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.integer  "role",                   default: 0,  null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "videos", force: :cascade do |t|
    t.text     "description"
    t.string   "video_url"
    t.integer  "videoable_id"
    t.string   "videoable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
