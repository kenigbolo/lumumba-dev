class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
  	@user = User.friendly.find(params[:id])
  	@designs = Design.where("user_id = ?", @user.id).paginate(:page => params[:page], :per_page => 2)
  end

  def design
    @designs = Design.where("user_id = ?", current_user.id).paginate(:page => params[:page], :per_page => 2)
  end
end
