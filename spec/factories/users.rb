FactoryBot.define do
  factory :user do
    name { "test" }
    sequence(:email) { |n| "tester#{n}@example.com" }
    password { "testuser" }
    password_confirmation { "testuser"}
    profile { "こんにちは" }
  end
end
