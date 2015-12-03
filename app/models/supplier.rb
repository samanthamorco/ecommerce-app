class Supplier < ActiveRecord::Base
    has_many :products

    validates :name, :email, :phone, presence: true
    validates :name, :email, :phone, uniqueness: true
    validates :phone, numericality: true
end
