require 'rails_helper'
describe Board do
  context 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :user }
    it { should validate_presence_of :team }
    it { should validate_presence_of :color }
  end

  context 'associations' do
    it { should belong_to :user }
    it { should belong_to :team }
    it { should belong_to :color }
    it { should have_many(:cards).through :lists }
    it { should have_many(:lists) }
  end
end
