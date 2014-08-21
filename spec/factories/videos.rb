def fixture_file(path)
  File.new("#{Rails.root}/spec/asset_specs/#{path}")
end

FactoryGirl.define do
  factory :video do
    file fixture_file("videos/video.MOV")
  end
end
