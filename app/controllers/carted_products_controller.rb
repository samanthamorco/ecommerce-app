class CartedProductsController < ApplicationController

  def index
    if current_user && current_user.carted_products.where(status: "carted").any?
      @carted_products = current_user.carted_products.where(status: "carted")
      @subtotal = calculate_subtotal(@carted_products)
      @tax = calculate_tax(@carted_products)
      @total = @subtotal + @tax
      if params[:remove]
        @remove = @carted_products.find_by(id: params[:remove])
        @remove.update(status: "removed")
      end
    else
      redirect_to "/"
    end
  end

  def create
    @product = Product.find_by(id: params[:product_id])
    @carted_product = CartedProduct.new(user_id: current_user.id, product_id: params[:product_id], quantity: params[:quantity], status: "carted")
    if @carted_product.save
      flash[:success] = "Item Added to Cart"
      redirect_to "/cart"
    else
      render template: "products/show"
    end
  end

  def destroy
    carted_product = CartedProduct.find_by(id: params[:id])
    carted_product.status = "removed"
    if carted_product.save
      flash[:warning] = "#{carted_product.quantity} copies of #{carted_product.product.name}"
    else
      flash[:danger] = "Product not removed. Please try again."
      redirect_to "/cart"
    end
  end



end
