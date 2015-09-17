class SessionController < ApplicationController

	def auth
		cuser = User.where(:user_email => params[:session][:email]).first
		if cuser && cuser.authenticate(params[:session][:password])
			session[:user_id] = cuser.id
			if cuser.user_role == 'admin'
				redirect_to '/admin'
			elsif cuser.user_role == 'company'
				redirect_to '/company'
			else
				redirect_to '/home'
			end
		end	
	end	

end
