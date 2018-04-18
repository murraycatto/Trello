# Factory for creating users
FactoryBot.define do
  factory :user do
    email 'test@example.com'
    name 'Testman'
    password 'Password123'
  end
end
