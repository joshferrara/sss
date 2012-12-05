class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :user_id, :rsvp

  belongs_to :user
end
