module ApiHelper
  def responseFormat
    @response = {
      :status => 0,
      :message => '',
      :data => '',
    }
  end

  def validateJWT
    hmac_secret = 'ca12!k3rj44n2015'
		token = request.headers['Authorization']
		begin
		  decoded_token = JWT.decode token, hmac_secret, true, { :algorithm => 'HS256' }
		rescue JWT::ExpiredSignature
		  # Handle expired token, e.g. logout user or deny access
		  message = {
        :status => 401,
				:message => 'Expired Session.',
				:data => nil
			}
		rescue JWT::DecodeError
		  # Handle error token, e.g. logout user or deny access
		  message = {
        :status => 401,
				:message => 'Invalid Token.',
				:data => nil
			}
		end

		if message != nil
			render :json => message.to_json
		end

  end

  def set_cache(key,object)
    Rails.cache.fetch(key , :expires_in => 2.minutes) do
    end
  end

  def get_cache(key)
    Rails.cache.fetch(key)
  end

end
