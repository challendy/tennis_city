class CreateTeams < ActiveRecord::Migration
  def self.up
    create_table :teams do |t|
      t.string :name
      t.integer :total_points
      t.integer :wins
      t.integer :loss
      t.integer :last_weeks_points
      t.integer :league_id
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :teams
  end
end
