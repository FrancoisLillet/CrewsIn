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

ActiveRecord::Schema[7.0].define(version: 2022_11_29_162428) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "enrollments", force: :cascade do |t|
    t.bigint "mate_id", null: false
    t.bigint "trip_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mate_id"], name: "index_enrollments_on_mate_id"
    t.index ["trip_id"], name: "index_enrollments_on_trip_id"
  end

  create_table "experiences", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "country"
    t.string "sailing_area"
    t.date "start_date"
    t.date "end_date"
    t.string "role"
    t.integer "number_of_miles"
    t.string "boat_type"
    t.integer "boat_length"
    t.string "boat_model"
    t.string "boat_owner"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "comment"
    t.index ["user_id"], name: "index_experiences_on_user_id"
  end

  create_table "invitations", force: :cascade do |t|
    t.bigint "sender_id", null: false
    t.bigint "receiver_id", null: false
    t.bigint "trip_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["receiver_id"], name: "index_invitations_on_receiver_id"
    t.index ["sender_id"], name: "index_invitations_on_sender_id"
    t.index ["trip_id"], name: "index_invitations_on_trip_id"
  end

  create_table "mates", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.boolean "is_user"
    t.string "first_name"
    t.string "last_name"
    t.date "date_of_birth"
    t.string "phone_number"
    t.text "address"
    t.string "nationality"
    t.string "country_of_residence"
    t.string "passport_number"
    t.date "expiration_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_mates_on_user_id"
  end

  create_table "trips", force: :cascade do |t|
    t.string "country"
    t.date "start_date"
    t.date "end_date"
    t.string "starting_point"
    t.integer "max_capacity"
    t.bigint "skipper_id"
    t.bigint "creator_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_trips_on_creator_id"
    t.index ["skipper_id"], name: "index_trips_on_skipper_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "nautical_bio"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "enrollments", "mates"
  add_foreign_key "enrollments", "trips"
  add_foreign_key "experiences", "users"
  add_foreign_key "invitations", "trips"
  add_foreign_key "invitations", "users", column: "receiver_id"
  add_foreign_key "invitations", "users", column: "sender_id"
  add_foreign_key "mates", "users"
  add_foreign_key "trips", "users", column: "creator_id"
  add_foreign_key "trips", "users", column: "skipper_id"
end
