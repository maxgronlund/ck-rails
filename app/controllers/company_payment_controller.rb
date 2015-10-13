class CompanyPaymentController < ApplicationController
  include SessionHelper
  before_action :ensureCompany
  layout "company"

  def list
    @current = User.find(session[:user_id])
    @section = "Payments"
    @active = "payments"
    @payments = Payment.find_by_sql('select * from payments inner join jobs on jobs.id = payments.job_id where jobs.user_id = \''+@current.id.to_s+'\'')
  end
end
