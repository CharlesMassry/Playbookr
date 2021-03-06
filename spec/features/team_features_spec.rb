require "rails_helper"

feature "Team creation" do
  scenario "I can create a team if I don't have one" do
    team = build(:team)
    user = create(:user)

    sign_in(user)
    visit root_path
    click_link "Create team"
    fill_in "Team Name", with: team.name
    click_button "Create Team"

    expect(page).to have_content(team.name)
  end

  scenario "I cannot create a team if I have one" do
    team = create(:team)
    user = create(:user, team: team)

    sign_in(user)
    visit root_path

    expect(page).not_to have_link("Create team")
  end
end
