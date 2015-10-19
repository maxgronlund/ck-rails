class UserDetail < ActiveRecord::Base
  mount_uploader :curriculumvitae , CurriculumvitaeUploader
end
