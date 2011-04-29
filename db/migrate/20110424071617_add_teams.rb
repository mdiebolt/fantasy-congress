class AddTeams < ActiveRecord::Migration
  def self.up
    create_table :teams do |t|
      t.references :user,        :null => false
      t.references :congressmen, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :teams
  end
end
