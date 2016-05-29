require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe "Sessions resoures goes to the correct route" do
    it { should route(:get, '/login').to(action: :new) }
    it { should route(:post, '/login').to(action: :create) }
    it { should route(:get, '/logout').to(action: :destroy) }
  end
end
