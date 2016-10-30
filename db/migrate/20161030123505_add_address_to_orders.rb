class AddAddressToOrders < ActiveRecord::Migration[5.0]
  def change
    add_reference :orders, :address, foreign_key: true
  end
end
