class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :order_number, null: false
      t.string :payment_method
      t.decimal :total_amount
      t.string :status, null: false
      t.string :address, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
