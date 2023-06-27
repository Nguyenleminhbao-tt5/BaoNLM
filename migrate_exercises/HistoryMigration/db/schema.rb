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

ActiveRecord::Schema[7.0].define(version: 2023_06_27_062525) do
  create_table "albums", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "photo_id", null: false
    t.index ["photo_id"], name: "index_albums_on_photo_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "status"
    t.string "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_photos", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.integer "photo_id", null: false
    t.index ["photo_id"], name: "index_user_photos_on_photo_id"
    t.index ["user_id"], name: "index_user_photos_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "type"
    t.string "fullname"
    t.string "sex"
    t.datetime "DoB"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "age"
    t.integer "album_id", null: false
    t.index ["album_id"], name: "index_users_on_album_id"
  end

  add_foreign_key "albums", "photos"
  add_foreign_key "user_photos", "photos"
  add_foreign_key "user_photos", "users"
  add_foreign_key "users", "albums"
end
