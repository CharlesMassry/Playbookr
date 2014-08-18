FactoryGirl.define do
  factory :coach, class: User do
    email "coach@myteam.com"
    password_digest "password"
  end
end
