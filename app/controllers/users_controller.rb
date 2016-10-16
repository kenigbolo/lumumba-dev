class UsersController < ApplicationController
  # before_action :authenticate_user!

  def show
  	@user = User.friendly.find(params[:id])
  	if current_user.id == @user.id
  	  @page = "settings"
  	else
  	  @page = "profile"
  	end
  end

end
