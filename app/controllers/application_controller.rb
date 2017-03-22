class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?


  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,keys:[:nickname])
      devise_parameter_sanitizer.permit(:account_update,keys:[:nickname])
      devise_parameter_sanitizer.permit(:sign_up,keys:[:last_name])
      devise_parameter_sanitizer.permit(:account_update,keys:[:last_name])
      devise_parameter_sanitizer.permit(:sign_up,keys:[:introduction])
      devise_parameter_sanitizer.permit(:account_update,keys:[:introduction])

    end
end
