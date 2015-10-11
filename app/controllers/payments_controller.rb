class PaymentsController < ApplicationController
  include SessionHelper
  before_action :ensureAdmin
  layout 'admin'

  def list
    @current = User.find(session[:user_id])
    @alluser = User.all.take(20)
    @nextmonth = Chronic.parse('next month').to_s
    
    pays = Payment.find_by_sql("select * from payments where created_at < \'"+@nextmonth+"\'")
    
    @revenue = 0;
    pays.each do |pr|
    	@revenue += pr.payment_price 
    end	

    @pending = 0
    pays = Payment.where(:payment_status => 'unpaid')
    pays.each do |pr|
    	@pending += 1
    end	

    @today = 0
    yesterday = Chronic.parse('yesterday').to_s
    tomorrow = Chronic.parse('tomorrow').to_s
    pays = Payment.find_by_sql("select * from payments where created_at > \'"+yesterday+"\' and created_at < \'"+tomorrow+"\'")
	  pays.each do |pr|
    	@today += 1
    end    
  end

  def details
    @current = User.find(session[:user_id])
    # @pays = Payment.where(:payment_hash_id => params[:ids]).first
    @pays = User.find_by_sql('select * from users inner join jobs on jobs.user_id = users.id inner join payments on jobs.id = payments.job_id where payments.payment_hash_id = \''+params[:ids]+'\'').first
    @diff = TimeDifference.between(@pays.job_start , @pays.job_valid).in_days.to_s
    pid = Payment.where(:payment_hash_id => params[:ids]).first
    @logs = PaymentLog.where(:payment_id => pid.id )
  end

  def approve
    payment_id = params[:ids]
    userid = session[:user_id]



    pay = Payment.where(:payment_hash_id => payment_id).first
    pay.payment_status = 'paid'
    pay.save

    PaymentLog.create({
      payment_id: pay.id,
      payment_state: 'approved',
      issued_at: Time.now
    })

    redirect_to '/admin/payments/'+payment_id

  end

  def decline
    payment_id = params[:ids]
    pay = Payment.where(:payment_hash_id => payment_id).first
    pay.payment_status = 'declined'
    pay.save

    PaymentLog.create({
                          payment_id: pay.id,
                          payment_state: 'decined',
                          issued_at: Time.now
                      })

    redirect_to '/admin/payments/'+payment_id
  end

end
