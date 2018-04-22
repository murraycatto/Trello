# Factory for creating board
FactoryBot.define do
  factory :board do
    name 'Test Board'
    user User.all.first
    color
    team
  end
end
