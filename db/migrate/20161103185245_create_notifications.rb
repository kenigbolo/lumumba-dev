class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.string :notice
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
