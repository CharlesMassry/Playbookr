require "rails_helper"

feature "As a user" do
  scenario "I can sign up for playbookr" do
    user = build(:user)

    visit root_path
    click_link "Sign up"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password_digest
    click_button "Sign Up"

    expect(page).to have_content(user.email)
    expect(find_user(user).email).to eq(user.email)
  end

  scenario "I can sign in to playbookr" do
    user = create(:user)

    visit root_path
    click_link "Sign in"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password_digest
    click_button "Sign In"

    expect(page).to have_content(user.email)
    expect(find_user(user)).to eq(user)
  end

  scenario "I can sign out" do
    user = create(:user)

    sign_in(user)
    visit root_path
    click_link "Sign Out"

    expect(page).not_to have_content(user.email)
    expect(page).to have_link("Sign in")
    expect(page).to have_link("Sign up")
  end
end
