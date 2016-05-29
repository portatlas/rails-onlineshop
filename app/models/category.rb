class Category < ActiveRecord::Base

  validates :name, uniqueness: true

  has_many :category_products
  has_many :products, through: :category_products

end
