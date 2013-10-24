class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def admin?
    current_user.is_a? Admin
  end
  helper_method :admin?


  # See https://github.com/plataformatec/devise/#strong-parameters
  before_filter :configure_permitted_parameters, if: :devise_controller?
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end
  protected :configure_permitted_parameters
end
