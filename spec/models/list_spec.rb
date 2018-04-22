require 'rails_helper'
describe List do
  context 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :board }
  end

  context 'associations'  do
    it { should belong_to :board }
    it { should have_many :cards }
  end
end
