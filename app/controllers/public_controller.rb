class PublicController < ApplicationController
  layout "public"

  def register
    @states = State.all

  end

  def landing

  end

  def signup
    hashid = Hashids.new('carikerjaan indonesia',8)

    @currentUser = User.create({
      user_name: params[:register][:name],
      user_email: params[:register][:email],
      password: params[:register][:password],
      user_role: params[:register][:role],
      state_id: params[:register][:state],
      city_id: params[:register][:city]
    })

    @currentUser.user_hash_id = hashid.encode(@currentUser.id)
    @currentUser.save
    flash[:info] = "User "+@currentUser.user_name+" has been created"
    redirect_to '/login'
  end

  def job
    if session[:user_id]
      @current = User.find(session[:user_id])
    end
    @states  = State.all
    @categories = Category.all

    today = Chronic.parse('today')
    category = params[:cat] || "0"
    location = params[:loc] || "0"
    query = params[:query] || ""
    key = ""
    p = params[:page] || 1

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
    if !p
      p = 1.to_s
      key+=p
    else
      key +=p.to_s
    end
    if !query
      query = ""
      key +="all"
    else
      key +=query
    end

    key = "jobs_"+key

    cache = Rails.cache.fetch(key)

    if cache.nil?
      if(category == "0" && location == "0")
        Rails.cache.fetch(key , :expires_in => 2.minutes) do
          @jobs = Job.joins(:payment).paginate(:page => p).where(:payments => { :payment_status => 'paid'}).where("job_start <= ? ",today).where('lower(job_name) LIKE ? OR lower(job_description) LIKE ?' , '%'+query.downcase+'%' , '%'+query.downcase+'%')
        end
      elsif  (category != "0" && location == "0")
        Rails.cache.fetch(key , :expires_in => 2.minutes) do
          @jobs = Job.joins(:payment).paginate(:page => p).where(:payments => { :payment_status => 'paid'}).where("job_start <= ? ",today).where(:category_id => category).where('lower(job_name) LIKE ? OR lower(job_description) LIKE ?' , '%'+query.downcase+'%' , '%'+query.downcase+'%')
        end
      elsif (category == "0" && location != "0" )
        Rails.cache.fetch(key , :expires_in => 2.minutes) do
          @jobs = Job.joins(:payment).paginate(:page => p).where(:payments => { :payment_status => 'paid'}).where("job_start <= ? ",today).where(:state_id => location).where('lower(job_name) LIKE ? OR lower(job_description) LIKE ?' , '%'+query.downcase+'%' , '%'+query.downcase+'%')
        end
      else
        Rails.cache.fetch(key , :expires_in => 2.minutes) do
          @jobs = Job.joins(:payment).paginate(:page => p).where(:payments => { :payment_status => 'paid'}).where("job_start <= ? ",today).where(:state_id => location).where(:category_id => category).where('lower(job_name) LIKE ? OR lower(job_description) LIKE ?' , '%'+query.downcase+'%' , '%'+query.downcase+'%')
        end
      end

    else
      @jobs = cache
    end

  end

  def jobdetail
    if session[:user_id]
      @current = User.find(session[:user_id])
    end
    @job = Job.where('job_hash_id = ? ' , params[:ids]).first

  end

  def jobthm
    if session[:user_id]
      @current = User.find(session[:user_id])
    end
    @states  = State.all
    @categories = Category.all
  end

end
