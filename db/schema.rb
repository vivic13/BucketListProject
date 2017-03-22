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

ActiveRecord::Schema.define(version: 20170322074501) do

  create_table "comments", force: :cascade do |t|
    t.text    "comment_body"
    t.integer "plan_id"
    t.string  "commenter"
    t.index ["plan_id"], name: "index_comments_on_plan_id"
  end

  create_table "donations", force: :cascade do |t|
    t.string   "cc_name"
    t.integer  "amount"
    t.integer  "cc_num"
    t.integer  "cc_last"
    t.date     "cc_duedate"
    t.integer  "plan_id"
    t.integer  "npo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["npo_id"], name: "index_donations_on_npo_id"
    t.index ["plan_id"], name: "index_donations_on_plan_id"
  end

  create_table "memberships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "plan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plan_id"], name: "index_memberships_on_plan_id"
    t.index ["user_id"], name: "index_memberships_on_user_id"
  end

  create_table "npos", force: :cascade do |t|
    t.integer  "npo_code"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plans", force: :cascade do |t|
    t.string   "title"
    t.date     "duedate"
    t.text     "plan"
    t.text     "do_what"
    t.text     "check"
    t.text     "act"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.boolean  "is_public",     default: false
    t.string   "file_location"
    t.string   "progress"
    t.string   "host"
    t.text     "why"
  end

  create_table "tag_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tag_plan_rps", force: :cascade do |t|
    t.integer  "plan_id"
    t.integer  "tag_category_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "nickname"
    t.string   "last_name"
    t.string   "fb_uid"
    t.string   "fb_token"
    t.string   "role"
    t.text     "introduction"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["fb_uid"], name: "index_users_on_fb_uid"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
