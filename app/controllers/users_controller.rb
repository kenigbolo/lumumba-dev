class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:search]
      @users = User.where("first_name LIKE ?", "%#{params[:search]}%").paginate(:page => params[:page], :per_page => 20)
    else
      @users = User.all.paginate(:page => params[:page], :per_page => 20)
    end
  end

  def show
  	@user = User.friendly.find(params[:id])
    @designs = Design.where("user_id = ?", @user.id).paginate(:page => params[:page], :per_page => 6)
    @articles = Article.where("user_id = ?", @user.id).paginate(:page => params[:page], :per_page => 3)
  end

  def design
    @designs = Design.where("user_id = ?", current_user.id).paginate(:page => params[:page], :per_page => 2)
  end

  def address
  	@address = Address.where("user_id = ?", current_user.id)
  	if @address.empty?
  		render 'shipping_address'
  	else
  		# redirect_to address controller / edit action
      redirect_to edit_address_path(@address.first)
  	end
  end
end
