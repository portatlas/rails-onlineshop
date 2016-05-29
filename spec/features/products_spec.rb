require 'rails_helper'
require 'support/macros'

RSpec.feature "Show, Add, Edit, Delete Products", type: :feature, :js => true do

  let!(:product) { FactoryGirl.create :product }
  let!(:admin) {User.create(username: 'tim', email: 'tim@tim.com', password: 'timtim', first_name: 'Tim', last_name: 'Timales', street_address: '321 Howards St.', city: 'San Francisco', state: 'CA', zipcode: 94102)}
  before(:each) do
    @admin = User.create(username: 'tim', email: 'tim@tim.com', password: 'timtim', first_name: 'Tim', last_name: 'Timales', street_address: '321 Howards St.', city: 'San Francisco', state: 'CA', zipcode: 94102)
    page.set_rack_session(id: @admin.id)
  end

  describe "logging in" do
   it "users can log in" do
     visit login_path
     fill_in "Username", :with => admin.username
     fill_in "Password", :with => admin.password
     click_button "Log in"
     expect(page).to have_content("All Products")
   end
  end

  it "Show header Products" do
    visit products_path
    expect(page).to have_content("Products")
  end

  # it "Shows a list of products" do
  #   visit products_path
  #   expect(page).to have_content(product.name)
  # end

  # context "Add New Product" do
  #   it "creates a new product with the form" do
  #       visit new_product_path
  #       find("#product_name").set "T-shirt"
  #       find("#product_img_url").set "https://placeholdit.imgix.net/~text?txtsize=28&bg=000000&txt=300%C3%97300&w=300&h=300&fm=jpg"
  #       find("#product_description").set "Red"
  #       find("#product_price").set "100"
  #       find("#product_stock_count").set "3"
  #       click_on('Create Product')
  #       expect(page).to have_content("T-shirt")
  #   end
  # end

  # describe "edit product" do
  #   before(:each) do
  #     visit edit_product_path(product.id)
  #   end
  #   it "displays a form and updates an existing product" do
  #     new_name = "Howby Bowby"
  #     fill_in "product_name", with: new_name
  #     click_on('Update Product')
  #     expect(page).to have_content(new_name)
  #   end
  # end

  describe "delete product" do
    it "has a button that deletes the product" do
      visit admin_index_path
      click_on('Delete')
      expect(page).to_not have_content(product.name)
    end
  end

end
