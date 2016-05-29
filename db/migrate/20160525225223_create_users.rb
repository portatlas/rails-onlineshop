class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zipcode

      t.timestamps null: false
    end
  end
end
