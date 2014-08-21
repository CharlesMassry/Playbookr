class MediaController < ApplicationController
  before_action :find_team_and_play

  def new
    @medium = Medium.new
  end

  def create
    @medium = Medium.new_content(medium_params, @play)

    if @medium.save
      redirect_to [@team, @play]
    else
      flash[:alert] = "Invalid media"
      render :new
    end
  end

  private

  def find_team_and_play
    @play = find_play
    @team = find_team
  end

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
end
