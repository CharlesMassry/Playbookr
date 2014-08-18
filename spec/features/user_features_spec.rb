require "rails_helper"

feature "As a user" do
  scenario "I can sign up for playbookr" do
    user = FactoryGirl.build(:coach)

    visit root_path

    click_link "Sign up"

    expect(page).to have_selector("form")

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password_digest
    click_button "Sign up"

    expect(page).to have_content(user.email)
    expect(User.find_by(email: user.email).email).
      to eq(user.email)
  end

  scenario "I can sign in to playbookr" do
    user = FactoryGirl.create(:coach)

    visit root_path

    click_link "Sign in"

    expect(page).to have_selector("form")

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password_digest
    click_button "Sign in"

    expect(page).to have_content(user.email)
    expect(User.find_by(email: user.email).email).
      to have_content(user.email)
  end
end
