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

ActiveRecord::Schema.define(version: 2020_11_18_121625) do

  create_table "challenges", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.string "description"
    t.integer "end_goal"
    t.integer "winner_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["winner_id"], name: "index_challenges_on_winner_id"
  end

  create_table "check_ins", force: :cascade do |t|
    t.string "duration"
    t.string "learnings"
    t.integer "practice_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["practice_id"], name: "index_check_ins_on_practice_id"
  end

  create_table "old_tokens", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "practice_challenges", force: :cascade do |t|
    t.string "total_duration", default: "0"
    t.integer "practice_id", null: false
    t.integer "challenge_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["challenge_id"], name: "index_practice_challenges_on_challenge_id"
    t.index ["practice_id"], name: "index_practice_challenges_on_practice_id"
  end

  create_table "practices", force: :cascade do |t|
    t.string "title"
    t.integer "goal"
    t.string "time_type"
    t.float "total_duration", default: 0.0
    t.date "start_date"
    t.integer "current_period_duration"
    t.integer "skill_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["skill_id"], name: "index_practices_on_skill_id"
    t.index ["user_id"], name: "index_practices_on_user_id"
  end

  create_table "skill_categories", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "skill_category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["skill_category_id"], name: "index_skills_on_skill_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "challenges", "users", column: "winner_id"
  add_foreign_key "check_ins", "practices"
  add_foreign_key "practice_challenges", "challenges"
  add_foreign_key "practice_challenges", "practices"
  add_foreign_key "practices", "skills"
  add_foreign_key "practices", "users"
  add_foreign_key "skills", "skill_categories"
end


