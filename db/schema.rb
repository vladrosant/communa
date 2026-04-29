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

ActiveRecord::Schema[8.1].define(version: 2026_04_29_194305) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "activities", force: :cascade do |t|
    t.bigint "activity_type_id", null: false
    t.datetime "created_at", null: false
    t.date "date"
    t.decimal "hours"
    t.text "notes"
    t.bigint "organization_id", null: false
    t.integer "people_impacted"
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["activity_type_id"], name: "index_activities_on_activity_type_id"
    t.index ["organization_id"], name: "index_activities_on_organization_id"
  end

  create_table "activity_types", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "description"
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description"
    t.string "location"
    t.string "name"
    t.datetime "updated_at", null: false
    t.string "website"
  end

  add_foreign_key "activities", "activity_types"
  add_foreign_key "activities", "organizations"
end
