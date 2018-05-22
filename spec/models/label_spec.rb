require 'rails_helper'

RSpec.describe Label, type: :model do
  context 'validations' do
    it { should_not validate_presence_of :name }
  end
  context 'associations' do
    it { should belong_to :color }
    it { should belong_to :board }
  end
end
