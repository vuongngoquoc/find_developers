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

ActiveRecord::Schema.define(version: 20180403035116) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dev_langs", force: :cascade do |t|
    t.bigint "developers_id"
    t.bigint "languages_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["developers_id"], name: "index_dev_langs_on_developers_id"
    t.index ["languages_id"], name: "index_dev_langs_on_languages_id"
  end

  create_table "dev_programs", force: :cascade do |t|
    t.bigint "developers_id"
    t.bigint "programming_languages_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["developers_id"], name: "index_dev_programs_on_developers_id"
    t.index ["programming_languages_id"], name: "index_dev_programs_on_programming_languages_id"
  end

  create_table "developers", force: :cascade do |t|
    t.string "name"
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_developers_on_email", unique: true
  end

  create_table "languages", force: :cascade do |t|
    t.string "code", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_languages_on_code", unique: true
  end

  create_table "programming_languages", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_programming_languages_on_name", unique: true
  end

  add_foreign_key "dev_langs", "developers", column: "developers_id"
  add_foreign_key "dev_langs", "languages", column: "languages_id"
  add_foreign_key "dev_programs", "developers", column: "developers_id"
  add_foreign_key "dev_programs", "programming_languages", column: "programming_languages_id"
end
