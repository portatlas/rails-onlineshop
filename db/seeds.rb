require 'faker'

Category.delete_all
Product.delete_all
User.delete_all
OrderStatus.delete_all
Order.delete_all
ProductOrder.delete_all

OrderStatus.create(name: "Pending")
OrderStatus.create(name: "Processing")
OrderStatus.create(name: "Canceled")
OrderStatus.create(name: "Completed")

Category.create( name: "Sci-Fi")
Category.create( name: "Sports")
Category.create( name: "Superhero")
Category.create( name: "School")
Category.create( name: "Kids")

20.times do
  scifi = Category.find_by(name: "Sci-Fi")
  kid = Category.find_by(name: "Kids")
  product = Product.create(
      name: Faker::StarWars.character + " T-Shirt",
      price: [11.99, 22.89, 24.45, 16.56].sample,
      description: Faker::Company.catch_phrase,
      brand: Faker::Company.name,
      stock_count: rand(5..20),
      img_url: Faker::Placeholdit.image("300x300", 'jpg')
    )
  product.categories << kid << scifi
end

20.times do
  sports = Category.find_by(name: "Sports")
  product = Product.create(
      name: Faker::Team.name + " T-Shirt",
      price: [8.99, 22.89, 24.45, 17.56].sample,
      description: Faker::Company.catch_phrase,
      brand: Faker::Company.name,
      stock_count: rand(5..20),
      img_url: Faker::Placeholdit.image("300x300", 'jpg')
    )
  product.categories << sports
end

20.times do
  superhero = Category.find_by(name: "Superhero")
  scifi = Category.find_by(name: "Sci-Fi")
  kid = Category.find_by(name: "Kids")
  product = Product.create(
      name: Faker::Superhero.name + " T-Shirt",
      price: [15.99, 24.89, 22.45, 16.56].sample,
      description: Faker::Company.catch_phrase,
      brand: Faker::Company.name,
      stock_count: rand(5..20),
      img_url: Faker::Placeholdit.image("300x300", 'jpg')
    )
  product.categories << superhero << scifi << kid
end

20.times do
  schools = Category.find_by(name: "School")
  product = Product.create(
      name: Faker::University.name + " T-Shirt",
      price: [15.99, 22.83, 25.45, 17.56].sample,
      description: Faker::Company.catch_phrase,
      brand: Faker::Company.name,
      stock_count: rand(5..20),
      img_url: Faker::Placeholdit.image("300x300", 'jpg')
    )
  product.categories << schools
end

User.create(username: 'tim', email: 'tim@tim.com', password: 'timtim', first_name: 'Tim', last_name: 'Timales', street_address: '321 Howards St.', city: 'San Francisco', state: 'CA', zipcode: '94102')

tom = User.create(username: 'tom', email: 'tom@tom.com', password: 'tomtom', first_name: 'Tom', last_name: 'Tomales', street_address: '123 Mission St.', city: 'San Francisco', state: 'CA', zipcode: '94102')

# 5.times do
#   tshirt = Product.create(
#       name: Faker::Team.name + " T-Shirt",
#       price: 22.89,
#       description: Faker::Company.catch_phrase,
#       brand: Faker::Company.name,
#       stock_count: 5,
#       img_url: Faker::Placeholdit.image("300x300", 'jpg')
# end

# Order.create(total_value: 100.99,
#          order_status_id: OrderStatus.all.sample,
#                  user_id: User.find_by(username: "tom"))

tom = User.find_by(username: "tom")
orderstatus = OrderStatus.all.sample
shirt = Product.all.sample

order = Order.create(total_value: 100.99,
         order_status_id: orderstatus.id,
                user_id: tom.id )

ProductOrder.create( product_id: shirt.id,
                number_of_items: 2,
                    total_price: shirt.price * 2,
                       order_id: order.id,
                     unit_price: shirt.price)

tshirt_2 = Product.create(
      name: " T-Shirt Nike",
      price: 22.89,
      description: Faker::Company.catch_phrase,
      brand: Faker::Company.name,
      stock_count: 5,
      img_url: Faker::Placeholdit.image("300x300", 'jpg'))

ProductOrder.create( product_id: tshirt_2.id,
                number_of_items: 2,
                    total_price: tshirt_2.price * 2,
                       order_id: order.id,
                     unit_price: tshirt_2.price)


# Order(id: integer, total_value: decimal, created_at: datetime, updated_at: datetime, order_status_id: integer, user_id: integer)
# ProductOrder(id: integer, product_id: integer, number_of_items: integer, total_price: decimal, order_id: integer, created_at: datetime, updated_at: datetime, unit_price: decimal)






