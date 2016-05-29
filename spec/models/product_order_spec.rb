require 'rails_helper'

RSpec.describe ProductOrder, type: :model do
  it{ should belong_to(:order)}
  it{ should belong_to(:product)}
  it { should validate_presence_of(:number_of_items) }
  it { should validate_numericality_of(:number_of_items) }

end
