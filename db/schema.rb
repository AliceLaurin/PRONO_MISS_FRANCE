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

ActiveRecord::Schema[7.1].define(version: 2023_12_24_131103) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "critere"
    t.bigint "miss_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["miss_id"], name: "index_categories_on_miss_id"
    t.index ["user_id"], name: "index_categories_on_user_id"
  end

  create_table "group_users", force: :cascade do |t|
    t.bigint "group_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_group_users_on_group_id"
    t.index ["user_id"], name: "index_group_users_on_user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.string "invite_link"
    t.bigint "year_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["year_id"], name: "index_groups_on_year_id"
  end

  create_table "misses", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "region"
    t.string "age"
    t.string "height"
    t.string "photo"
    t.bigint "year_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "real_top_12_id"
    t.bigint "real_top_5_id"
    t.bigint "real_winner_id"
    t.index ["real_top_12_id"], name: "index_misses_on_real_top_12_id"
    t.index ["real_top_5_id"], name: "index_misses_on_real_top_5_id"
    t.index ["real_winner_id"], name: "index_misses_on_real_winner_id"
    t.index ["year_id"], name: "index_misses_on_year_id"
  end

  create_table "my_winners", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "miss_id"
    t.bigint "year_id"
    t.index ["miss_id"], name: "index_my_winners_on_miss_id"
    t.index ["user_id"], name: "index_my_winners_on_user_id"
    t.index ["year_id"], name: "index_my_winners_on_year_id"
  end

  create_table "myfifteens", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "my_miss_france_guess"
    t.bigint "miss_id"
    t.bigint "year_id"
    t.index ["miss_id"], name: "index_myfifteens_on_miss_id"
    t.index ["user_id"], name: "index_myfifteens_on_user_id"
    t.index ["year_id"], name: "index_myfifteens_on_year_id"
  end

  create_table "myfives", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "miss_id"
    t.bigint "year_id"
    t.index ["miss_id"], name: "index_myfives_on_miss_id"
    t.index ["user_id"], name: "index_myfives_on_user_id"
    t.index ["year_id"], name: "index_myfives_on_year_id"
  end

  create_table "real_top_12s", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "year_id"
    t.index ["year_id"], name: "index_real_top_12s_on_year_id"
  end

  create_table "real_top_5s", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "year_id"
    t.index ["year_id"], name: "index_real_top_5s_on_year_id"
  end

  create_table "real_winners", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "miss_france"
    t.string "first_dauphine"
    t.string "second_dauphine"
    t.string "third_dauphine"
    t.string "fourth_dauphine"
    t.bigint "year_id"
    t.index ["year_id"], name: "index_real_winners_on_year_id"
  end

  create_table "scores", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "year_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "points", default: 0
    t.index ["user_id"], name: "index_scores_on_user_id"
    t.index ["year_id"], name: "index_scores_on_year_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "pseudo"
    t.string "photo"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "years", force: :cascade do |t|
    t.integer "year"
    t.date "date"
    t.string "winner"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
  end

  add_foreign_key "categories", "misses"
  add_foreign_key "categories", "users"
  add_foreign_key "group_users", "groups"
  add_foreign_key "group_users", "users"
  add_foreign_key "groups", "years"
  add_foreign_key "misses", "real_top_12s"
  add_foreign_key "misses", "real_top_5s"
  add_foreign_key "misses", "real_winners"
  add_foreign_key "misses", "years"
  add_foreign_key "my_winners", "misses"
  add_foreign_key "my_winners", "users"
  add_foreign_key "my_winners", "years"
  add_foreign_key "myfifteens", "misses"
  add_foreign_key "myfifteens", "users"
  add_foreign_key "myfifteens", "years"
  add_foreign_key "myfives", "misses"
  add_foreign_key "myfives", "users"
  add_foreign_key "myfives", "years"
  add_foreign_key "real_top_12s", "years"
  add_foreign_key "real_top_5s", "years"
  add_foreign_key "real_winners", "years"
  add_foreign_key "scores", "users"
  add_foreign_key "scores", "years"
end
