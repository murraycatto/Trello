require 'rails_helper'
describe Checklist do
  context 'validations' do
    it { should validate_presence_of :title }
  end

  context 'associations' do
    it { should belong_to :card }
    it { should have_many :checklist_items }
  end
end
