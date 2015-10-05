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
end
