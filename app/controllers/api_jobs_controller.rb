class ApiJobsController < ApplicationController

  def list
    today = Chronic.parse('today')
    category = params[:cat]
    query = params[:query]
    key = ""
    if !category
      category = "0"
      key +="0"
    else
      key +=category
    end
    location = params[:loc]
    if !location
      location = "0"
      key +="0"
    else
      key +=location
    end
    if !query
      query = ""
      key +="all"
    else
      key +=query
    end

    jobapi = $redis.get(key)

    if jobapi.nil?
      if(category == "0" && location == "0")
        jobs = Job.joins(:payment).where(:payments => { :payment_status => 'paid'}).where("job_start <= ? ",today).where('lower(job_name) LIKE ? OR lower(job_description) LIKE ?' , '%'+query.downcase+'%' , '%'+query.downcase+'%')
      elsif  (category != "0" && location == "0")
        jobs = Job.joins(:payment).where(:payments => { :payment_status => 'paid'}).where("job_start <= ? ",today).where(:category_id => category).where('lower(job_name) LIKE ? OR lower(job_description) LIKE ?' , '%'+query.downcase+'%' , '%'+query.downcase+'%')
      elsif (category == "0" && location != "0" )
        jobs = Job.joins(:payment).where(:payments => { :payment_status => 'paid'}).where("job_start <= ? ",today).where(:state_id => location).where('lower(job_name) LIKE ? OR lower(job_description) LIKE ?' , '%'+query.downcase+'%' , '%'+query.downcase+'%')
      else
        jobs = Job.joins(:payment).where(:payments => { :payment_status => 'paid'}).where("job_start <= ? ",today).where(:state_id => location).where(:category_id => category).where('lower(job_name) LIKE ? OR lower(job_description) LIKE ?' , '%'+query.downcase+'%' , '%'+query.downcase+'%')
      end

      job = Array.new

      if jobs.length > 0
        jobs.each do |j|
          job.push({
                       job_hash_id: j.job_hash_id,
                       job_name: j.job_name,
                       job_description: j.job_description,
                       category: j.category.category_name,
                       salary: j.salary.salary_string,
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

      $redis.set(key , job.to_json())
    else
      job = $redis.get(key)
    end

    render :json => job
  end

end
