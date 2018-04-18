require 'rails_helper'
describe CardActivityItem do
  context 'validations' do
    it { should validate_presence_of :card_activity }
    it { should validate_presence_of :user }
    it { should validate_presence_of :content }
  end

  context 'associations' do
    it { should belong_to :user }
    it { should belong_to :card_activity }
  end
end
