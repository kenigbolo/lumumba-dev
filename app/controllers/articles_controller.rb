class ArticlesController < ApplicationController

  ARTICLES_PER_PAGE = 5

  before_action :authenticate_user!, except: [:index, :show]

  def index
    @articles = Article.all.page(params[:page]).per(ARTICLES_PER_PAGE)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    @article.author = current_user.to_s

    if @article.save
      flash['notice'] = 'Post successfully created.'
      article_notification(@article)
      redirect_to @article
    else
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def upvote
    article = Article.find(params[:id])
    if current_user.voted_for? article
      flash[:error] = 'You already liked this article!'
    else
      article.upvote_by current_user
      flash[:notice] = 'Liked!'
      vote_notification article
    end
    redirect_back(fallback_location: root_path)
  end

  def update
    @article = Article.where(user: current_user.id).find(params[:id])

    if @article.update(article_params)
      flash[:notice] = 'Post successfully updated.'
      redirect_to @article
    else
      render 'edit'
    end
  end

  def edit
    @article = Article.find(params[:id])
    unless current_user == @article.user
      redirect_to @article
      return
    end
  end

  def destroy
    article = Article.find(params[:id])
    if article.user == current_user
      article.destroy
      flash['notice'] = 'Successfully deleted this post.'
    else
      flash['notice'] = 'You do not hae the permission to delete this post'
    end
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :description, :image)
  end

  def vote_notification(article)
    message = "Your blogpost was liked by #{current_user.first_name}. View it [here](#{article_path(article)})"
    notice = Notification.new(notice: message, user: current_user)
    save_notification(notice)
  end

  def article_notification(article)
    message = "You created a blogpost. View it [here](#{article_path(article)})"
    notice = Notification.new(notice: message, user: current_user)
    save_notification(notice)
  end

  def save_notification(notification)
    notification.save
    unless notification.persisted?
      message = "Notification failed: #{notification.errors.messages}"
      Rollbar.warn message
      Rails.logger.warn message
    end
  end

end
