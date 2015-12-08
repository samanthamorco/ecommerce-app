class ProductsController < ApplicationController

# http://apidock.com/rails/ActiveRecord/QueryMethods/where

  before_action :authenticate_admin!, except: [:index, :show, :search]
  # before_action :authenticate_admin!, only: [:new, :create, :destroy, :update, :edit]

  def index
    @categories = Category.all
    if params[:showall] == "false"
      @products = Product.get_discounted
    else
      @products = Product.all
    end

    if params[:order] == "ascending"
      @products = Product.order(:price)
    elsif params[:order] == "descending"
      @products = Product.order(price: :desc)
    end

    if params[:category]
      @products = Category.find_by(name: params[:category]).products
    end
  end
  

  def new
    if current_user && current_user.admin?
      @product = Product.new
      @product.user_id = current_user
      @product.images.build
    else
      redirect_to "/products"
    end
  end

  def create

    @product = Product.new(product_params)
    if @product.save
      flash[:success] = "Game Created"
      redirect_to "/products"
    else
      flash[:danger] = "Game Not Created. Error!"
      render :new
    end
  end

  def show
    @carted_product = CartedProduct.new
    id = params[:id]
    @product = Product.find_by(id: id)
  end

  def edit
    @product = Product.find_by(id: params[:id])
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.update(product_params)
    @product.user_id = current_user
    flash[:success] = "This game has been updated!"
    redirect_to "/products/#{@product.id}"
  end

  def destroy
    id = params[:id]
    @product = Product.find_by(id: id)
    @product.destroy
    flash[:danger] = "Game Deleted!"
    redirect_to "/products"
  end

  def search
    @categories = Category.all
    search_term = params[:search]
    # @products = Product.where("name iLIKE ? OR description iLIKE ?", "%#{search_term}%", "%#{search_term}%")
    @products = Product.where("name LIKE ? OR description LIKE ?", "%#{search_term}%", "%#{search_term}%")
    render :index
  end

  private

  def product_params
    params.require(:product).permit(:name, :supplier_id, :user_id, :price, :description, :stock_info, images_attributes: [:image_url])
  end

end
