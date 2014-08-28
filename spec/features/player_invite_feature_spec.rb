require "rails_helper"

feature "Send player invites" do
  scenario "invite players" do
    team = create(:team)
    user = create(:user, team: team)

    sign_in(user)
    visit new_team_player_invites_path(team)
    fill_in "Emails", with: "hello@wombat.com"
    click_button "Send Email Invites"

    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end
end
