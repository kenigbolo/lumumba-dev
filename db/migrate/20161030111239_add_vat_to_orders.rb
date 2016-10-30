class AddVatToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :vat, :decimal
  end
end
