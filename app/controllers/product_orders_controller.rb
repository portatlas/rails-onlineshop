class ProductOrdersController < ApplicationController

  def create
    # check if the product_stock count is less than or equal to
    # the amount being add then show an error message
    # else continue and add the orders to the basket and reduce the stock

    @order = current_order
    @order.user_id = session[:user_id]
    @product_order = @order.product_orders.new(product_order_params)
    product = Product.find(@product_order.product_id)
    if @product_order.number_of_items <= product.stock_count
      quant = @product_order.number_of_items
      @order.save
    end
    # session[:order_id] = @order.id
  end


  def update
    @order = current_order
    @product_order = @order.product_orders.find(params[:id])
    product = Product.find(@product_order.product_id)
    if (params[:product_order][:number_of_items]).to_i <= product.stock_count
      @product_order.update_attributes(product_order_params)
      @product_orders = @order.product_orders
    end
  end


  def destroy
    @order = current_order
    @product_order = @order.product_orders.find(params[:id])
    @product_order.destroy
    @product_orders = @order.product_orders
  end

private
  def product_order_params
    params.require(:product_order).permit(:number_of_items, :product_id)
  end


end
