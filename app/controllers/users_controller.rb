class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = sign_up(user_params)
    @user.update(role: "Coach")

    if @user.valid?
      sign_in(@user)
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    if current_user.coach?
      current_user.team.destroy
    end
    current_user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
