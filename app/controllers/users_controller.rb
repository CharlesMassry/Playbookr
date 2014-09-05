class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
    @amount = PaymentGateway::AMOUNT
  end

  def create
    token = params[:stripeToken]
    @user = User.new
    @amount = PaymentGateway::AMOUNT

    begin
      @user = User.create_customer(user_params, token)
    rescue Stripe::CardError => e
      @user.errors.add :base, e.message
    rescue Stripe::StripeError => e
      logger.error e.message
      @user.errors.add :base, "There was a problem with your credit card"
    end

    if @user.valid?
      sign_in(@user)
      redirect_to new_team_path, notice: "Signed up!"
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
