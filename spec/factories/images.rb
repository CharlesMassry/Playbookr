def fixture_file(path)
  File.new("#{Rails.root}/spec/asset_specs/#{path}")
end

FactoryGirl.define do
  factory :image do
    file fixture_file("photos/photo.jpg")
  end
end
