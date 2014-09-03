require "rails_helper"

feature "When logged in as a player" do
  before(:each) do
    @team = create(:team)
    @user = create(:player, team: @team)
  end

  scenario "I can not create a new play" do
    sign_in(@user)
    visit team_path(@team)

    expect(page).not_to have_link("Add play")
  end

  scenario "I can not invite players to join my team" do
    sign_in(@user)
    visit team_path(@team)

    expect(page).not_to have_link("Add players")
  end

  scenario "I can not add media to plays" do
    play = create(:play)

    sign_in(@user)
    visit team_play_path(@team, play)

    expect(page).not_to have_link("Add photo or video")
  end
end
