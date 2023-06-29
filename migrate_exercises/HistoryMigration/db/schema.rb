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

ActiveRecord::Schema[7.0].define(version: 2023_06_29_032843) do
  create_table "albums", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.integer "mode", default: 0
    t.index ["user_id"], name: "index_albums_on_user_id"
  end

  create_table "follwers", force: :cascade do |t|
    t.integer "follwer_id"
    t.integer "be_follower_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photo_albums", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "photo_id", null: false
    t.integer "album_id", null: false
    t.index ["album_id"], name: "index_photo_albums_on_album_id"
    t.index ["photo_id"], name: "index_photo_albums_on_photo_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.integer "mode", default: 0
    t.index ["user_id"], name: "index_photos_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "type"
    t.string "fullname"
    t.decimal "age"
    t.string "sex"
    t.datetime "DoB"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "manage_id"
  end

  add_foreign_key "albums", "users"
  add_foreign_key "follwers", "users", column: "be_follower_id"
  add_foreign_key "follwers", "users", column: "follwer_id"
  add_foreign_key "photo_albums", "albums"
  add_foreign_key "photo_albums", "photos"
  add_foreign_key "photos", "users"
  add_foreign_key "users", "users", column: "manage_id"
end
