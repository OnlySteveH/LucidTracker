module SessionsHelper
  def log_in(user, options = {})
    if options[:remember] == '1'
      remember user
    else
      reset_session
      session[:user_id] = user.id
    end
  end

  def remember(user)
    remember_token = user.remember
    cookies.permanent[:remember_token] = remember_token
    cookies.permanent.signed[:user_id] = user.id
  end

  def current_user
    @current_user || find_current_user
  end

  def find_current_user
    if (user_id = session[:user_id])
      @current_user = User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      remember_token = cookies[:remember_token]
      (@current_user = user) if user && user.authenticated?(remember_token)
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def forget(user)
    user.forget
    cookies.delete(:remember_token)
    cookies.delete(:user_id)
  end

  def log_out
    forget current_user
    reset_session
    @current_user = nil
  end
end
