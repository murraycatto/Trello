require 'rails_helper'
describe CardActivity do
  context 'validations' do
    it { should validate_presence_of :card_comment }
    it { should validate_presence_of :card_activity_item }
  end

  context 'associations' do
    it { should belong_to :card }
    it { should have_one :card_comment }
    it { should have_one :card_activity_item }
  end
end
