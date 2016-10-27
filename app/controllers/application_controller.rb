class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include ActionController::HttpAuthentication::Basic::ControllerMethods

  def after_sign_in_path_for(resource)
    user_path(resource.slug)
  end

  def authenticate_admin
    http_basic_authenticate_with name:  ENV["ADMIN_USERNAME"], password:  ENV["ADMIN_PASSWORD"]
  end
end
