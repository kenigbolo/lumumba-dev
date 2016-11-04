class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include ActionController::HttpAuthentication::Basic::ControllerMethods

  def after_sign_in_path_for(resource)
    user_path(resource.slug)
  end

  def authenticate_admin!
    unless current_user.nil?
      unless current_user.is_admin?
        flash[:error] = 'Access denied'
        redirect_to root_path
      end
    end
  end
end
