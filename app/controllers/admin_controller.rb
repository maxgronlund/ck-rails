class AdminController < ApplicationController
  include SessionHelper
  before_action :ensureAdmin
  layout "admin"

  def dashboard
    @current = User.find(session[:user_id])
    @active = 'dashboard'
  end

end
