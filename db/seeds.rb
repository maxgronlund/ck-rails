# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Country.create({
	country_name: 'Indonesia'
})
State.create({
	state_name: 'Kalimantan Timur',
	state_country: 1
})

City.create({
	city_name: 'Balikpapan',
	city_state: 1
})
