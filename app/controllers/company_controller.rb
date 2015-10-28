class CompanyController < ApplicationController
  include SessionHelper
  before_action :ensureCompany
  layout "company"

  def dash
    @current = User.find(session[:user_id])
    @active = 'dashboard'
    @timeline = JobSubscriptionRel.find_by_sql('select job_subscription_rels.month , count(job_subscription_rels.job_id) from job_subscription_rels inner join jobs on jobs.id = job_subscription_rels.job_id  where jobs.user_id = \''+session[:user_id].to_s+'\' group by job_subscription_rels.month')
    lastWeek = Chronic.parse('last week')

    @lastWeekSubscriber = JobSubscriptionRel.find_by_sql('select * from job_subscription_rels inner join jobs on job_subscription_rels.job_id = jobs.id where jobs.user_id = \''+session[:user_id].to_s+'\' and job_subscription_rels.created_at < \''+lastWeek.to_s+'\'')
    @thisWeekSubscriber = JobSubscriptionRel.find_by_sql('select * from job_subscription_rels inner join jobs on job_subscription_rels.job_id = jobs.id where jobs.user_id = \''+session[:user_id].to_s+'\'')

    @percent = BigDecimal.new(@thisWeekSubscriber.size - @lastWeekSubscriber.size) / @thisWeekSubscriber.size * 100
    @pays = Job.find_by_sql('select * from jobs inner join payments on jobs.id = payments.job_id where payments.payment_status = \'unpaid\' and jobs.user_id = \''+session[:user_id].to_s+'\'')
    @jobs = Job.find_by_sql('select * from jobs inner join payments on jobs.id = payments.job_id where payments.payment_status = \'paid\' and jobs.user_id = \''+session[:user_id].to_s+'\' and jobs.job_start <= \''+Chronic.parse('today').to_s+'\' and jobs.job_valid >= \''+Chronic.parse('today').to_s+'\'')

  end

end
