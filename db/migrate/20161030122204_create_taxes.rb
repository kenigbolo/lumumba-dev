class CreateTaxes < ActiveRecord::Migration[5.0]
  def change
    create_table :taxes do |t|
      t.string :country, null: false
      t.decimal :vat_rate, null: false

      t.timestamps
    end
  end
end
