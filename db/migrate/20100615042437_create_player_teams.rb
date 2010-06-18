class CreatePlayerTeams < ActiveRecord::Migration
  def self.up
    create_table :players_teams, :id => false do |t|
      t.column :player_id, :integer
      t.column :team_id, :integer
    end
      add_index :players_teams, :player_id
      add_index :players_teams, :team_id
  end

  def self.down
    drop_table :players_teams
  end
end
