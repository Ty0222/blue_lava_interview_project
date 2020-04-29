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

ActiveRecord::Schema.define(version: 2020_04_29_201739) do

  create_table "population_query_logs", force: :cascade do |t|
    t.integer "query_log_id"
    t.integer "population_id"
    t.index ["population_id"], name: "index_population_query_logs_on_population_id"
    t.index ["query_log_id"], name: "index_population_query_logs_on_query_log_id"
  end

  create_table "populations", force: :cascade do |t|
    t.date "year"
    t.bigint "population"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "query_logs", force: :cascade do |t|
    t.string "query"
    t.string "response"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "response_source"
  end

end
