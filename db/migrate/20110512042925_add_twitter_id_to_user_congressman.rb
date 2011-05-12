class AddTwitterIdToUserCongressman < ActiveRecord::Migration
  def self.up
    add_column :user_congressmen, :twitter_id, :string
  end

  def self.down
    remove_column :user_congressmen, :twitter_id
  end
end
