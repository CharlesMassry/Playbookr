class PlayerSignUpMailer < ActionMailer::Base
  default from: "noreply@playbookr.us"

  def invite(sign_up_token)
    @sign_up_token = sign_up_token
    @url = new_player_url
    mail to: sign_up_token.email,
      subject: "You are invited to join #{sign_up_token.team.name} on Playbookr!"
  end
  handle_asynchronously :invite
end
