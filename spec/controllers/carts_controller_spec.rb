require 'rails_helper'

RSpec.describe CartsController, type: :controller do

  describe "Cart resources goes to the correct route" do
    it { should route(:get, '/checkout').to(action: :checkout) }
    it { should route(:get, '/cart').to(action: :show) }
  end

end
