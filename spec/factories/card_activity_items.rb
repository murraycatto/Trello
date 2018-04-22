# Factory for creating CardActivityItem
FactoryBot.define do
  factory :card_activity_item do
    user User.all.first
    content 'Test Content'
    card_activity
  end
end
