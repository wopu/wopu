class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by id: session[:user_id]
    end
  end
  helper_method :current_user

  def admin?
    current_user.is_a? Admin
  end
  helper_method :admin?

  def sign_in(user)
    session[:user_id] = user.id if user
  end

end
