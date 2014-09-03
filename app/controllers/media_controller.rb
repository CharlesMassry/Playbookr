class MediaController < ApplicationController
  before_filter :verify_team

  def new
    @play = find_play
    @team = find_team
    @medium = Medium.new
  end

  def create
    @play = find_play
    @team = find_team
    @medium = Medium.new_content(medium_params, @play)

    if @medium.save
      redirect_to [@team, @play]
    else
      flash[:alert] = "Invalid media"
      render :new
    end
  end

  private

  def find_team
    Team.find(params[:team_id])
  end

  def find_play
    Play.find(params[:play_id])
  end

  def medium_params
    params.
      require(:medium).
      permit(:file, :caption)
  end

  def verify_team
    if current_user.team != find_team
      flash[:error] = "You may only access your own team."
      redirect_to current_user.team
    end
  end
end
