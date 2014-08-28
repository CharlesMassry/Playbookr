FactoryGirl.define do
  factory :sign_up_token do
    email "hello@wombat.com"
    token "zQsNY5vj0tCWCiTXzSrOJg"
    association :team
  end
end
