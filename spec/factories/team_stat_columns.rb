# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :team_stat_column do
    column_names ["HR", "BA"]
    association :team
  end
end
