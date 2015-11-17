class ApiJobsController < ApplicationController

  def list
    today = Chronic.parse('today')
    category = params[:cat]
    query = params[:query]
    if !category
      category = "0"
    end
    location = params[:loc]
    if !location
      location = "0"
    end
    if !query
      query = ""
    end

    if(category == "0" && location == "0")
      jobs = Job.joins(:payment).where(:payments => { :payment_status => 'paid'}).where("job_start <= ? ",today).where('lower(job_name) LIKE ? OR lower(job_description) LIKE ?' , '%'+query.downcase+'%' , '%'+query.downcase+'%')
    elsif  (category != "0" && location == "0")
      jobs = Job.joins(:payment).where(:payments => { :payment_status => 'paid'}).where("job_start <= ? ",today).where(:category_id => category)
    elsif (category == "0" && location != "0" )
      jobs = Job.joins(:payment).where(:payments => { :payment_status => 'paid'}).where("job_start <= ? ",today).where(:state_id => location)
    else
      jobs = Job.joins(:payment).where(:payments => { :payment_status => 'paid'}).where("job_start <= ? ",today).where(:state_id => location).where(:category_id => category)
    end

    job = Array.new

    if jobs.length > 0
      jobs.each do |j|
        job.push({
                     job_name: j.job_name,
                     job_description: j.job_description,
                     category: j.category.category_name,
                     state: j.state.state_name,
                     city: j.city.city_name,
                     user: {
                         user_name: j.user.user_name,
                         user_email: j.user.user_email,
                         avatar: j.user.avatar
                     },

                 })
      end
    end

    render :json => job.to_json()
  end

end
