class CreateTaxes < ActiveRecord::Migration[5.0]
  def change
    create_table :taxes do |t|
      t.string :country
      t.decimal :vat_rate

      t.timestamps
    end
  end
end
