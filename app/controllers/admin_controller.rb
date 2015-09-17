class AdminController < ApplicationController
  layout "admin"

  def dashboard
    @current = User.find(session[:user_id])
  end

end
