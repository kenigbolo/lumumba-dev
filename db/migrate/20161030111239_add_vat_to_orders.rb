class AddVatToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :vat, :decimal
    remove_column :orders, :address, :string
  end
end
