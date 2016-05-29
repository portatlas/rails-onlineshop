class ChangeTotalValueToOrder < ActiveRecord::Migration
  def change
    change_column :orders, :total_value, :decimal, :precision => 7, :scale => 2
  end
end
