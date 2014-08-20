require "rails_helper"

feature "Media creation" do
  before(:each) do
    @team = create(:team)
    @user = create(:user, team: @team)
    @play = create(:play, team: @team)
  end

  scenario "I can add a photo to plays" do
    medium = build(:photo_medium)

    sign_in(@user)
    visit team_play_path(@team, @play)
    click_link "Add photo or video"
    attach_file "File", "spec/asset_specs/photos/photo.jpg"
    fill_in "Caption", with: medium.caption
    click_button "Add photo or video"

    expect(page).to have_selector("img")
  end

  scenario "I can add a video to plays" do
    medium = build(:video_medium)

    sign_in(@user)
    visit team_play_path(@team, @play)
    click_link "Add photo or video"
    attach_file "File", "spec/asset_specs/videos/video.MOV"
    fill_in "Caption", with: medium.caption
    click_button "Add photo or video"

    expect(page).to have_selector("video")
  end
end