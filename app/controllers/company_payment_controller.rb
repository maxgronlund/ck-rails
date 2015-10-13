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

  def details
    @current = User.find(session[:user_id])
    @section = "Payments"
    @active = "payments"
    # @pays = Payment.where(:payment_hash_id => params[:ids]).first
    @pays = User.find_by_sql('select * from users inner join jobs on jobs.user_id = users.id inner join payments on jobs.id = payments.job_id where payments.payment_hash_id = \''+params[:ids]+'\'').first
    @diff = TimeDifference.between(@pays.job_start , @pays.job_valid).in_days.to_s
    pid = Payment.where(:payment_hash_id => params[:ids]).first
    @logs = PaymentLog.where(:payment_id => pid.id )
  end
end
