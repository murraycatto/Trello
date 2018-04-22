# Factory for creating team
FactoryBot.define do
  factory :team do
    name 'Test Team'
    user User.all.first
  end
end
