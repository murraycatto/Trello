# Factory for creating users
FactoryBot.define do
  factory :user do
    email 'test@example.com'
    name 'Testman'
    password 'Password123'
  end

  factory :random_user, class: User do
    email Faker::Internet.email
    name Faker::Name.name
    password Faker::Internet.password
  end
end
