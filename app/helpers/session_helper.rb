module SessionHelper
  def ensureAdmin
    if session[:user_id]
      if session[:user_role] != 'admin'
        redirect_to '/'
      end
    else
      redirect_to '/'
    end
  end

  def ensureCompany
    if session[:user_id]
      if session[:user_role] != 'company'
        redirect_to '/'
      end
    else
      redirect_to '/'
    end
  end
end
