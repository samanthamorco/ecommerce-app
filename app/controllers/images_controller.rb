class ImagesController < ApplicationController
  def new
    @product_id = @product_id
  end

  def create
    id = Product.last.id
    image = Image.create(image_url: params[:image_url], product_id: id)
    flash[:success] = "Image Uploaded"
    redirect_to "/index"
  end
end
