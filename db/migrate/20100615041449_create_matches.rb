class CreateMatches < ActiveRecord::Migration
  def self.up
    create_table :matches do |t|
      t.column :week, :integer
      t.column :team_1, :integer
      t.column :team_2, :integer
      t.column :league_id, :integer
    end
  end

  def self.down
    drop_table :matches
  end
end
