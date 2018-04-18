require 'rails_helper'
describe User do
  context 'validations' do
    it { should validate_presence_of :email }
    it { should validate_presence_of :name }
  end
  context 'associations' do
    it { should have_many :boards }
    it { should have_many :teams }
    it { should have_many :card_comments }
    it { should have_many :card_activity_items }
    it { should have_many(:card_comment_activities).through(:card_comments) }
    it { should have_many(:card_activities).through(:card_activity_items) }
  end
  context '#create_personal_team' do
    it 'creates a personal team for the user after create' do
      user = create(:user)
      expect do
        user.teams.count to eq(1)
        user.teams.first.name to eq('Personal Boards')
      end
    end
  end
end
