class PlaysController < ApplicationController
  def new
    @team = find_team
    @play = Play.new
  end

  def create
    @team = find_team
    @play = Play.new(play_params)
    @play.team = @team

    if @play.save
      redirect_to [@team, @play]
    else
      flash[:alert] = "Invalid play"
      render :new
    end
  end

  def show
    @play = find_play
  end

  private

  def play_params
    params.require(:play).permit(:name, :description)
  end

  def find_play
    Play.find(params[:id])
  end

  def find_team
    Team.find(params[:team_id])
  end
end
