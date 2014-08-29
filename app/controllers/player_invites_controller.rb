class PlayerInvitesController < ApplicationController
  def new
    @team = find_team
  end

  def create
    team = find_team
    email_addresses = PlayerEmailCollection.new(
      player_invites_params[:emails]
    )

    email_addresses.each do |email_address|
      token = SignUpToken.create_token(email_address, team)
      PlayerSignUpMailer.delay.invite(token)
    end

    flash[:notice] = "Email invites sent"
    redirect_to current_user.team
  end

  private

  def player_invites_params
    params.
      require(:players).
      permit(:emails)
  end

  def find_team
    Team.find(params[:team_id])
  end
end
