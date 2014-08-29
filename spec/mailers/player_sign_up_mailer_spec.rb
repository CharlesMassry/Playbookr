require "rails_helper"

describe PlayerSignUpMailer do
  before(:all) do
    @sign_up_token = create(:sign_up_token)
    @mail = PlayerSignUpMailer.invite(@sign_up_token)
  end

  it "should be set to be delivered to the email passed in" do
    expect(@mail).to deliver_to(@sign_up_token.email)
  end

  it "should contain the token in the mail body" do
    expect(@mail).to have_body_text(/#{@sign_up_token.token}/)
  end

  it "should contain a link to the player sign up page" do
    expect(@mail).to have_body_text(/#{new_player_url}/)
  end

  it "should have the correct subject" do
    expect(@mail).to have_subject(/You are invited to join #{@sign_up_token.team.name} on Playbookr!/)
  end
end
