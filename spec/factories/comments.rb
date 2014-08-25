FactoryGirl.define do
  factory :play_comment, class: Comment do
    body "Nice play"
    association :user
    association :commentable, factory: :play
  end

  factory :medium_comment, class: Comment do
    body "Cool file"
    association :user
    association :commentable, factory: :photo_medium
  end

  factory :comment_comment, class: Comment do
    body "I disagree"
    association :user
    association :commentable, factory: :play_comment
  end
end
