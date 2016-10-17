class RegistrationsController < Devise::RegistrationsController

  protected

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :gender, :phone_number, :description, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :gender , :phone_number, :description, :image, :image_status)
  end

end