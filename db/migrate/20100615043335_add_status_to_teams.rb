class AddStatusToTeams < ActiveRecord::Migration
  def self.up
    add_column :teams, :status, :string
  end

  def self.down
    remove_column :teams, :status
  end
end
