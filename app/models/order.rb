class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :order_status
  has_many :product_orders
  has_many :products, through: :product_orders

  before_create :set_order_status
  before_save :update_total

  def total
    product_orders.collect { |oi| oi.valid? ? (oi.number_of_items * oi.unit_price) : 0 }.sum
  end

  private
  def set_order_status
    self.order_status_id = 1
  end

  def update_total
    self[:total_value] = total
  end


end
