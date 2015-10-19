class BasicController < ApplicationController
  include SessionHelper
  before_action :ensureBasic
  layout "basic"

  def dashboard
    @current = User.find(session[:user_id])
    @active = 'dashboard'
    @section = 'Dashboard'
  end

end
