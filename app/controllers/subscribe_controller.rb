class SubscribeController < ApplicationController

  include SessionHelper
  before_action :ensureBasic

  def subscribe

    subscriber = session[:user_id]
    job_hash = params[:jobblue]

    job = Job.where('job_hash_id = ? ' , job_hash).first

    msg = {}

    if job
      month = Date.today.strftime("%B")

      create_sub = JobSubscriptionRel.create(
          job_id: job.id,
          user_id: subscriber,
          month: month
      )

      msg = {
          status: "Subscribe success"
      }

    else
      msg = {
          status: "Subscribe failed"
      }
    end

    render :json => msg.to_json()

  end

end
