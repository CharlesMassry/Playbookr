require "rails_helper"

feature "Verify team" do
  before(:each) do
    @team1 = create(:team)
    @team2 = create(:team2)
    @user = create(:user, team: @team1)
  end

  scenario "I can not visit another team's team page" do
    sign_in(@user)
    visit team_path(@team2)

    expect(page).to have_content(@team1.name)
  end

  scenario "I can not visit another team's play page" do
    play = create(:play, team: @team2)

    sign_in(@user)
    visit team_play_path(@team2, play)

    expect(page).to have_content(@team1.name)
  end

  scenario "I can not visit another team's new play page" do
    sign_in(@user)
    visit new_team_play_path(@team2)

    expect(page).to have_content(@team1.name)
  end

  scenario "I can not visit another team's player invite page" do
    sign_in(@user)
    visit new_team_player_invites_path(@team2)

    expect(page).to have_content(@team1.name)
  end

  scenario "I can not visit another team's new media page" do
    play = create(:play, team: @team2)

    sign_in(@user)
    visit new_team_play_medium_path(@team2, play)

    expect(page).to have_content(@team1.name)
  end
end
