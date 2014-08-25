require "rails_helper"

feature "Comment creation" do

  before(:each) do
    @team = create(:team)
    @user = create(:user, team: @team)
    @play = create(:play, team: @team)
    @photo = create(:photo_medium, play: @play)
    sign_in(@user)
    visit team_play_path(@team, @play)
  end

  scenario "I can add a comment to plays"

  scenario "I can add a comment to media"

  scenario "I can add a comment to comments"
end
