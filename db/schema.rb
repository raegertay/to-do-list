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

ActiveRecord::Schema.define(version: 20171017072717) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "tasklists", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tasklists_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name", null: false
    t.date "due_date", null: false
    t.boolean "status", default: false, null: false
    t.bigint "tasklist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tasklist_id"], name: "index_tasks_on_tasklist_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "tasklists", "users"
  add_foreign_key "tasks", "tasklists"
end
