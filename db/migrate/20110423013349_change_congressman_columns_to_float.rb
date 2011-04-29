class ChangeCongressmanColumnsToFloat < ActiveRecord::Migration
  def self.up
    change_table :congressmen do |t|
      t.change "missed_votes_percent", :float, :null => false
      t.change "votes_with_party_percent", :float, :null => false
    end
  end

  def self.down
    change_table :congressmen do |t|
      t.change "missed_votes_percent", :integer
      t.change "votes_with_party_percent", :integer
    end
  end
end
