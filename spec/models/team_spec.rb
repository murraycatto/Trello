require 'rails_helper'
describe Team do
  context 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :user }
  end
  context 'associations' do
    it { should have_many :boards }
    it { should belong_to :user }
  end
end
