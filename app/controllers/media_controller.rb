class MediaController < ApplicationController
  before_filter :verify_team
  before_action :verify_coach

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

  def destroy
    @medium = find_medium
    @medium.destroy
  end

  private

  def find_medium
    Medium.find(params[:id])
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
