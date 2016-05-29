class ChangeTotalPriceToProductOrders < ActiveRecord::Migration
  def change
    change_column :product_orders, :total_price, :decimal, :precision => 7, :scale => 2
  end
end
