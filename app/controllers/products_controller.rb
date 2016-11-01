class ProductsController < ApplicationController
  http_basic_authenticate_with name:  ENV["ADMIN_USERNAME"], password:  ENV["ADMIN_PASSWORD"], except: [:index, :show]
  def index
		@products = Product.all.paginate(:page => params[:page], :per_page => 5)
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
		@product.save

		if @product.persisted?
			flash["notice"] = "Product successfully created"
			redirect_to @product
		else
			render 'new'
		end
	end

	def show
		@product = Product.friendly.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])

		if @product.update(product_params)
			redirect_to @product
		else
			render 'edit'
		end
	end

	def edit
		@product = Product.find(params[:id])
	end

	def destroy
	  @product = Product.find(params[:id])
	  @product.destroy
	  redirect_to products_path
	end

	private
	  def product_params
	    params.require(:product).permit(:name, :description, :main_image, :price, :first_thumbnail,
	    	:second_thumbnail, :third_thumbnail)
	  end
end
