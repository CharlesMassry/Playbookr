# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :player_stat do
    association :team
    association :player
    stats ""
  end
end