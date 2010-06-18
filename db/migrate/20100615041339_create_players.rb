class CreatePlayers < ActiveRecord::Migration
  def self.up
    create_table :players do |t|
      t.integer  :atp_rank
      t.string   :name
      t.integer  :points
      t.integer  :change, :default => 0
      t.integer  :current_points
      t.integer  :tournaments_played
      t.string   :country
      t.timestamps
    end
  end

  def self.down
    drop_table :players
  end
end
