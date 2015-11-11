class ProductsController < ApplicationController

  def info
    @products = Product.all
  end

  def games
    @products = Product.all
  end

end
