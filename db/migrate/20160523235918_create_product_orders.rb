class CreateProductOrders < ActiveRecord::Migration
  def change
    create_table :product_orders do |t|
      t.integer :product_id
      t.integer :number_of_items
      t.integer :total_price
      t.integer :order_id

      t.timestamps null: false
    end
  end
end
