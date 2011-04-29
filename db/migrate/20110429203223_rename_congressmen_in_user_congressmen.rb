class RenameCongressmenInUserCongressmen < ActiveRecord::Migration
  def self.up
    rename_column :user_congressmen, :congressmen_id, :congressman_id
  end

  def self.down
    rename_column :user_congressmen, :congressman_id, :congressmen_id
  end
end
