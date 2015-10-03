class User < ActiveRecord::Base
	has_secure_password
	has_many :jobs
	# has_one :payment, through: :jobs
end
