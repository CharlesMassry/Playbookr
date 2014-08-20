class MediaController < ApplicationController
  def new
    @medium = Medium.new
    @play = find_play
    @team = find_team
  end

  def create
    @medium = Medium.new(medium_params)

    if @medium.save
      redirect_to [@medium.team, @medium.play]
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
      permit(:file, :caption).
      merge(play: find_play)
  end
end
