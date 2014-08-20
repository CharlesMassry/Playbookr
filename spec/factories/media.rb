FactoryGirl.define do
  factory :photo_medium, class: Medium do
    association :content, factory: :image
    caption "Routes"
    association :play
  end

  factory :video_medium, class: Medium do
    association :content, factory: :video
    caption "Cutting"
    association :play
  end
end
