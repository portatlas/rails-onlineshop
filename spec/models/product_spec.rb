require 'rails_helper'

RSpec.describe Product, type: :model do
  describe Product do
    let(:product) { create :product }
    context "#save" do
      it "returns true" do
        expect{
          product.save
        }.to change(Product, :count).by(1)
      end

      it { should validate_presence_of :name }
      it { should validate_presence_of :price }
      it { should validate_presence_of :description }
      it { should validate_presence_of :stock_count }
      it { should validate_presence_of :img_url }
    end

    context "product should have many product_orders" do
      it { should have_many(:product_orders) }
    end

    context "product should have many orders" do
      it { should have_many(:orders).through(:product_orders) }
    end

  end
end
