# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

countries = [['Belgium'	,	21],
['Bulgaria'	,	20],
['Czech Republic', 		21],
['Denmark'	,	25],
['Germany'	,	19],
['Estonia'	,	20],
['Ireland'	,	23],
['Greece'	,	24],
['Spain'	,	21],
['France'	,	20],
['Croatia'	,	25],
['Italy'	,	22],
['Cyprus'	,	19],
['Latvia'	,	21],
['Lithuania',		21],
['Luxembourg',		17],
['Hungary'	,	27],
['Malta'	,	18],
['Netherlands',		21],
['Austria'	,	20],
['Poland'	,	23],
['Portugal'	,	23],
['Romania'	,	20],
['Slovenia'	,	22],
['Slovakia'	,	20],
['Finland'	,	24],
['Sweden'	,	25],
['United Kingdom',	20]]

countries.each do |country|
	country = Tax.create(country: country[0], vat_rate: country[1])
end