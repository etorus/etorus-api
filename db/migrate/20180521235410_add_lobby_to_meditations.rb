class AddLobbyToMeditations < ActiveRecord::Migration[5.1]
  def change
    add_column :meditations, :lobby, :string, array: true
    add_index :meditations, :lobby, using: 'gin'
  end
end
