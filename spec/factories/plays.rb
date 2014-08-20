FactoryGirl.define do
  factory :play do
    name "vert stack"
    description "players run in a vertical formation"
    association :team
  end
end
