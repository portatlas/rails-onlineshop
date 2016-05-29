require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "Sessions resoures goes to the correct route" do
    it { should route(:get, '/users/1').to(action: :show, id: 1) }
    it { should route(:get, '/users/new').to(action: :new) }
    it { should route(:post, '/users').to(action: :create) }
  end
end
