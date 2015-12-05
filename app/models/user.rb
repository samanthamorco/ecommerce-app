class User < ActiveRecord::Base
  has_many :products
  has_many :orders
  has_many :carted_products
  belongs_to :role

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def admin?
    role.name == "admin"
  end

  def shopper?
    role.name == "shopper"
  end

  def supplier?
    role.name == "supplier"
  end
  
end
