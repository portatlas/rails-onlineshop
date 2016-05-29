class OrdersController < ApplicationController
  def index
    @user = User.find_by(id: session[:user_id])
    # binding.pry
    # @order = Order.find_by(user_id: session[:user_id])
    # @orders = []
    # @orders << @order
  end

  def show
    @order = Order.find(params[:id])
  end
end
