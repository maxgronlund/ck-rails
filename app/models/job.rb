class Job < ActiveRecord::Base
  belongs_to :user
  has_one :payment
  belongs_to :city
  belongs_to :category
  belongs_to :state
  belongs_to :salary
end
