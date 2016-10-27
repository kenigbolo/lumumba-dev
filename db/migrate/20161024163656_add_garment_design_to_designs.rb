class AddGarmentDesignToDesigns < ActiveRecord::Migration[5.0]
  def change
    add_column :designs, :first_garment_design, :string
    add_column :designs, :second_garment_design, :string
    add_column :designs, :third_garment_design, :string
  end
end
