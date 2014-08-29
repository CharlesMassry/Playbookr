require "rails_helper"

feature "A player sign up" do
  scenario "I can sign up with my token" do
    team = create(:team)
    token = create(:sign_up_token, team: team)
    player = build(:player)

    visit new_player_path
    fill_in "Email", with: player.email
    fill_in "Password", with: player.password_digest
    fill_in "Token", with: token.token
    click_button "Sign Up"

    expect(page).to have_content(player.email)
    expect(page).to have_link("Sign Out")
    expect(page).not_to have_link("Create team")
    expect(page).to have_content(team.name)
    expect(page.current_path).to eq("/teams/#{team.id}")
  end
end

feature "A malicious person" do
  scenario "Can not sign up for site" do
    visit new_player_path
    fill_in "Email", with: "malicious@person.com"
    fill_in "Password", with: "password"
    fill_in "Token", with: "notarealtoken"
    click_button "Sign Up"

    expect(page).not_to have_content("malicious@person.com")
    expect(page).not_to have_link("Sign Out")
    expect(page).not_to have_link("Create Team")
    expect(page).to have_selector("form")
  end
end
