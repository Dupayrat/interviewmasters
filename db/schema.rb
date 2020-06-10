# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_06_10_150826) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.date "interview_date"
    t.integer "price_per_hour"
    t.integer "duration"
    t.bigint "interview_preparation_id", null: false
    t.bigint "user_id", null: false
    t.index ["interview_preparation_id"], name: "index_bookings_on_interview_preparation_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "candidate_works", force: :cascade do |t|
    t.string "question"
    t.text "answer"
    t.bigint "interview_preparation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["interview_preparation_id"], name: "index_candidate_works_on_interview_preparation_id"
  end

  create_table "challenges", force: :cascade do |t|
    t.string "name"
    t.string "statut"
    t.bigint "interview_preparation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["interview_preparation_id"], name: "index_challenges_on_interview_preparation_id"
  end

  create_table "hardskills", force: :cascade do |t|
    t.text "hard_skill"
    t.bigint "interview_preparation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["interview_preparation_id"], name: "index_hardskills_on_interview_preparation_id"
  end

  create_table "interview_preparations", force: :cascade do |t|
    t.string "company"
    t.string "job"
    t.date "interview_date"
    t.string "experience_expectation"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_interview_preparations_on_user_id"
  end

  create_table "missions", force: :cascade do |t|
    t.text "name"
    t.bigint "interview_preparation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["interview_preparation_id"], name: "index_missions_on_interview_preparation_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "role"
    t.string "skills"
    t.string "industry"
    t.string "image"
    t.string "description"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "interview_preparations"
  add_foreign_key "bookings", "users"
  add_foreign_key "candidate_works", "interview_preparations"
  add_foreign_key "challenges", "interview_preparations"
  add_foreign_key "hardskills", "interview_preparations"
  add_foreign_key "interview_preparations", "users"
  add_foreign_key "missions", "interview_preparations"
end
