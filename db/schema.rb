# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20141116032745) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "challenges", force: true do |t|
    t.integer  "ticket"
    t.integer  "trailer"
    t.integer  "checkin"
    t.integer  "quiz"
    t.integer  "fblike"
    t.integer  "fbshare"
    t.integer  "tfollow"
    t.integer  "tweet"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "movie_id"
    t.integer  "user_id"
  end

  add_index "challenges", ["movie_id"], name: "index_challenges_on_movie_id", using: :btree
  add_index "challenges", ["user_id"], name: "index_challenges_on_user_id", using: :btree

  create_table "movies", force: true do |t|
    t.string   "name"
    t.string   "fandango_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "challenge_id"
  end

  add_index "movies", ["challenge_id"], name: "index_movies_on_challenge_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.string   "password_confirmation"
    t.string   "favorite_movies"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "points"
    t.integer  "challenge_id"
  end

  add_index "users", ["challenge_id"], name: "index_users_on_challenge_id", using: :btree

end
