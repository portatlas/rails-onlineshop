class Product < ActiveRecord::Base

  has_many :product_orders
  has_many :orders, through: :product_orders

  has_many :category_products
  has_many :categories, through: :category_products

  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :stock_count, presence: true, :numericality => { :greater_than_or_equal_to => 0 }
  validates :img_url, presence: true


end
