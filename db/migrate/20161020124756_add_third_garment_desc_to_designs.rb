class AddThirdGarmentDescToDesigns < ActiveRecord::Migration[5.0]
  def change
    add_column :designs, :third_garment_desc, :string
  end
end
