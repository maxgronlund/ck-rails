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

hashid = Hashids.new('carikerjaan indonesia',8)

User.create({
	user_name: 'Heru Joko',
	user_email: 'heru.mikami@gmail.com',
	password: '12345',
	user_hash_id: hashid.encode(1),
	user_address: 'Bpp',
	user_phone: '411432',
	user_country: '1',
	user_state: '1',
	user_city: '1',
	user_role: 'admin'
})

User.create({
	user_name: 'Pied Piper',
	user_email: 'pied@piper.com',
	password: '12345',
	user_hash_id: hashid.encode(2),
	user_address: 'Bpp',
	user_phone: '411432',
	user_country: '1',
	user_state: '1',
	user_city: '1',
	user_role: 'company'
})
