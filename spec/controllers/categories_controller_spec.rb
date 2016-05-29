require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  describe "Category resource goes to the correct route" do
     it { should route(:get, '/categories').to(action: :index) }
     it { should route(:post, '/categories').to(action: :create) }
     it { should route(:get, '/categories/new').to(action: :new) }
     it { should route(:get, '/categories/6').to(action: :show, id: 6) }
  end
end
