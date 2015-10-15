class JwtController < ApplicationController

  def test

    payload = {:username => 'Heru Joko' , :user_id => 1 }
    hmac_secret = 'my$ecretK3y'

    token = JWT.encode payload, hmac_secret, 'HS256'

    data = {
        :token => token
    }
    render :json => data.to_json
  end

  def decode
    token = params[:token]
    hmac_secret = 'my$ecretK3y'
    decoded_token = JWT.decode token, hmac_secret, true, { :algorithm => 'HS256' }

    render :json => decoded_token.to_json
  end

end
