class ApplicationController < ActionController::Base

  before_filter :configure_permitted_parameters, if: :devise_controller?

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    # params.permit(:user, :email, :password, :firstname, :lastname, :admin, :utf8, :authenticity_token, :user, :commit)
    devise_parameter_sanitizer.for(:sign_up) << [:firstname, :lastname, :admin]
    devise_parameter_sanitizer.for(:sign_in) << [:firstname, :lastname, :admin]
    devise_parameter_sanitizer.for(:account_update) << [:firstname, :lastname, :admin]
  end
end
