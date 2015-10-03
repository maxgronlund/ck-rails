class Job < ActiveRecord::Base
  belongs_to :user
  has_one :payment
end
