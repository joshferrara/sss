class ChangeUsersRecieverIdToUserId < ActiveRecord::Migration
  def change
    rename_column :users, :receiver_id, :user_id
  end
end
