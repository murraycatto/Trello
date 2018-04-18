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
end
