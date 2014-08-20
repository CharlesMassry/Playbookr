def fixture_file(path)
  File.open(Rails.root.join("spec", "asset_specs", path))
end

FactoryGirl.define do
  factory :photo_medium, class: Medium do
    file fixture_file("photos/photo.jpg")
    caption "Routes"
    play
  end

  factory :video_medium, class: Medium do
    file fixture_file("videos/video.MOV")
    caption "Cutting"
    play
  end
end
