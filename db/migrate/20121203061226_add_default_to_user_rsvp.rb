class AddDefaultToUserRsvp < ActiveRecord::Migration
  def change
    change_column(:users, :rsvp, :boolean, default: false)
  end
end
