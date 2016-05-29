class ChangePriceColumnToDecimal < ActiveRecord::Migration
  def change
    change_column :products, :price, :decimal, :precision => 7, :scale => 2, null: false
  end
end
