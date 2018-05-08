# Factory for creating checklist items
FactoryBot.define do
  factory :checklist_item do
    name 'Test Checklist Item'
    checklist
  end
end
