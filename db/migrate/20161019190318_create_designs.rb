class CreateDesigns < ActiveRecord::Migration[5.0]
  def change
    create_table :designs do |t|
      t.string :image
      t.string :image_desc
      t.string :first_garment_model_design
      t.string :first_garment_print_design
      t.string :first_garment_technical_design
      t.string :first_garment_desc
      t.string :second_garment_model_design
      t.string :second_garment_print_design
      t.string :second_garment_technical_design
      t.string :second_garment_desc
      t.string :third_garment_model_design
      t.string :third_garment_print_design
      t.string :third_garment_technical_design
      t.boolean :for_competition
      t.boolean :for_sale
      t.decimal :price
      t.string :add_to
      t.boolean :competition
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
