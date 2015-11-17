class Salary < ActiveRecord::Base
  has_one :jobs
end
