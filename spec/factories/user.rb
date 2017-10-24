FactoryBot.define do
  factory :user do
    sequence :email { |n| "adam#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end
end
