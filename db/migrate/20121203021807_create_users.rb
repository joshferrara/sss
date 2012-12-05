class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :receiver_id
      t.boolean :rsvp

      t.timestamps
    end
  end
end
