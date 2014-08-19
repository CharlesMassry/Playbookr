require "rails_helper"

feature "As a user" do
  scenario "I can add plays to my team" do
    team = FactoryGirl.create(:team)
    user = FactoryGirl.create(:user, team: team)
    play = FactoryGirl.build(:play)

    sign_in(user)
    visit team_path(team)

    click_link "Add Play"
    fill_in "Name", with: play.name
    fill_in "Description", with: play.description
    click_button "Add play"

    expect(page).to have_content(play.name)
    expect(page).to have_content(play.description)
  end
end
