class CreateDraftRounds < ActiveRecord::Migration
  def self.up
    create_table :draft_rounds do |t|
      t.integer :draft_id
      t.integer :round
      t.integer :team_id
    end
  end

  def self.down
    drop_table :draft_rounds
  end
end
