FactoryGirl.define do
  factory :order_status do
    name "MyString"
  end
  # factory :category_product do

  # end

  factory :category do
    name {Faker::Commerce.department(1)}
  end

  # factory :user do
  #   User.create(username: 'tom', email: 'tom@tom.com', password: 'tomtom', first_name: 'Tom', last_name: 'Tomales', street_address: '123 Mission St.', city: 'San Francisco', state: 'CA', zipcode: 94102)
  # end

  # factory :admin do
  #   User.create(username: 'tim', email: 'tim@tim.com', password: 'timtim', first_name: 'Tim', last_name: 'Timales', street_address: '321 Howards St.', city: 'San Francisco', state: 'CA', zipcode: 94102)
  # end

  factory :product do
    name { Faker::Commerce.product_name }
    price { rand(50..900) }
    description { Faker::Company.catch_phrase }
    brand { Faker::Company.name }
    stock_count { rand(5..20) }
    img_url { Faker::Placeholdit.image("300x300", 'jpg') }
  end
end
