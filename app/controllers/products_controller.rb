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
      @products = Category.find_by(name:params[:category]).products
    end
  end
  

  def new
    if current_user && current_user.admin?
      @product = Product.new
    else
      redirect_to "/"
    end
  end

  def create
    if params[:stock_info] == "In Stock"
      stock = true
    else
      stock = false
    end
    supplier = Supplier.find_by(name: params[:supplier])
    # product = Product.create(name: params[:name], price: params[:price], description: params[:description], stock_info: stock, user_id: current_user.id)
    @product = Product.new(name: params[:name], price: params[:price], description: params[:description], stock_info: stock, supplier: supplier, user_id: current_user.id)
    if @product.save
      flash[:success] = "Game Created"
      # redirect_to "/index/images/new"
      redirect_to "/index"
    else
      flash[:danger] = "You hella messed up."
      render :new
    end
  end

  def show
    @carted_product = CartedProduct.new
    id = params[:id]
    @product = Product.find_by(id: id)
    @images = @product.images
  end

  def edit
    id = params[:id]
    @product = Product.find_by(id: id)
  end

  def update
    id = params[:id]
    product = Product.find_by(id: id)
    name = params[:name]
    price = params[:price]
    description = params[:description]
    if params[:stock_info] == "In Stock"
      stock = true
    else
      stock = false
    end

    product.update(name: name, price: price, description: description, stock_info: stock, user_id: current_user.id)
    flash[:info] = "Game Updated"
    redirect_to "/index/#{product.id}"

  end

  def destroy
    id = params[:id]
    @product = Product.find_by(id: id)
    @product.destroy
    flash[:danger] = "Game Deleted!"
    redirect_to "/index"
  end

  def search
    search_term = params[:search]
    @products = Product.where("name iLIKE ? OR description iLIKE ?", "%#{search_term}%", "%#{search_term}%")
    render :index
  end

end
