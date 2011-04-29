class User < ActiveRecord::Base
  has_many :user_congressmen
  has_many :congressmen, :through => :user_congressmen

  acts_as_authentic do |config|
    config.validate_email_field :no_connected_sites?
    config.validate_password_field :no_connected_sites?
    config.require_password_confirmation = false
  end

  def to_s
    display_name
  end
end
