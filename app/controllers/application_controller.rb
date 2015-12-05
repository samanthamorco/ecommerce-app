class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :calculate_cart_count


  private

  def authenticate_admin!
    redirect_to "/" unless current_user && current_user.admin?
    flash[:danger] = "Please don't hack me D:" unless current_user && current_user.admin?
  end

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

  def calculate_cart_count
    if current_user
      if session[:cart_count]
        @cart_count = session[:cart_count]
      else
        session[:cart_count] = current_user.carted_products.where(status: "carted").count
      end
    end
  end

  def suppliers_only!
    redirect_to "/index" unless current_user && (current_user.supplier? || current_user.admin?)
    flash[:warning] = "Must be a supplier or admin to access." unless current_user && (current_user.supplier? || current_user.admin?)
  end


  
end
