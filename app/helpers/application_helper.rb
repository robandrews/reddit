module ApplicationHelper

  def login(user)
    session[:token] = user.reset_session_token!
    @current_user = user
  end

  def current_user
    return nil if session[:token].nil?
    @current_user ||= User.find_by_session_token(session[:token])
  end

  def logout
    current_user.reset_session_token!
    session[:token] = nil
  end

  def logged_in?
    !!current_user
  end

  def require_current_user!
    redirect_to new_session_url if current_user.nil?
  end
end
