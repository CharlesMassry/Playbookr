require "rails_helper"

feature "As a user" do
  scenario "I can sign up for playbookr" do
    user = FactoryGirl.build(:user)

    visit root_path

    click_link "Sign up"

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password_digest
    click_button "Sign up"

    expect(page).to have_content(user.email)
    expect(find_user(user).email).to eq(user.email)
  end

  scenario "I can sign in to playbookr" do
    user = FactoryGirl.create(:user)

    visit root_path

    click_link "Sign in"

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password_digest
    click_button "Sign in"

    expect(page).to have_content(user.email)
    expect(find_user(user)).to eq(user)
  end
end

def find_user(user)
  User.find_by(email: user.email)
end
