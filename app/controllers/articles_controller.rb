class ArticlesController < ApplicationController
	before_action :authenticate_user!, :except => [:index, :show]
	def index
		@articles = Article.all.page(params[:page]).per(5)
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
		@article.user_id = current_user.id
		@article.save

		if @article.persisted?
			flash["notice"] = "Post successfully created"
			article_notification(article)
			redirect_to article
		else
			render 'new'
		end
	end

	def show
		@article = Article.find(params[:id])
	end

	def upvote
	  article = Article.find(params[:id])
	  unless current_user.voted_for?  article
	  	article.upvote_by current_user
	  	flash[:notice] = "Thanks for liking the blog post"
	  	vote_notification
	  end
	  redirect_to :back
	end

	def update
		@article = Article.find(params[:id])

		if article.update(article_params)
			redirect_to @article
		else
			render 'edit'
		end
	end

	def edit
		@article = Article.find(params[:id])
		if current_user.id != @article.user.id
			redirect_to @article
		end
	end

	def destroy
	  article = Article.find(params[:id])
	  if current_user.id == article.user.id
	  	article.destroy
	  	flash["notice"] = "successfully deleted this post"
	  else
	  	flash["notice"] = "You do not hae the permission to delete this post"
	  end
	  redirect_to articles_path
	end

	private
	  def article_params
	    params.require(:article).permit(:title, :description, :image)
	  end
	  def vote_notification
	  	notice = Notification.new(notice: "Your blogpost was liked by #{current_user.first_name}. View it [here](articles/#{article.slug})", user_id: current_user.id)
			save_notice(notice)
	  end
		def article_notification(article)
			notice = Notification.new(notice: "You created a blogpost. View it [here](articles/#{article.slug})", user_id: current_user.id)
			save_notice(notice)
		end
    def save_notice(notice)
			notice.save
			unless notice.persisted?
				msg = "Notification failed: #{notification.error.messages}"
				Rollbar.warn msg
				Rails.logger.warn msg
			end
		end
end
