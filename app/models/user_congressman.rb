class UserCongressman < ActiveRecord::Base
  belongs_to :user
  belongs_to :congressman
end
