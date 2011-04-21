class CreateCongressmen < ActiveRecord::Migration
  def self.up
    create_table :congressmen do |t|
      t.string "name",                 :null => false
      t.integer "alignment",           :null => false
      t.string "party",                :null => false
      t.integer "minutes_on_floor",    :null => false
      t.integer "votes_against_party", :null => false
      t.integer "votes_with_majority", :null => false
      t.integer "popularity",          :null => false

      t.timestamps                     :null => false
    end
  end

  def self.down
    drop_table :congressmen
  end
end
