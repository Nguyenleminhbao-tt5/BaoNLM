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

ActiveRecord::Schema[7.0].define(version: 2023_07_14_033121) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "albums", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.integer "mode", default: 0
    t.string "list_image"
    t.integer "list_like", default: [], array: true
    t.index ["user_id"], name: "index_albums_on_user_id"
  end

  create_table "follows", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "following_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photo_albums", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "photo_id", null: false
    t.bigint "album_id", null: false
    t.index ["album_id"], name: "index_photo_albums_on_album_id"
    t.index ["photo_id"], name: "index_photo_albums_on_photo_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.integer "mode", default: 0
    t.integer "list_like", default: [], array: true
    t.index ["user_id"], name: "index_photos_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.integer "user_type", default: 1
    t.string "fullname"
    t.integer "age"
    t.string "sex", default: "female"
    t.datetime "DoB"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "manage_id"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "fname"
    t.string "lname"
    t.string "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "albums", "users"
  add_foreign_key "follows", "users", column: "follower_id"
  add_foreign_key "follows", "users", column: "following_id"
  add_foreign_key "photo_albums", "albums"
  add_foreign_key "photo_albums", "photos"
  add_foreign_key "photos", "users"
  add_foreign_key "users", "users", column: "manage_id"
end
