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

ActiveRecord::Schema.define(version: 20180626144058) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "meditations", force: :cascade do |t|
    t.string "title"
    t.string "audio"
    t.datetime "start"
    t.boolean "session_public", default: true
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "lobby", array: true
    t.index ["lobby"], name: "index_meditations_on_lobby", using: :gin
    t.index ["user_id"], name: "index_meditations_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "meditation_id"
    t.string "translation_key"
    t.string "uuid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meditation_id"], name: "index_notifications_on_meditation_id"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "facebook_id"
    t.string "avatar"
    t.string "phone"
    t.index ["facebook_id"], name: "index_users_on_facebook_id"
  end

end
