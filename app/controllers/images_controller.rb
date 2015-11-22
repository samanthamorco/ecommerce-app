class ImagesController < ApplicationController
  def new
  end

  def create
    id = params[:id]
    @product = Product.find_by(id: id)
    image = Image.create(image_url: params[:image_url], product_id: id)
    flash[:success] = "Image Uploaded"
    redirect_to "/games/#{product.id}"
  end
end
