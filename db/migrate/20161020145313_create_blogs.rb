class CreateBlogs < ActiveRecord::Migration[5.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :image
      t.text :description
      t.string :author

      t.timestamps
    end
  end
end
