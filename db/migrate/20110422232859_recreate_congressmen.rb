class RecreateCongressmen < ActiveRecord::Migration
  def self.up
    create_table :congressmen do |t|
      t.string "name",                                      :null => false
      t.string "nyt_api_id",                                :null => false
      t.string "party",                        :limit => 1, :null => false
      t.integer "bills_sponsored",                          :null => false
      t.integer "bills_cosponsored",                        :null => false
      t.integer "missed_votes_percent",                     :null => false
      t.integer "votes_with_party_percent",                 :null => false
      t.string "state",                        :limit => 2, :null => false
      t.integer "committees",                               :null => false

      t.timestamps                                          :null => false
    end
  end

  def self.down
    drop_table :congressmen
  end
end
