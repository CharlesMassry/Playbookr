class TeamsController < ApplicationController
  before_filter :verify_team, only: [:show]

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)

    if @team.save
      current_user.update(team: @team)
      redirect_to @team
    else
      flash[:error] = "Invalid Team"
      render :new
    end
  end

  def show
    @team = find_team
  end

  private

  def find_team
    Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name)
  end

  def verify_team
    if current_user.team != find_team
      flash[:error] = "You may only access your own team."
      redirect_to current_user.team
    end
  end
end
