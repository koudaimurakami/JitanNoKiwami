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

ActiveRecord::Schema.define(version: 2024_05_15_151610) do

  create_table "categories", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", limit: 30, null: false
    t.text "description", size: :tiny, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "category_question_choices", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "category_quiz_question_id", null: false
    t.text "content", size: :tiny, null: false
    t.boolean "is_correct", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_quiz_question_id"], name: "index_category_question_choices_on_category_quiz_question_id"
  end

  create_table "category_quiz_questions", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.text "content", size: :tiny, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_category_quiz_questions_on_category_id"
  end

  create_table "user_answers", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "category_quiz_question_id", null: false
    t.bigint "category_question_choice_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "session_identifier"
    t.index ["category_question_choice_id"], name: "index_user_answers_on_category_question_choice_id"
    t.index ["category_quiz_question_id"], name: "index_user_answers_on_category_quiz_question_id"
    t.index ["user_id"], name: "index_user_answers_on_user_id"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "category_question_choices", "category_quiz_questions"
  add_foreign_key "category_quiz_questions", "categories"
  add_foreign_key "user_answers", "category_question_choices"
  add_foreign_key "user_answers", "category_quiz_questions"
  add_foreign_key "user_answers", "users"
end
