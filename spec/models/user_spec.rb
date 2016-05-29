require 'rails_helper'

RSpec.describe User, type: :model do
  describe User do
    let(:user) { User.create(username: 'tom', email: 'tom@tom.com', password: 'tomtom', first_name: 'Tom', last_name: 'Tomales', street_address: '123 Mission St.', city: 'San Francisco', state: 'CA', zipcode: 94102) }
    context "#save" do
      it "returns true" do
        expect{
          user.save
          }.to change(User, :count).by(1)
        end
        it { should validate_presence_of :username }
        it { should validate_presence_of :email }
        it { should validate_presence_of :first_name }
        it { should validate_presence_of :last_name }
        it { should validate_presence_of :password }
      end
    end
  end
