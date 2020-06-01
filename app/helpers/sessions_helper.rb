module SessionsHelper
  def create_session(user)
    session[:user_id] = user.id
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    elsif cookies.signed[:user_id]
      user = User.find_by(id: cookies.signed[:user_id])
      if user && user.authenticate?(cookies[:remember_token])
        create_session(user)
        @current_user = user
      end
    end
  end

  def create_cookies(user)
    user.create_token_db
    cookies.permanent[:remember_token] = user.remember_token
    cookies.permanent.signed[:user_id] = user.id
  end

  def logged_in?
    !current_user.nil?
  end

  def delete_cookies(user)
    user.forget_digest_db
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  def log_out
    delete_cookies(current_user)
		session.delete(:user_id)
		@current_user = nil
  end
end
