require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe "Product resource goes to the correct route" do
    it { should route(:get, '/').to(action: :index) }
    it { should route(:get, '/products/1').to(action: :show, id: 1) }
    it { should route(:get, '/products/1/edit').to(action: :edit, id: 1) }
    it { should route(:patch, '/products/1').to(action: :update, id: 1) }
    it { should route(:get, '/products/new').to(action: :new) }
    it { should route(:post, '/products').to(action: :create) }
    it { should route(:delete, '/products/1').to(action: :destroy, id: 1) }
  end
end
