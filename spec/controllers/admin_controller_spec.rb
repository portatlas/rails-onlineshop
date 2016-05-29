require 'rails_helper'

RSpec.describe AdminController, type: :controller do
  describe "Admin resources goes to the correct route" do
    it { should route(:get, '/admin').to(action: :index) }
  end
end
