class SuppliersController < ApplicationController

  # before_action :authenticate_admin!, except: [:index, :show]
  before_action :suppliers_only!, except: [:index, :show]

  def index
    @suppliers = Supplier.where(active: true)
  end

  def new
    @supplier = Supplier.new
  end

  def create
    @supplier = Supplier.new(supplier_params)
    if @supplier.save
      redirect_to "/suppliers/#{@supplier.id}"
    else
      render :new
    end
  end

  def show
    @supplier = Supplier.find_by(id: params[:id])
  end

  def edit
    @supplier = Supplier.find_by(id: params[:id])
  end

  def update
    @supplier = Supplier.find_by(id: params[:id])
    if @supplier.update(supplier_params)
      redirect_to "/suppliers/#{@supplier.id}"
    else
      render :edit
    end
  end

  def destroy
    Supplier.find_by(id: params[:id]).update(active: false)
    redirect_to "/suppliers"
  end

  private
  def supplier_params
    params.require(:supplier).permit(:name, :phone, :email, :first_name, :last_name)
  end
end
