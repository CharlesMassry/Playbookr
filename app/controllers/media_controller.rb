class MediaController < ApplicationController
  def new
    @medium = Medium.new
    @play = find_play
    @team = find_team
  end

  def create
    @play = find_play
    @team = find_team
    @medium = Medium.new_content(medium_params, @play)

    if @medium
      redirect_to [@team, @play]
    else
      @medium = Medium.new
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
end
