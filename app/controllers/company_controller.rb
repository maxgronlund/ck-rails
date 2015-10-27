class CompanyController < ApplicationController
  include SessionHelper
  before_action :ensureCompany
  layout "company"

  def dash
    @current = User.find(session[:user_id])
    @active = 'dashboard'
    @timeline = JobSubscriptionRel.find_by_sql('select job_subscription_rels.created_at , count(job_subscription_rels.job_id) from job_subscription_rels inner join jobs on jobs.id = job_subscription_rels.job_id  where jobs.user_id = \''+session[:user_id].to_s+'\' group by job_subscription_rels.created_at')
  end

end
