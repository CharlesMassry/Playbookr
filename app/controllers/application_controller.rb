class ApplicationController < ActionController::Base
  include Monban::ControllerHelpers
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :require_login
  force_ssl if: :ssl_necessary?

  def verify_team
    if current_user.team != find_team
      flash[:error] = "You may only access your own team."
      redirect_to current_user.team
    end
  end

  def find_team
    nil
  end

  def verify_coach
    unless current_user.coach?
      flash[:error] = "You must be the coach to do that."
      redirect_to current_user.team
    end
  end

  def ssl_necessary?
    Rails.env.production?
  end
end
