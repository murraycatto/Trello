require 'rails_helper'

RSpec.describe CardLabel, type: :model do
  context 'associations' do
    it { should belong_to :card }
    it { should belong_to :label }
  end
end
