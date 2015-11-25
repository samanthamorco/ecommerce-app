class ProductsController < ApplicationController

  # def index
  #   @products = Product.all

  # end

# http://apidock.com/rails/ActiveRecord/QueryMethods/where

  def index

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


  #   @showall = params[:showall]
  #   @discounted = []
  #   @allproducts = []

  #   @products.each do |product|
  #     if product.sale_message == "Discount item!"
  #       @discounted << product
  #     end
  #   end

  #   if @showall == "false"
  #     @allproducts = @discounted
  #   else
  #     @allproducts = @products
  #   end
  # end

  # def parameters
  #   @message = params[:message]
  #   @second_message = params[:second_message]

  end

  def new
  end

  def create
    if params[:stock_info] == "In Stock"
      stock = true
    else
      stock = false
    end
    supplier = Supplier.find_by(name: params[:supplier])
    product = Product.create(name: params[:name], price: params[:price], description: params[:description], stock_info: stock, user_id: current_user.id, supplier_id: supplier.id)
    # image = Image.create(image_url: params[:image], product_id: product.id)
    flash[:success] = "Game Created"
    redirect_to "/index/images/new"
  end

  def show
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
    @products = Product.where("name LIKE ? OR description LIKE ?", "%#{search_term}%", "%#{search_term}%")
    render :index
  end

end
