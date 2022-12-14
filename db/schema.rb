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

ActiveRecord::Schema[7.0].define(version: 2022_10_25_174733) do
  create_table "hashtag_questions", force: :cascade do |t|
    t.integer "hashtag_id", null: false
    t.integer "question_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hashtag_id", "question_id"], name: "index_hashtag_questions_on_hashtag_id_and_question_id", unique: true
    t.index ["hashtag_id"], name: "index_hashtag_questions_on_hashtag_id"
    t.index ["question_id"], name: "index_hashtag_questions_on_question_id"
  end

  create_table "hashtags", force: :cascade do |t|
    t.string "text", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["text"], name: "index_hashtags_on_text", unique: true
  end

  create_table "questions", force: :cascade do |t|
    t.text "body"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "hidden", default: false
    t.string "answer"
    t.integer "author_id"
    t.index ["author_id"], name: "index_questions_on_author_id"
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "color_preferences", default: "#370617"
    t.string "nickname"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["name"], name: "index_users_on_name"
    t.index ["nickname"], name: "index_users_on_nickname", unique: true
  end

  add_foreign_key "hashtag_questions", "hashtags"
  add_foreign_key "hashtag_questions", "questions"
  add_foreign_key "questions", "users", column: "author_id"
end
