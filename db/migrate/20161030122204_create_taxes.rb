class CreateTaxes < ActiveRecord::Migration[5.0]
  def change
    create_table :taxes do |t|
      t.string :country
      t.integer :vat_rate

      t.timestamps
    end
  end
end
