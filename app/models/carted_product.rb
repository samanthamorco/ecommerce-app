class CartedProduct < ActiveRecord::Base
  belongs_to :product
  belongs_to :order
  belongs_to :user

  validates :user, :product_id, :quantity, presence: true
  validates :quantity, numericality: true
end
