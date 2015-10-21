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
  end

end
