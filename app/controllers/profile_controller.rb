class ProfileController < ApplicationController
  include SessionHelper
  before_action :ensureBasic
  layout "basic"

  def myprofile
    @current = User.find(session[:user_id])
    @active = 'profile'
    @section = 'Profile'
    @states = State.all
    @cities = City.all
    @exps = UserExperience.where(:user_id => session[:user_id])
    @categories = Category.all
    @currentDetails = UserDetail.where(:user_id => session[:user_id]).first
  end

  def updatedetails
    currentDetaills = UserDetail.where(:user_id => session[:user_id]).first

    if !currentDetaills
      UserDetail.create({
        user_id: session[:user_id],
        userdetail_bio: params[:details][:bio],
        userdetail_phone: params[:details][:phone],
        userdetail_rating: 1,
        userdetail_major: params[:details][:major],
        curriculumvitae: params[:details][:curriculumvitae]
                        })
    else
      currentDetaills.userdetail_bio = params[:details][:bio]
      currentDetaills.userdetail_phone = params[:details][:phone]
      currentDetaills.userdetail_major = params[:details][:major]
      currentDetaills.curriculumvitae = params[:details][:curriculumvitae]
      currentDetaills.save
    end

    flash[:success] = "Profile updated."
    redirect_to '/basic/profile'
  end

  def update
    currentUser = User.find(session[:user_id])
    currentUser.user_name = params[:user][:name]
    currentUser.user_email = params[:user][:email]
    currentUser.password = params[:user][:password]
    currentUser.avatar = params[:user][:avatar]
    currentUser.user_state = params[:user][:state]
    currentUser.user_city = params[:user][:city]
    currentUser.save

    flash[:success] = "Profile updated."
    redirect_to '/basic/profile'
  end

end
