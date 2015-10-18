class User < ActiveRecord::Base
	has_secure_password
	mount_uploader :avatar , AvatarUploader
	has_many :jobs
	# has_one :payment, through: :jobs
end
