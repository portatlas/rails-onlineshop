class AddUnitPriceToProductOrders < ActiveRecord::Migration
  def change
    add_column :product_orders, :unit_price, :decimal, :precision => 7, :scale => 2, null: false
  end
end
