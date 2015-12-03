class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception



  private

  def calculate_subtotal(carted_products)
    subtotal = 0
    carted_products.each do |item|
      subtotal += (item.product.price * item.quantity)
    end
    return subtotal
  end

  def calculate_tax(carted_products)
    tax = 0
    carted_products.each do |item|
      tax += (item.product.tax * item.quantity)
    end
    return tax
  end
end
