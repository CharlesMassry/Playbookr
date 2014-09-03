FactoryGirl.define do
  factory :team do
    name "Wombats"
  end

  factory :team2, class: Team do
    name "Wobbegongs"
  end
end
