class AddAddressToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :shipping, :integer
    add_column :orders, :transaction_id, :string
    add_column :orders, :sub_total, :decimal, default: 0.0
    add_column :orders, :shipping_cost, :decimal, default: 0.0
  end
end
