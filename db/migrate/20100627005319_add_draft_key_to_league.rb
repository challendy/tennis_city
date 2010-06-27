class AddDraftKeyToLeague < ActiveRecord::Migration
  def self.up
    add_column :leagues, :draft_id, :integer
  end

  def self.down
    remove_column :leagues, :draft_id
  end
end
