class CompanyController < ApplicationController
  include SessionHelper
  before_action :ensureCompany
  layout "company"

  def dash
    @current = User.find(session[:user_id])
  end

end
