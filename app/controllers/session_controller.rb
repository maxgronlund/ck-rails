class SessionController < ApplicationController

	def auth
		cuser = User.where(:user_email => params[:session][:email]).first
		if cuser && cuser.authenticate(params[:session][:password])
			session[:user_id] = cuser.id
			session[:user_role] = cuser.user_role
			if cuser.user_role == 'admin'
				redirect_to '/admin'
			elsif cuser.user_role == 'company'
				redirect_to '/company'
			elsif cuser.user_role == 'user'
				redirect_to '/job'
			else
				redirect_to '/login'
			end
		else
			flash[:info] = 'User not found'
			redirect_to '/login'
		end	
	end

	def destroy
		reset_session
		flash[:info] = 'You have been logged out.'
		redirect_to '/login'
	end

end
