class CartsController < ApplicationController
  def show
    @product_orders = current_order.product_orders
  end

  def checkout
    @order = current_order
    @product_orders = current_order.product_orders
    if render 'checkout'
      @order.product_orders.each do |po|
        inventory_update(po.product_id, po.number_of_items)
      end
      if @order.product_orders.size > 0
        UserMailer.invoice_email(@order).deliver_now!
      end
      @order.order_status_id = 2
      @order.save
      current_order
    end
  end
end
