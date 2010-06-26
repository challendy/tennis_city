class AddTotalPointsToPlayers < ActiveRecord::Migration
  def self.up
    add_column :players, :total_league_points, :integer
  end

  def self.down
    remove_column :players, :total_league_points
  end
end
