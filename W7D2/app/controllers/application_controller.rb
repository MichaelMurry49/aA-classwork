class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?, :require_logout

  def login(user)
    @current_user = user
    session[:session_token] = user.reset_session_token!
  end

  def current_user 
    return nil unless session[:session_token]

    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logout() 
    @user = current_user

    if @user 
      @user.reset_session_token! 
      session[:session_token] = nil 
    end 
  end

  def logged_in?
    !!current_user 
  end

  def require_logout
   if logged_in? 
    redirect_to cats_url
    end 
  end
end
