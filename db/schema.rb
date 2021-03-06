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

ActiveRecord::Schema.define(version: 2019_04_01_152830) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "core_genders", force: :cascade do |t|
    t.string "identity"
    t.string "display"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "core_name_types", force: :cascade do |t|
    t.string "identity"
    t.string "display"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "core_sexes", force: :cascade do |t|
    t.string "identity"
    t.string "display"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "person_demographies", force: :cascade do |t|
    t.date "birthdate"
    t.date "alt_birthdate"
    t.string "gender_description"
    t.bigint "person_id"
    t.bigint "core_sex_id"
    t.bigint "core_gender_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["core_gender_id"], name: "index_person_demographies_on_core_gender_id"
    t.index ["core_sex_id"], name: "index_person_demographies_on_core_sex_id"
    t.index ["person_id"], name: "index_person_demographies_on_person_id"
  end

  create_table "person_names", force: :cascade do |t|
    t.string "first"
    t.string "middle"
    t.string "last"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "person_id"
    t.bigint "core_name_type_id"
    t.index ["core_name_type_id"], name: "index_person_names_on_core_name_type_id"
    t.index ["person_id"], name: "index_person_names_on_person_id"
  end

  create_table "person_photos", force: :cascade do |t|
    t.binary "image"
    t.boolean "current"
    t.bigint "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "mime_type"
    t.string "filename"
    t.index ["person_id"], name: "index_person_photos_on_person_id"
  end

  add_foreign_key "person_demographies", "core_genders"
  add_foreign_key "person_demographies", "core_sexes"
  add_foreign_key "person_demographies", "people"
  add_foreign_key "person_names", "core_name_types"
  add_foreign_key "person_names", "people"
  add_foreign_key "person_photos", "people"
end
