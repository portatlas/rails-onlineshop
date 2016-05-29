require 'rails_helper'

RSpec.describe Category, type: :model do
  it { should validate_uniqueness_of(:name) }
  it { should have_many(:category_products) }
  it { should have_many(:products).through(:category_products) }
end
