class CreateMeditations < ActiveRecord::Migration[5.1]
  def change
    create_table :meditations do |t|
      t.string :title
      t.string :audio
      t.datetime :start
      t.boolean :session_public, default: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
