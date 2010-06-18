class CreateLeaguesUsers < ActiveRecord::Migration
  def self.up
    create_table :leagues_users, :id => false do |t|
      t.column :user_id, :integer
      t.column :league_id, :integer
    end
    add_index :leagues_users, :user_id
    add_index :leagues_users, :league_id
  end

  def self.down
    drop_table :leagues_users
  end
end
