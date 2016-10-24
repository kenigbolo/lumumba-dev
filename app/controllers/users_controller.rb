class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
  	@user = User.friendly.find(params[:id])
  end

  def design
    @designs = Design.where("user_id = ?", current_user.id).paginate(:page => params[:page], :per_page => 2)
  end

  def address
  	@address = Address.where()where("user_id = ?", current_user.id)
  	if @address.empty?
  		render 'shipping_address'
  	else
  		# redirect_to address controller / edit action
  	end
  end
end
