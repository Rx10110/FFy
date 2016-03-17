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

ActiveRecord::Schema.define(version: 20160316190045) do

  create_table "cities", force: :cascade do |t|
    t.string "city", limit: 255
  end

  create_table "cities_movies", id: false, force: :cascade do |t|
    t.integer "city_id",  limit: 4
    t.integer "movie_id", limit: 4
  end

  create_table "movies", force: :cascade do |t|
    t.string  "title",               limit: 255
    t.string  "distributor",         limit: 255
    t.date    "release_date"
    t.integer "weeks",               limit: 4
    t.integer "number_of_copies",    limit: 4
    t.integer "spectators_per_week", limit: 4
    t.integer "total_spectators",    limit: 4
    t.float   "satisfaction_rate",   limit: 24
  end

  add_index "movies", ["title"], name: "index_movies_on_title", using: :btree

end
