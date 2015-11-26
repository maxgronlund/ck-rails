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
  end

  def jobdetail
    if session[:user_id]
      @current = User.find(session[:user_id])
    end
    @job = Job.where('job_hash_id = ? ' , params[:ids]).first

  end

end
