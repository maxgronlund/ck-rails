class Api::V1::AuthController < ApplicationController
  include ApiHelper
  before_action :responseFormat
  protect_from_forgery with: :null_session
  skip_before_filter  :verify_authenticity_token
  require 'jwt'

  def request_token
    hmac_secret = 'ca12!k3rj44n2015'
    email = params[:email]
    password = params[:password]

    user = User.where('user_email = ?' , email).first
    if user && user.authenticate(params[:password])
      exp = Time.now.to_i + 24 * 3600
      payload = {:data => user , :exp => exp}
      token = JWT.encode payload, hmac_secret, 'HS256'
      @response[:data] = token
      @response[:message] = 'Authentication Success.'
      @response[:status] = 200
    else
      @response[:data] = ''
      @response[:message] = 'Authentication Failed.'
      @response[:status] = 401
    end
    render :json => @response.to_json
  end
end
