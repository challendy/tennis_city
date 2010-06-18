class CreateDrafts < ActiveRecord::Migration
  def self.up
    create_table :drafts do |t|
      t.integer :league_id
      t.integer :number_of_teams
      t.string :draft_order
      t.integer :current_pick      
      t.string :status

      t.timestamps
    end
  end

  def self.down
    drop_table :drafts
  end
end
