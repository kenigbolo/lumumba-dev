class RemoveAddToAndPriceAndForSaleFromDesigns < ActiveRecord::Migration[5.0]
  def change
    remove_column :designs, :add_to, :string
    remove_column :designs, :for_sale, :string
    remove_column :designs, :price, :decimal
  end
end
