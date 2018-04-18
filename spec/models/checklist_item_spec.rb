require 'rails_helper'
describe ChecklistItem do
  context 'validations' do
    it { should validate_presence_of :status }
  end

  context 'associations' do
    it { should belong_to :checklist }
  end
end
