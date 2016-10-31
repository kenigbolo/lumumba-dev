class RegistrationsController < Devise::RegistrationsController

  protected

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :gender, :location, :phone_number, 
      :description, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :gender , :location, :phone_number, 
      :description, :avatar, :image_status, :image)
  end

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def after_update_path_for(resource)
    user_path(resource.slug)
  end
end