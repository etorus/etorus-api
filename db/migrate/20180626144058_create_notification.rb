class CreateNotification < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.belongs_to :user, index: true
      t.belongs_to :meditation, index: true
      t.string :translation_key
      t.string :uuid

      t.timestamps
    end
  end
end
