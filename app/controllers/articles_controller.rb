class ArticlesController < ApplicationController
	before_action :authenticate_user!, :except => [:index, :show]
	def index
		@articles = Article.all.paginate(:page => params[:page], :per_page => 5)
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
			redirect_to @article
		else
			render 'new'
		end
	end

	def show
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])

		if @article.update(article_params)
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
	  @article = Article.find(params[:id])
	  if current_user.id == @article.user.id
	  	@article.destroy
	  else
	  	flash["notice"] = "You do not hae the permission to delete this post"	 
	  end
	  redirect_to articles_path
	end

	private
	  def article_params
	    params.require(:article).permit(:title, :description, :image)
	  end
end
