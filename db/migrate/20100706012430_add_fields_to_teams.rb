class AddFieldsToTeams < ActiveRecord::Migration
  def self.up
    rename_column :teams, :loss, :losses
    add_column :teams, :ties, :integer
  end

  def self.down
    remove_column :teams, :ties
    rename_column :teams, :losses, :loss
  end
end
