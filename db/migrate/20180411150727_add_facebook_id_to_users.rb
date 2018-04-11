class AddFacebookIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :facebook_id, :string
    add_index :users, :facebook_id
  end
end
