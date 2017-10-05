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

ActiveRecord::Schema.define(version: 20171004164151) do

  create_table "admins", force: :cascade do |t|
    t.string "adm_password"
    t.integer "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_admins_on_person_id", unique: true
  end

  create_table "coaches", force: :cascade do |t|
    t.integer "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_coaches_on_person_id", unique: true
  end

  create_table "diseases", force: :cascade do |t|
    t.string "name_disease"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "diseases_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "disease_id", null: false
  end

  create_table "exercises", force: :cascade do |t|
    t.string "name_exercise"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.integer "age"
    t.string "gender"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "restrictions", force: :cascade do |t|
    t.string "name_restriction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "specialities", force: :cascade do |t|
    t.integer "coach_id"
    t.string "name_speciality"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coach_id", "name_speciality"], name: "index_specialities_on_coach_id_and_name_speciality", unique: true
    t.index ["coach_id"], name: "index_specialities_on_coach_id"
  end

  create_table "user_diseases", force: :cascade do |t|
    t.integer "user_id"
    t.integer "disease_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["disease_id"], name: "index_user_diseases_on_disease_id"
    t.index ["user_id", "disease_id"], name: "index_user_diseases_on_user_id_and_disease_id", unique: true
    t.index ["user_id"], name: "index_user_diseases_on_user_id"
  end

  create_table "user_do_workouts", force: :cascade do |t|
    t.integer "user_id"
    t.integer "workout_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "workout_id"], name: "index_user_do_workouts_on_user_id_and_workout_id", unique: true
    t.index ["user_id"], name: "index_user_do_workouts_on_user_id"
    t.index ["workout_id"], name: "index_user_do_workouts_on_workout_id"
  end

  create_table "user_restrictions", force: :cascade do |t|
    t.integer "user_id"
    t.integer "restriction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restriction_id"], name: "index_user_restrictions_on_restriction_id"
    t.index ["user_id", "restriction_id"], name: "index_user_restrictions_on_user_id_and_restriction_id", unique: true
    t.index ["user_id"], name: "index_user_restrictions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.integer "person_id"
    t.integer "level"
    t.integer "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_users_on_person_id", unique: true
  end

  create_table "workout_composes", force: :cascade do |t|
    t.integer "set"
    t.integer "repetition"
    t.string "technique"
    t.integer "exercise_id"
    t.integer "workout_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exercise_id"], name: "index_workout_composes_on_exercise_id"
    t.index ["workout_id", "exercise_id"], name: "index_workout_composes_on_workout_id_and_exercise_id", unique: true
    t.index ["workout_id"], name: "index_workout_composes_on_workout_id"
  end

  create_table "workouts", force: :cascade do |t|
    t.integer "coach_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coach_id"], name: "index_workouts_on_coach_id"
  end

end
