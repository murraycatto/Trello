require 'rails_helper'
describe CardActivity do
  context 'associations' do
    it { should belong_to :card }
    it { should have_one :card_comment }
    it { should have_one :card_activity_item }
  end
end
