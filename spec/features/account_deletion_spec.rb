require "rails_helper"

feature "Accout deletion" do
  scenario "When account is destroyed" do
    team = create(:team)
    user = create(:user, team: team)

    sign_in(user)
    visit root_path
    click_link user.email
    click_link "Delete Account"

    expect(page).to have_link("Sign up")
    expect(find_user(user)).to eq(nil)
  end
end
