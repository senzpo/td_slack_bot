# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_07_20_083915) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bitbucket_pull_request_events", force: :cascade do |t|
    t.bigint "bitbucket_pull_request_id"
    t.string "status", null: false
    t.datetime "produced_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bitbucket_pull_request_id"], name: "fk_bitbucket_pull_request"
  end

  create_table "bitbucket_pull_requests", force: :cascade do |t|
    t.integer "external_id", null: false
    t.string "title", null: false
    t.string "state", null: false
    t.string "display_name", null: false
    t.datetime "created_on", null: false
    t.datetime "updated_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["external_id"], name: "index_bitbucket_pull_requests_on_external_id", unique: true
  end

  create_table "gitlab_merge_requests", force: :cascade do |t|
    t.string "title", null: false
    t.integer "iid", null: false
    t.bigint "project_id", null: false
    t.string "state", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bitbucket_pull_request_events", "bitbucket_pull_requests"
end
