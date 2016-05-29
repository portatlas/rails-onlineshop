require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should have_many(:product_orders) }
  it { should have_many(:products).through(:product_orders) }
  it { should belong_to(:user) }
  it { should belong_to(:order_status) }
end
