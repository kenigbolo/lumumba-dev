class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :main_image, null: false
      t.string :first_thumbnail, null: false
      t.string :second_thumbnail, null: false
      t.string :third_thumbnail, null: false
      t.decimal :price, null: false
      t.string :description, null: false
      t.string :designer, null: false
      t.boolean :preview, default: false

      t.timestamps
    end
  end
end
