class Order < ActiveRecord::Base
  # belongs_to :product
  belongs_to :user
  has_many :carted_products
  has_many :products, through: :carted_products

  # validates :user, :product_id, :quantity, :subtotal, :tax, :total, presence: true
  # validates :quantity, :user_id, :product_id, :subtotal, :tax, :total, numericality: true

end
