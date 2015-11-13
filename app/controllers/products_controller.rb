class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def games
    @products = Product.all
  end

  def parameters
    @message = params[:message]
    @second_message = params[:second_message]
  end

  def new
  end

  def create
    Product.create(name: params[:name], price: params[:price], description: params[:description], image: params[:image])
    @products = Product.all
  end

  def show
    id = params[:id]
    @product = Product.find_by(id: id)
  end

  def edit
    id = params[:id]
    @product = Product.find_by(id: id)
  end

  def update
    id = params[:id]
    game = Product.find_by(id: id)
    name = params[:name]
    price = params[:price]
    description = params[:description]
    image = params[:image]

    game.update(name: name, price: price, description: description, image: image)

  end

  def destroy
    id = params[:id]
    @product = Product.find_by(id: id)
    @product.destroy
  end
end
