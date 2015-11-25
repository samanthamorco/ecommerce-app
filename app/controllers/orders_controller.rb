class OrdersController < ApplicationController

  def create
    product = Product.find_by(id: params[:productid])
    quantity = params[:quantity].to_d
    subtotal = product.price * quantity
    tax = product.tax * quantity
    total = tax + subtotal
    order = Order.create(user_id: current_user.id, quantity: params[:quantity], product_id: params[:productid], subtotal: subtotal, tax: tax, total: total)
    flash[:success] = "Order Created"
    redirect_to "/orders/#{order.id}"
    # redirect_to "/orders"
  end

  def show
    @order = Order.find_by(id: params[:id])
  end

end
