# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

countries = [['BE',	0.21],
             ['BG', 0.20],
             ['CZ', 0.21],
             ['DK', 0.25],
             ['DE', 0.19],
             ['EE', 0.20],
             ['IE', 0.23],
             ['GR', 0.24],
             ['ES', 0.21],
             ['FR', 0.20],
             ['HR', 0.25],
             ['IT', 0.22],
             ['CY', 0.19],
             ['LV', 0.21],
             ['LT', 0.21],
             ['LU', 0.17],
             ['HU', 0.27],
             ['MT', 0.18],
             ['NL', 0.21],
             ['AT', 0.20],
             ['PL', 0.23],
             ['PT', 0.23],
             ['RO', 0.20],
             ['SI', 0.22],
             ['SK', 0.20],
             ['FI', 0.24],
             ['SE', 0.25],
             ['GB', 0.20]]

countries.each do |country|
  country = Tax.create(country: country[0], vat_rate: country[1])
end
