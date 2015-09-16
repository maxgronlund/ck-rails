class SessionController < ApplicationController

	def auth
		cuser = User.where(:user_email => params[:session][:email]).first
		if cuser && cuser.authenticate(params[:session][:password])
			session[:user_id] = cuser.id
			redirect_to '/home'
		end	
	end	

end
