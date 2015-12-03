class Product < ActiveRecord::Base

  belongs_to :supplier
  belongs_to :user
  has_many :images
  has_many :categorized_products
  has_many :categories, through: :categorized_products
  
  has_many :carted_products
  has_many :orders, through: :carted_products

  validates :name, :price, :description, :stock_info, :user, presence: true
  validates :price, numericality: true


  def friendly_updated_at
    return updated_at.strftime("%B %e, %Y")
  end

  def self.get_discounted
    Product.where("price < ?", 20)
  end

  def sale_message
    if price < 20
      "Discount item!"
    else
      "On Sale!"
    end
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end

  def stock
    if stock_info == true
      stock = "In Stock"
    else
      stock = "Out of Stock"
    end
  end

end
