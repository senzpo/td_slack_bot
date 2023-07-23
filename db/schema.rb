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

  # Custom types defined in this database.
  # Note that some types may not work with other database engines. Be careful if changing database.
  create_enum "status_type", ["gitlab", "bitbucket"]

  create_table "bitbucket_pull_requests", id: :serial, force: :cascade do |t|
    t.string "title", null: false
    t.integer "issues", null: false
    t.string "state", null: false
    t.string "author", null: false
    t.datetime "created_on", null: false
    t.datetime "updated_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.integer "entity_id", null: false
    t.enum "entity", null: false, enum_type: "status_type"
    t.string "status", null: false
    t.datetime "created_at", null: false
    t.index ["entity_id", "entity"], name: "index_events_on_entity_id_and_entity", unique: true
  end

  create_table "gitlab_merge_requests", force: :cascade do |t|
    t.string "title", null: false
    t.integer "iid", null: false
    t.bigint "project_id", null: false
    t.string "state", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
