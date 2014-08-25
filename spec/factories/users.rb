FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "wombat#{n}@example.com" }
    password_digest "password"
  end
end
