class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :main_image
      t.string :first_thumbnail
      t.string :second_thumbnail
      t.string :third_thumbnail
      t.decimal :price
      t.string :description
      t.string :designer
      t.boolean :preview

      t.timestamps
    end
  end
end
