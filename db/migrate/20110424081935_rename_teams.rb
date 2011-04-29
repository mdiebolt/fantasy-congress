class RenameTeams < ActiveRecord::Migration
  def self.up
    rename_table :teams, :user_congressmen
  end

  def self.down
    rename_table :user_congressmen, :teams
  end
end
