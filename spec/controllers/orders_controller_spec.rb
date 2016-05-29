require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  describe "Order resoures goes to the correct route" do
    it { should route(:get, '/orders').to(action: :index) }
    it { should route(:get, '/orders/1').to(action: :show, id: 1) }
  end
end
