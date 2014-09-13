FactoryGirl.define do
  factory :player_stat do
    association :team
    association :player, factory: :user
    stats '{ "HR": 24, "BA": 0.3 }'
  end
end
