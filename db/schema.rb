# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100615043335) do

  create_table "drafts", :force => true do |t|
    t.integer  "league_id"
    t.integer  "number_of_teams"
    t.string   "draft_order"
    t.integer  "current_pick"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "leagues", :force => true do |t|
    t.string   "name"
    t.integer  "manager"
    t.string   "length"
    t.string   "status"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "leagues_users", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "league_id"
  end

  add_index "leagues_users", ["league_id"], :name => "index_leagues_users_on_league_id"
  add_index "leagues_users", ["user_id"], :name => "index_leagues_users_on_user_id"

  create_table "matches", :force => true do |t|
    t.integer "week"
    t.integer "team_1"
    t.integer "team_2"
    t.integer "league_id"
  end

  create_table "players", :force => true do |t|
    t.integer  "atp_rank"
    t.string   "name"
    t.integer  "points"
    t.integer  "change",             :default => 0
    t.integer  "current_points"
    t.integer  "tournaments_played"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players_teams", :id => false, :force => true do |t|
    t.integer "player_id"
    t.integer "team_id"
  end

  add_index "players_teams", ["player_id"], :name => "index_players_teams_on_player_id"
  add_index "players_teams", ["team_id"], :name => "index_players_teams_on_team_id"

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.integer  "total_points"
    t.integer  "wins"
    t.integer  "loss"
    t.integer  "last_weeks_points"
    t.integer  "league_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
