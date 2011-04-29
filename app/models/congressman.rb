class Congressman < ActiveRecord::Base
  has_many :user_congressmen
  has_many :users, :through => :user_congressmen

  versioned
end
