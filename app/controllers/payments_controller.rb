class PaymentsController < ApplicationController
  include SessionHelper
  before_action :ensureAdmin
  layout 'admin'

  def list
    @current = User.find(session[:user_id])
    @alluser = User.all.take(20)
  end
end
