class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :admin?, :current_order, :cart_quant, :inventory_update

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorize
    redirect_to '/login' unless current_user
  end

  def admin?
    current_user != nil && current_user.id == User.find_by(username: 'tim').id
  end

  def current_order
    @user = User.find(session[:user_id])

    if @user.orders.where(order_status_id: 1).count > 0
      @user.orders.where(order_status_id: 1).last
    else
      Order.create(user_id: session[:user_id])
    end
  end

  def inventory_update(product_id, quantity_ordered)
    @product = Product.find(product_id)
    if @product.stock_count >= 0
      @product.stock_count = @product.stock_count - quantity_ordered
      @product.save
    end
  end

  def cart_quant
    if current_order == nil
      0
    else
      current_order.product_orders.inject(0){|sum, po| sum + po.number_of_items}
    end
  end

end
