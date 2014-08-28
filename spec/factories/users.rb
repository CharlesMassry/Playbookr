FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "wombat#{n}@example.com" }
    password_digest "password"
  end

  factory :player, class: User do
    email "hello@wombat.com"
    password_digest "password"
  end
end
