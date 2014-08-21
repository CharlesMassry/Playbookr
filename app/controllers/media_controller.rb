class MediaController < ApplicationController
  before_action :find_team_and_play

  def new
    @medium = Medium.new
  end

  def create
    @medium = Medium.create_content(medium_params, @play)

    if @medium
      redirect_to [@team, @play]
    else
      @medium = Medium.new
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
