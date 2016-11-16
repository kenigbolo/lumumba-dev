class ProductsController < ApplicationController

  ARTICLES_PER_PAGE = 5

  before_action :authenticate_admin!, except: [:index, :show]

  def index
    @products = Product.all.page(params[:page]).per(ARTICLES_PER_PAGE)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      flash['notice'] = 'Product successfully created.'
      redirect_to @product
    else
      flash['notice'] = 'Sorry, the product could not be created.'
    end
  end

  def show
    @product = Product.friendly.find(params[:id])
    @order_item = @product.order_items.new
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
    params.require(:product).permit(:name, :description, :main_image, :price, :first_thumbnail, :second_thumbnail, :third_thumbnail, :designer)
  end

end
