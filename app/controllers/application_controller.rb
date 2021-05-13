# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  add_flash_types :info

  rescue_from CanCan::AccessDenied do |exception|
    if current_user.present?
      redirect_back(fallback_location: root_path, info: exception.message)
    else
      redirect_to new_user_session_path, info: "You need to sign in or sign up before continuing."
    end
  end

  protected def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
