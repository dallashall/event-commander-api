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

ActiveRecord::Schema.define(version: 20170420235613) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "detail_assignments", force: :cascade do |t|
    t.integer  "team_id"
    t.integer  "detail_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["detail_id"], name: "index_detail_assignments_on_detail_id", using: :btree
    t.index ["team_id"], name: "index_detail_assignments_on_team_id", using: :btree
  end

  create_table "details", force: :cascade do |t|
    t.integer  "task_id",    null: false
    t.text     "text",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_details_on_task_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.string   "title",      null: false
    t.date     "event_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_events_on_user_id", using: :btree
  end

  create_table "statuses", force: :cascade do |t|
    t.integer  "team_member_id",             null: false
    t.integer  "detail_id",                  null: false
    t.integer  "confirmed",      default: 0, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "order",      null: false
    t.integer  "event_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_tasks_on_event_id", using: :btree
  end

  create_table "team_members", force: :cascade do |t|
    t.string   "email",            null: false
    t.string   "name",             null: false
    t.string   "single_use_token", null: false
    t.integer  "team_id",          null: false
    t.string   "auth_token"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["auth_token"], name: "index_team_members_on_auth_token", using: :btree
    t.index ["single_use_token"], name: "index_team_members_on_single_use_token", using: :btree
  end

  create_table "teams", force: :cascade do |t|
    t.integer  "event_id",   null: false
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_teams_on_event_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",        null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "auth_token"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["auth_token"], name: "index_users_on_auth_token", using: :btree
  end

end
