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
  end

end
