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
	user_country: '1',
	user_state: '1',
	user_city: '1',
	user_role: 'admin',
  flag: 'active'
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
	user_role: 'company',
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

Country.create({
	country_name: 'Indonesia'
})

State.create({
                 state_name: 'Kalimantan Timur',
                 country_id: 1
             })

State.create({
	state_name: 'Kalimantan Selatan',
	country_id: 1
})
State.create({
                 state_name: 'Kalimantan Tengah',
                 country_id: 1
             })
State.create({
                 state_name: 'Jawa Barat',
                 country_id: 1
             })
State.create({
                 state_name: 'Jawa Timur',
                 country_id: 1
             })
State.create({
                 state_name: 'Jawa Tengah',
                 country_id: 1
             })

City.create({
                city_name: 'Balikpapan',
                state_id: 1
            })
City.create({
                city_name: 'Samarinda',
                state_id: 1
            })

City.create({
	city_name: 'Banjarmasin',
	state_id: 2
})
City.create({
                city_name: 'Banjar Baru',
                state_id: 2
            })
City.create({
                city_name: 'Palangkaraya',
                state_id: 3
            })
City.create({
                city_name: 'Pangkalan Bun',
                state_id: 3
            })
City.create({
                city_name: 'Bandung',
                state_id: 4
            })
City.create({
                city_name: 'Subang',
                state_id: 4
            })
City.create({
                city_name: 'Cirebon',
                state_id: 4
            })
City.create({
                city_name: 'Surabaya',
                state_id: 5
            })
City.create({
                city_name: 'Malang',
                state_id: 5
            })
City.create({
                city_name: 'Blitar',
                state_id: 5
            })
City.create({
                city_name: 'Solo',
                state_id: 6
            })
City.create({
                city_name: 'Semarang',
                state_id: 6
            })


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