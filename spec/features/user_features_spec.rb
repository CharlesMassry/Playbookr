require "rails_helper"

feature "As a user" do
  scenario "I can sign up for playbookr" do
    visit root_path

    click_link "Sign up"

    expect(page).to have_selector("form")

    fill_in "Email", with: "wombat@example.com"
    fill_in "Password", with: "password"
    click_button "Sign up"

    expect(page).to have_content("wombat@example.com")
    expect(User.find_by(email: "wombat@example.com").email).to have_content("wombat@example.com")
  end
end
