class ApplicationController < ActionController::Base
  include Monban::ControllerHelpers
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :require_login

  def check_coach
    unless current_user.coach?
      flash[:error] = "You must be the coach to do that."
      redirect_to current_user.team
    end
  end
end
