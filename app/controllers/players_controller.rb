class PlayersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    token = find_token
    user = User.create_as_player(user_params, token)

    if user
      sign_in(user)
      redirect_to team_path(user.team)
    else
      @user = User.new
      render :new
    end
  end

  private

  def user_params
    params.
      require(:user).
      permit(:email, :password)
  end

  def token_params
    params.
      require(:sign_up_token).
      permit(:token)
  end

  def find_token
    SignUpToken.find_by(
      email: user_params[:email],
      token: token_params[:token]
    )
  end
end
