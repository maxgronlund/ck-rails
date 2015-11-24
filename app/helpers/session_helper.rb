module SessionHelper
  def ensureAdmin
    if session[:user_id]
      if session[:user_role] != 'admin'
        flash[:warning] = 'You have to be admin to access that page.'
        redirect_to '/login'
      end
    else
      flash[:warning] = 'Login required.'
      redirect_to '/login'
    end
  end

  def ensureCompany
    if session[:user_id]
      if session[:user_role] != 'company'
        flash[:warning] = 'You have to be company user to access that page.'
        redirect_to '/login'
      end
    else
      flash[:warning] = 'Login required.'
      redirect_to '/login'
    end
  end

  def ensureBasic
    if session[:user_id]
      if session[:user_role] != 'user'
        flash[:warning] = 'You have to be a basic user to access that page.'
        redirect_to '/login'
      end
    else
      flash[:warning] = 'Login required.'
      redirect_to '/login'
    end
  end

  def clear_api_cache
    $redis.flushdb
  end

end
