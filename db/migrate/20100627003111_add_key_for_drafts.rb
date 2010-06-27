class AddKeyForDrafts < ActiveRecord::Migration
  def self.up
    rename_column :drafts, :draft_order, :draft_round_id
    rename_column :drafts, :current_pick, :current_round
  end

  def self.down
    rename_column :drafts, :current_round, :current_pick
    rename_column :drafts, :draft_round_id, :draft_order
  end
end
