# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
# #
# # Examples:
# #
# #   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
# #   Mayor.create(name: 'Emanuel', city: cities.first)
# #
# #
#
hashid = Hashids.new('carikerjaan indonesia',8)

User.create({
	user_name: 'Heru Joko',
	user_email: 'heru.mikami@gmail.com',
	password: '12345',
	user_hash_id: hashid.encode(1),
	user_address: 'Bpp',
	user_phone: '411432',
	country_id: '1',
	state_id: '1',
	city_id: '1',
	user_role: 'admin',
  flag: 'active'
})

User.create({
  user_name: 'Heru Joko',
  user_email: 'carikerjaan69@gmail.com',
  password: '12345',
  user_hash_id: hashid.encode(2),
  user_address: 'Bpp',
  user_phone: '411432',
  country_id: '1',
  state_id: '1',
  city_id: '1',
  user_role: 'admin',
  flag: 'active'
})


Category.create({
  category_name:'Agriculture'
});
Category.create({
   category_name:'Automotive'
});
Category.create({
	category_name:'Culinary'
});
Category.create({
	category_name:'IT and Software'
});
Category.create({
	category_name:'IT / Communications'
});
Category.create({
   category_name:'Politics and Goverment'
});
Category.create({
   category_name:'Socials'
});
Category.create({
   category_name:'Economics / Finance'
});
Category.create({
   category_name:'Mechanical'
});
Category.create({
   category_name:'Pharmacy'
});
Category.create({
   category_name:'Medical'
});
Category.create({
   category_name:'Services'
});
Category.create({
   category_name:'Oil and Gas'
});
Category.create({
   category_name:'Architechture'
});
Category.create({
   category_name:'Arts'
});
Category.create({
   category_name:'Music'
});

Salary.create({
                  salary_code: 1,
                  salary_string: " < Rp.1.000.000"
              })
Salary.create({
                  salary_code: 2,
                  salary_string: " Rp.1.000.000, - Rp.2.000.000"
              })
Salary.create({
                  salary_code: 3,
                  salary_string: " Rp.2.000.000, - Rp.4.000.000"
              })
Salary.create({
                  salary_code: 4,
                  salary_string: " Rp.4.000.000, - Rp.6.000.000"
              })
Salary.create({
                  salary_code: 5,
                  salary_string: " Rp.6.000.000, - Rp.8.000.000"
              })
Salary.create({
                  salary_code: 6,
                  salary_string: " Rp.8.000.000, - Rp.10.000.000"
              })
Salary.create({
                  salary_code: 7,
                  salary_string: " Rp.10.000.000, - Rp.15.000.000"
              })
Salary.create({
                  salary_code: 8,
                  salary_string: " Rp.15.000.000, - Rp.25.000.000"
              })
Salary.create({
                  salary_code: 9,
                  salary_string: " Rp.25.000.000, - Rp.30.000.000"
              })
Salary.create({
                  salary_code: 10,
                  salary_string: " Rp.30.000.000, - Rp.35.000.000"
              })
Salary.create({
                  salary_code: 11,
                  salary_string: " Rp.35.000.000, - Rp.40.000.000"
              })
Salary.create({
                  salary_code: 12,
                  salary_string: " Rp.40.000.000, - Rp.50.000.000"
              })

# Country.create({
# 	country_name: 'Indonesia'
# })

# State.create({
#                  state_name: 'Kalimantan Timur',
#                  country_id: 1
#              })

# State.create({
# 	state_name: 'Kalimantan Selatan',
# 	country_id: 1
# })
# State.create({
#                  state_name: 'Kalimantan Tengah',
#                  country_id: 1
#              })
# State.create({
#                  state_name: 'Jawa Barat',
#                  country_id: 1
#              })
# State.create({
#                  state_name: 'Jawa Timur',
#                  country_id: 1
#              })
# State.create({
#                  state_name: 'Jawa Tengah',
#                  country_id: 1
#              })

# City.create({
#                 city_name: 'Balikpapan',
#                 state_id: 1
#             })
# City.create({
#                 city_name: 'Samarinda',
#                 state_id: 1
#             })

# City.create({
# 	city_name: 'Banjarmasin',
# 	state_id: 2
# })
# City.create({
#                 city_name: 'Banjar Baru',
#                 state_id: 2
#             })
# City.create({
#                 city_name: 'Palangkaraya',
#                 state_id: 3
#             })
# City.create({
#                 city_name: 'Pangkalan Bun',
#                 state_id: 3
#             })
# City.create({
#                 city_name: 'Bandung',
#                 state_id: 4
#             })
# City.create({
#                 city_name: 'Subang',
#                 state_id: 4
#             })
# City.create({
#                 city_name: 'Cirebon',
#                 state_id: 4
#             })
# City.create({
#                 city_name: 'Surabaya',
#                 state_id: 5
#             })
# City.create({
#                 city_name: 'Malang',
#                 state_id: 5
#             })
# City.create({
#                 city_name: 'Blitar',
#                 state_id: 5
#             })
# City.create({
#                 city_name: 'Solo',
#                 state_id: 6
#             })
# City.create({
#                 city_name: 'Semarang',
#                 state_id: 6
#             })


Role.create({
                role_code: 'admin',
                role_name: 'Admin'
            })
Role.create({
                role_code: 'company',
                role_name: 'Company'
            })
Role.create({
                role_code: 'user',
                role_name: 'User'
            })

Tag.create({
               tag_name: 'Ketenagakerjaan'
           })
Tag.create({
               tag_name: 'BPJS'
           })
Tag.create({
               tag_name: 'Pemerintahan'
           })
Tag.create({
               tag_name: 'Kebijakan Pemerintah'
           })
Tag.create({
               tag_name: 'Ekonomi Nasional'
           })
Tag.create({
               tag_name: 'Ekonomi Global'
           })
Tag.create({
               tag_name: 'Kebijakan Luar Negri'
           })
Tag.create({
               tag_name: 'Kebijakan Dalam Negri'
           })

Skill.create({
                 skill_name: 'Programming'
             })
Skill.create({
                 skill_name: 'Marketing'
             })
Skill.create({
                 skill_name: 'Accounting'
             })
Skill.create({
                 skill_name: 'Driving'
             })
Skill.create({
                 skill_name: 'Managerial'
             })
Skill.create({
                 skill_name: 'Sys Admin'
             })
Skill.create({
                 skill_name: 'PHP'
             })
Skill.create({
                 skill_name: 'Ruby'
             })
Skill.create({
                 skill_name: 'Android dev'
             })
Skill.create({
                 skill_name: 'iOS dev'
             })
Skill.create({
                 skill_name: 'Web Application'
             })
Skill.create({
                 skill_name: 'Brand Design'
             })
Skill.create({
                 skill_name: 'Photoshop'
             })
Skill.create({
                 skill_name: 'Corel Draw'
             })
Skill.create({
                 skill_name: 'Basic Microsoft Office'
             })
Skill.create({
                 skill_name: 'Hardware Repair'
             })
Skill.create({
                 skill_name: 'Electrical'
             })

## Full list Provinsi dan Kota Indonesia

Country.create({
  country_name: 'Indonesia'
})

aceh = State.create({
  state_name: 'Aceh',
  country_id: '1',
})

City.create({
  city_name: 'Banda Aceh',
  state_id: aceh.id
})

City.create({
  city_name: 'Lhokseumawe',
  state_id: aceh.id
})

City.create({
  city_name: 'Sabang',
  state_id: aceh.id
})

sumut = State.create({
  state_name: 'Sumatera Utara',
  country_id: '1'
})

City.create({
  city_name: 'Binjai',
  state_id: sumut.id
})

City.create({
  city_name: 'Gunungsitoli',
  state_id: sumut.id
})

City.create({
  city_name: 'Medan',
  state_id: sumut.id
})

City.create({
  city_name: 'Pematangsiantar',
  state_id: sumut.id
})

City.create({
  city_name: 'Tebing Tinggi',
  state_id: sumut.id
})

bengkulu = State.create({
  state_name: 'Bengkulu',
  country_id: '1'
})

City.create({
  city_name: 'Bengkulu',
  state_id: bengkulu.id
})

jambi = State.create({
  state_name: 'Jambi',
  country_id: '1'
})

City.create({
  city_name: 'Jambi',
  state_id: jambi.id
})

City.create({
  city_name: 'Sungai Penuh',
  state_id: jambi.id
})

riau = State.create({
  state_name: 'riau',
  country_id: '1'
})

City.create({
  city_name: 'Dumai',
  state_id: riau.id
})

City.create({
  city_name: 'Pekanbaru',
  state_id: riau.id
})

sumbar = State.create({
  state_name: 'Sumatera Barat',
  country_id: '1'
})

City.create({
  city_name: 'Bukittinggi',
  state_id: sumbar.id
})

City.create({
  city_name: 'Padang',
  state_id: sumbar.id
})

City.create({
  city_name: 'Padangpanjang',
  state_id: sumbar.id
})

City.create({
  city_name: 'Pariaman',
  state_id: sumut.id
})

City.create({
  city_name: 'Payakumbuh',
  state_id: sumut.id
})

City.create({
  city_name: 'Solok',
  state_id: sumut.id
})

sumsel = State.create({
  state_name: 'Sumatera Selatan',
  country_id: '1'
})

City.create({
  city_name: 'Lubuklinggau',
  state_id: sumsel.id
})

City.create({
  city_name: 'Pagar Alam',
  state_id: sumsel.id
})

City.create({
  city_name: 'Palembang',
  state_id: sumsel.id
})

City.create({
  city_name: 'Prabumulih',
  state_id: sumsel.id
})

lampung = State.create({
  state_name: 'Lampung',
  country_id: '1'
})

City.create({
  city_name: 'Bandar Lampung',
  state_id: lampung.id
})

City.create({
  city_name: 'Metro',
  state_id: sumut.id
})

bangka = State.create({
  state_name: 'Bangka Belitung',
  country_id: '1'
})

City.create({
  city_name: 'Belitung',
  state_id: bangka.id
})

City.create({
  city_name: 'Belitung Timur',
  state_id: bangka.id
})

City.create({
  city_name: 'Pangkal Pinang',
  state_id: bangka.id
})

riau = State.create({
  state_name: 'Riau',
  country_id: '1'
})

City.create({
  city_name: 'Batam',
  state_id: riau.id
})

City.create({
  city_name: 'Tanjung Pinang',
  state_id: riau.id
})

banten = State.create({
  state_name: 'Banten',
  country_id: '1'
});

City.create({
  city_name: 'Tangerang',
  state_id: banten.id
})

City.create({
  city_name: 'Serang',
  state_id: banten.id
})

City.create({
  city_name: 'Cilegon',
  state_id: banten.id
})

jabar = State.create({
  state_name: 'Jawa Barat',
  country_id: '1'
})

City.create({
  city_name: 'Bandung',
  state_id: jabar.id
})

City.create({
  city_name: 'Banjar',
  state_id: jabar.id
})

City.create({
  city_name: 'Bekasi',
  state_id: jabar.id
})

City.create({
  city_name: 'Bogor',
  state_id: jabar.id
})

City.create({
  city_name: 'Cimahi',
  state_id: jabar.id
})

City.create({
  city_name: 'Cirebon',
  state_id: jabar.id
})

City.create({
  city_name: 'Depok',
  state_id: jabar.id
})

City.create({
  city_name: 'Sukabumi',
  state_id: jabar.id
})

City.create({
  city_name: 'Tasikmalaya',
  state_id: jabar.id
})

dki = State.create({
  state_name: 'DKI Jakarta',
  country_id: '1'
})

City.create({
  city_name: 'Jakarta Barat',
  state_id: dki.id
})

City.create({
  city_name: 'Jakarta Pusat',
  state_id: dki.id
})

City.create({
  city_name: 'Jakarta Timur',
  state_id: dki.id
})

City.create({
  city_name: 'Jakarta Selatan',
  state_id: dki.id
})

City.create({
  city_name: 'Jakarta Utara',
  state_id: dki.id
})

jateng = State.create({
  state_name: 'Jawa Tengah',
  country_id: '1'
})

City.create({
  city_name: 'Magelang',
  state_id: jateng.id
})

City.create({
  city_name: 'Pekalongan',
  state_id: jateng.id
})

City.create({
  city_name: 'Salatiga',
  state_id: jateng.id
})

City.create({
  city_name: 'Semarang',
  state_id: jateng.id
})

City.create({
  city_name: 'Surakarta',
  state_id: jateng.id
})

City.create({
  city_name: 'Tegal',
  state_id: jateng.id
})

jatim = State.create({
  state_name: 'Jawa Timur',
  country_id: '1'
})

City.create({
  city_name: 'Bangkalan',
  state_id: jatim.id
})

City.create({
  city_name: 'Batu',
  state_id: jatim.id
})

City.create({
  city_name: 'Blitar',
  state_id: jatim.id
})

City.create({
  city_name: 'Kediri',
  state_id: jatim.id
})

City.create({
  city_name: 'Madiun',
  state_id: jatim.id
})

City.create({
  city_name: 'Malang',
  state_id: jatim.id
})

City.create({
  city_name: 'Mojokerto',
  state_id: jatim.id
})

City.create({
  city_name: 'Pasuruan',
  state_id: jatim.id
})

City.create({
  city_name: 'Probolinggo',
  state_id: jatim.id
})

City.create({
  city_name: 'Surabaya',
  state_id: jatim.id
})

yogya = State.create({
  state_name: 'DIY Yogyakarta',
  country_id: '1'
})

City.create({
  city_name: 'Bantul',
  state_id: yogya.id
})

City.create({
  city_name: 'Sleman',
  state_id: yogya.id
})

City.create({
  city_name: 'Yogyakarta',
  state_id: yogya.id
})

bali = State.create({
  state_name: 'Bali',
  country_id: '1'
})

City.create({
  city_name: 'Buleleng',
  state_id: bali.id
})

City.create({
  city_name: 'Gianyar',
  state_id: bali.id
})

City.create({
  city_name: 'Tabanan',
  state_id: bali.id
})

City.create({
  city_name: 'Denpasar',
  state_id: bali.id
})

ntb = State.create({
  state_name: 'Nusa Tenggara Barat',
  country_id: '1'
})

City.create({
  city_name: 'Bima',
  state_id: ntb.id
})

City.create({
  city_name: 'Dompu',
  state_id: ntb.id
})

City.create({
  city_name: 'Mataram',
  state_id: ntb.id
})

ntt = State.create({
  state_name: 'Nusa Tenggara Timur',
  country_id: '1'
})

City.create({
  city_name: 'Alor',
  state_id: ntt.id
})

City.create({
  city_name: 'Flores',
  state_id: ntt.id
})

City.create({
  city_name: 'Sumba',
  state_id: ntt.id
})

City.create({
  city_name: 'Kupang',
  state_id: ntt.id
})

kalbar = State.create({
  state_name: 'Kalimantan Barat',
  country_id: '1'
})

City.create({
  city_name: 'Pontianak',
  state_id: kalbar.id
})

City.create({
  city_name: 'Singkawang',
  state_id: kalbar.id
})

kalsel = State.create({
  state_name: 'Kalimantan Selatan',
  country_id: '1'
})

City.create({
  city_name: 'Banjarmasin',
  state_id: kalsel.id
})

City.create({
  city_name: 'Banjar Baru',
  state_id: kalsel.id
})

City.create({
  city_name: 'Kotabaru',
  state_id: kalsel.id
})

City.create({
  city_name: 'Tabalong',
  state_id: kalsel.id
})

kalteng = State.create({
  state_name: 'Kalimantan Tengah',
  country_id: '1'
})

City.create({
  city_name: 'Palangkaraya',
  state_id: kalteng.id
})

City.create({
  city_name: 'Kotawaringin',
  state_id: kalteng.id
})

kaltim = State.create({
  state_name: 'Kalimantan Timur',
  country_id: '1'
})

City.create({
  city_name: 'Balikpapan',
  state_id: kaltim.id
})

City.create({
  city_name: 'Samarinda',
  state_id: kaltim.id
})

City.create({
  city_name: 'Tenggarong',
  state_id: kaltim.id
})

City.create({
  city_name: 'Nunukan',
  state_id: kaltim.id
})

gorontalo = State.create({
  state_name: 'Gorontalo',
  country_id: '1'
})

City.create({
  city_name: 'Gorontalo',
  state_id: gorontalo.id
})

City.create({
  city_name: 'Boalemo',
  state_id: gorontalo.id
})

sulsel = State.create({
  state_name: 'Sulawesi Selatan',
  country_id: '1'
})

City.create({
  city_name: 'Makassar',
  state_id: sulsel.id
})

City.create({
  city_name: 'Palopo',
  state_id: sulsel.id
})

City.create({
  city_name: 'Pare Pare',
  state_id: sulsel.id
})

sulteng = State.create({
  state_name: 'Sulawesi Tenggara',
  country_id: '1'
})

City.create({
  city_name: 'Bau Bau',
  state_id: sulteng.id
})

City.create({
  city_name: 'Kendari',
  state_id: sulteng.id
})

sult = State.create({
  state_name: 'Sulawesi Tengah',
  country_id: '1'
})

City.create({
  city_name: 'Palu',
  state_id: sult.id
})

City.create({
  city_name: 'Donggala',
  state_id: sult.id
})

City.create({
  city_name: 'Toli Toli',
  state_id: sult.id
})

sulut = State.create({
  state_name: 'Sulawesi Utara',
  country_id: '1'
})

City.create({
  city_name: 'Manado',
  state_id: sulut.id
})

City.create({
  city_name: 'Tomohon',
  state_id: sulut.id
})

sulbar = State.create({
  state_name: 'Sulawesi Barat',
  country_id: '1'
})

City.create({
  city_name: 'Majene',
  state_id: sulbar.id
})

City.create({
  city_name: 'Polewali Mandar',
  state_id: sulbar.id
})

maluku = State.create({
  state_name: 'Maluku',
  country_id: '1'
})

City.create({
  city_name: 'Ambon',
  state_id: maluku.id
})

City.create({
  city_name: 'Tuai',
  state_id: maluku.id
})

papua = State.create({
  state_name: 'Papua'
})

City.create({
  city_name: 'Jayapura',
  state_id: papua.id
})

City.create({
  city_name: 'Sorong',
  state_id: papua.id
})

City.create({
  city_name: 'Raja Ampat',
  state_id: papua.id
})


