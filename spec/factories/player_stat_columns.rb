FactoryGirl.define do
  factory :player_stat_column do
    names ["HR", "BA"]
    association :team
  end
end
