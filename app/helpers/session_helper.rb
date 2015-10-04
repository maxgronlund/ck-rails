module SessionHelper
  def ensureAdmin
    if session[:user_id]
      if session[:user_role] != 'admin'
        put session[:user_role]
        redirect_to '/'
      end
    else
      redirect_to '/'
    end
  end
end
