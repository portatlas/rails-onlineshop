class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name,  null: false
      t.integer :price, null: false
      t.text :description, null: false
      t.string :brand
      t.integer :stock_count, null: false
      t.float :discount
      t.string :img_url

      t.timestamps null: false
    end
  end
end
