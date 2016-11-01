class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:search]
      @users = User.where("first_name LIKE ?", "%#{params[:search]}%").page(params[:page]).per(20)
    else
      @users = User.all.page(params[:page]).per(20)
    end
  end

  def show
  	@user = User.friendly.find(params[:id])
    @designs = Design.where("user_id = ?", @user.id).page(params[:page]).per(6)
    @articles = Article.where("user_id = ?", @user.id).page(params[:page]).per(3)
  end

  def design
    @designs = Design.where("user_id = ?", current_user.id).page(params[:page]).per(2)
  end

  def order
    @orders = current_user.orders.page(params[:page]).per(5)
  end

  def content
    @articles = Article.where("user_id = ?", current_user.id).page(params[:page]).per(5)
  end
end
