class UsersController < ApplicationController

  before_action :authenticate_user!

  def index
    query = params[:search].to_s.downcase.presence
    if query
      @users = User.where('LOWER(first_name) LIKE ?', "%#{query}%").page(params[:page]).per(20)
    else
      @users = User.all.page(params[:page]).per(20)
    end
  end

  def show
    @user = User.friendly.find(params[:id])
    @notifications = Notification.where(user: @user).page(params[:page]).per(10)
    @designs = Design.where(user: @user).page(params[:page]).per(6)
    @articles = Article.where(user: @user).page(params[:page]).per(3)
  end

  def design
    @designs = Design.where(user: current_user).page(params[:page]).per(2)
  end

  def order
    @orders = current_user.orders.page(params[:page]).per(5)
  end

  def content
    @articles = Article.where(user: current_user).page(params[:page]).per(5)
  end

end
