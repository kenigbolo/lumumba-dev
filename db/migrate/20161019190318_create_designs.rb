class CreateDesigns < ActiveRecord::Migration[5.0]
  def change
    create_table :designs do |t|
      t.string :image, null: false
      t.string :image_desc, null: false
      t.string :first_garment_model_design, null: false
      t.string :first_garment_print_design, null: false
      t.string :first_garment_technical_design, null: false
      t.string :first_garment_desc, null: false
      t.string :second_garment_model_design, null: false
      t.string :second_garment_print_design, null: false
      t.string :second_garment_technical_design, null: false
      t.string :second_garment_desc, null: false
      t.string :third_garment_model_design, null: false
      t.string :third_garment_print_design, null: false
      t.string :third_garment_technical_design, null: false
      t.boolean :for_competition, null: false
      t.boolean :for_sale, null: false
      t.decimal :price, null: false
      t.string :add_to, null: false
      t.boolean :competition, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
