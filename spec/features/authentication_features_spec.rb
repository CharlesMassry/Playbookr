require "rails_helper"

feature "As a user" do
  before(:each) do
    @user = create(:user)
  end
  scenario "I can sign in to playbookr" do
    visit root_path
    click_link "Sign in"
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password_digest
    click_button "Sign In"

    expect(page).to have_content(@user.email)
    expect(find_user(@user)).to eq(@user)
  end

  scenario "I can sign out" do
    sign_in(@user)
    visit root_path
    click_link "Sign Out"

    expect(page).not_to have_content(@user.email)
    expect(page).to have_link("Sign in")
    expect(page).to have_link("Sign up")
  end
end
