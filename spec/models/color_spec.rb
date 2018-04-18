require 'rails_helper'
describe Color do
  context 'validations' do
    it { should validate_presence_of :name }
  end

  context 'associations' do
    it { should have_many :boards }
  end
end
