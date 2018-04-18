require 'rails_helper'
describe Card do
  context 'validations' do
    it { should validate_presence_of :name }
  end

  context 'associations' do
    it { should belong_to :list }
    it { should have_many :card_activities }
    it { should have_many :checklists }
    it { should have_many(:card_comments).through :card_activities }
    it { should have_many(:card_activity_items).through :card_activities }
  end
end
