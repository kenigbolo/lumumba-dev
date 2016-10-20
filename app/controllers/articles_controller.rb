class ArticlesController < ApplicationController
	before_action :authenticate_user!, :except => [:index]
	def index
		@articles = Article.all
	end

	def new
	end

	def create
		@article = Article.new(article_params)
		@article.author = current_user.last_name + " " + current_user.first_name
		@article.save

		if @article.persisted?
			flash["notice"] = "Post successfully created"
		else
			flash["notice"] = "Your Post could not be saved"
		end
		render "index"
	end

	def show
		@article = Article.find(params[:id])
	end

	private
	  def article_params
	    params.require(:article).permit(:title, :description, :image)
	  end
end
