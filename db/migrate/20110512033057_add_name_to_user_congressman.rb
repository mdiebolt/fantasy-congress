class AddNameToUserCongressman < ActiveRecord::Migration
  def self.up
    add_column :user_congressmen, :name, :string
  end

  def self.down
    remove_column :user_congressmen, :name
  end
end
