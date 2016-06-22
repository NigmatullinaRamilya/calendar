class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    user_params = [:first_name, :second_name, :email, :password, :password_confirmation, :avatar, :avatar_cache,
    :sex, :birthday, :phone_number, :country, :city]

    if params[:action] == 'update'
      devise_parameter_sanitizer.for(:account_update) { 
        |u| u.permit(user_params << :current_password)
      }
    elsif params[:action] == 'create'
      devise_parameter_sanitizer.for(:sign_up) { 
        |u| u.permit(user_params) 
      }
    end
  end

  def set_time_zone
    Time.zone = current_user.time_zone
  end
end
